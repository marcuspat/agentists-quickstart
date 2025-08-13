#!/bin/bash

# Kill existing session if it exists
tmux kill-session -t workspace 2>/dev/null || true

# Create new session with first window for Claude
tmux new-session -d -s workspace -n "Claude-1"

# Create second window for Claude
tmux new-window -t workspace:1 -n "Claude-2"

# Create third window for Claude monitor
tmux new-window -t workspace:2 -n "Claude-Monitor"
tmux send-keys -t workspace:2 "claude-monitor" C-m

# Create fourth window for htop
tmux new-window -t workspace:3 -n "htop"
tmux send-keys -t workspace:3 "htop" C-m

# Select the first window
tmux select-window -t workspace:0

# Attach to the session
tmux attach-session -t workspace
