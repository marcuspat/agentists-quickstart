#!/bin/bash
# Post-setup configuration
echo "Running post-setup configuration..."

# Install uv if not already installed
echo "Installing uv package manager..."
curl -LsSf https://astral.sh/uv/install.sh | sh

# Source the uv env to make it available immediately
source $HOME/.cargo/env

# Install Claude Monitor using uv
echo "Installing Claude Code Usage Monitor..."
uv tool install claude-monitor

# Verify installation
if command -v claude-monitor >/dev/null 2>&1; then
    echo "✅ Claude Monitor installed successfully"
else
    echo "❌ Claude Monitor installation failed"
fi

# Delete existing claude.md and copy CLAUDE.md to overwrite it
if [ -f "/workspaces/agentists-quickstart/devpods/claude-code/CLAUDE.md" ]; then
    # Delete existing claude.md if it exists
    if [ -f "/workspaces/agentists-quickstart/claude.md" ]; then
        rm "/workspaces/agentists-quickstart/claude.md"
        echo "✅ Deleted existing claude.md"
    fi
    
    # Copy CLAUDE.md as claude.md
    cp "/workspaces/agentists-quickstart/devpods/claude-code/CLAUDE.md" "/workspaces/agentists-quickstart/claude.md"
    echo "✅ Copied CLAUDE.md to workspace root as claude.md"
else
    echo "⚠️  CLAUDE.md not found in devpods/claude-code/"
fi

# Copy additional agents
AGENTS_DIR="/workspaces/agentists-quickstart/agents"
ADDITIONAL_AGENTS_DIR="/workspaces/agentists-quickstart/devpods/claude-code/additional-agents"

if [ -d "$ADDITIONAL_AGENTS_DIR" ]; then
    echo "Copying additional agents..."
    
    # Copy doc-planner.md
    if [ -f "$ADDITIONAL_AGENTS_DIR/doc-planner.md" ]; then
        cp "$ADDITIONAL_AGENTS_DIR/doc-planner.md" "$AGENTS_DIR/"
        echo "✅ Copied doc-planner.md"
    fi
    
    # Copy microtask-breakdown.md
    if [ -f "$ADDITIONAL_AGENTS_DIR/microtask-breakdown.md" ]; then
        cp "$ADDITIONAL_AGENTS_DIR/microtask-breakdown.md" "$AGENTS_DIR/"
        echo "✅ Copied microtask-breakdown.md"
    fi
else
    echo "⚠️  Additional agents directory not found"
fi

echo "✅ Post-setup complete!"

# Now start tmux workspace
echo "Starting tmux workspace..."

# Kill existing session if it exists
tmux kill-session -t workspace 2>/dev/null || true

# Create new session with first window for Claude
tmux new-session -d -s workspace -n "Claude-1"

# Create second window for Claude
tmux new-window -t workspace:1 -n "Claude-2"

# Create third window for Claude monitor
tmux new-window -t workspace:2 -n "Claude-Monitor"

# Start Claude Monitor with Pro plan and Mexico City timezone
tmux send-keys -t workspace:2 "TZ='America/Mexico_City' claude-monitor --plan pro" C-m

# Create fourth window for htop
tmux new-window -t workspace:3 -n "htop"
tmux send-keys -t workspace:3 "htop" C-m

# Select the first window
tmux select-window -t workspace:0

# Attach to the session
tmux attach-session -t workspace
