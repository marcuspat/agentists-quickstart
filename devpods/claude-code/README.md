# Claude Code DevPod Configuration

This directory contains the configuration files for setting up a Claude Code development environment using DevPod.

## Files

- **devcontainer.json** - DevContainer configuration with all features and extensions
- **setup.sh** - Main setup script that installs all tools and configures the environment
- **tmux-workspace.sh** - Creates a 4-window tmux session for Claude development
- **doc-planner.md** - Documentation planning agent (optional, if you want to include it)
- **microtask-breakdown.md** - Microtask breakdown agent (optional, if you want to include it)

## Features

### Installed Tools
- Docker-in-Docker support
- Node.js and npm
- Rust 1.70
- tmux
- Claude Code CLI (`@anthropic-ai/claude-code`)
- Claude Usage CLI (`claude-usage-cli`)
- Claude Flow with SPARC workflow
- 54+ specialized Claude subagents

### VSCode Extensions
- Roo Cline
- Gist FS
- GitHub Copilot
- GitHub Copilot Chat

### Auto-Configuration
- Tmux workspace with 4 windows (2 for Claude, 1 for usage meter, 1 for htop)
- Claude Flow initialized in project directory
- Comprehensive claude.md configuration file
- All subagents from the 610ClaudeSubagents repository

## Usage

1. Create a new DevPod workspace:
   ```bash
   devpod up https://github.com/marcuspat/agentists-quickstart --devcontainer-path devpods/claude-code/devcontainer.json --ide vscode
   ```

2. The setup will automatically:
   - Install all required tools
   - Clone and install Claude subagents
   - Configure tmux workspace
   - Open VSCode with the workspace

3. When VSCode opens, the terminal will automatically launch tmux with 4 pre-configured windows

## Customization

### Droplet Size (DigitalOcean)
For cost optimization, configure before creating workspace:
```bash
# 2GB RAM ($12/month)
devpod provider update digitalocean --option DROPLET_SIZE=s-2vcpu-2gb

# 4GB RAM ($24/month)
devpod provider update digitalocean --option DROPLET_SIZE=s-2vcpu-4gb
```

### Stop/Start Workspace
To save costs when not in use:
```bash
# Stop workspace
devpod stop agentists-quickstart

# Start workspace
devpod up agentists-quickstart --ide vscode
```

## Tmux Navigation
- `Ctrl+b` then `0-3` to switch between windows
- `Ctrl+b` then `n` for next window
- `Ctrl+b` then `p` for previous window
- `Ctrl+b` then `d` to detach from session
