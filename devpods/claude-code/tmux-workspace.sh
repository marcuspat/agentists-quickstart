#!/bin/bash

# Kill existing session if it exists
tmux kill-session -t workspace 2>/dev/null || true

# Create new session with first window for Claude
tmux new-session -d -s workspace -n "Claude-1"

# Display CLAUDE.md content on startup in first window
tmux send-keys -t workspace:0 "clear && echo '🚀 Claude Development Environment Ready!' && echo '' && echo 'Press ENTER to view CLAUDE.md configuration...'" C-m
tmux send-keys -t workspace:0 "read -p '' && clear && cat /workspaces/agentists-quickstart/CLAUDE.md | less" C-m

# Create second window for Claude
tmux new-window -t workspace:1 -n "Claude-2"
tmux send-keys -t workspace:1 "echo '📋 Claude Secondary Workspace - Ready for parallel tasks'" C-m

# Create third window for Claude Monitor (advanced version with ML predictions)
tmux new-window -t workspace:2 -n "Claude-Monitor"
tmux send-keys -t workspace:2 "# Starting Claude Monitor with ML predictions and analytics..." C-m
tmux send-keys -t workspace:2 "# Advanced monitoring by @Maciek-roboblog" C-m
tmux send-keys -t workspace:2 "claude-monitor" C-m

# Create fourth window for htop
tmux new-window -t workspace:3 -n "htop"
tmux send-keys -t workspace:3 "htop" C-m

# Select the first window
tmux select-window -t workspace:0

# Set status bar with helpful info
tmux set -t workspace status-left-length 50
tmux set -t workspace status-right-length 100
tmux set -t workspace status-left "#[fg=green,bold]Claude DevPod #[fg=yellow]| "
tmux set -t workspace status-right "#[fg=cyan]Doc-Planner & Microtask REQUIRED #[fg=white]| #[fg=green]%Y-%m-%d %H:%M"

# Attach to the session
tmux attach-session -t workspace
