#!/bin/bash
set -e

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

# Copy CLAUDE.md to overwrite the existing claude.md
if [ -f "/workspaces/agentists-quickstart/devpods/claude-code/CLAUDE.md" ]; then
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

# Start tmux workspace
echo "Starting tmux workspace..."
bash /workspaces/agentists-quickstart/devpods/claude-code/tmux-workspace.sh
