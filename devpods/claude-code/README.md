# Claude Code DevPod Configuration

This directory contains the complete configuration for setting up a Claude Code development environment with 600+ specialized AI agents using DevPod.

## What's Included

### Configuration Files
- **devcontainer.json** - DevContainer configuration with all features, extensions, and auto-launch settings
- **setup.sh** - Automated setup script that installs all tools and 600+ Claude agents
- **tmux-workspace.sh** - Creates a 4-window tmux session optimized for Claude development
- **additional-agents/** - Directory containing custom agents not in the main collection

### Installed Features
- **Docker-in-Docker** - Run containers inside your development container
- **Node.js and npm** - JavaScript runtime and package manager
- **Rust 1.70** - Systems programming language
- **tmux** - Terminal multiplexer with pre-configured workspace
- **Claude Code CLI** (`@anthropic-ai/claude-code`) - Official Claude development tools
- **Claude Usage CLI** (`claude-usage-cli`) - Monitor Claude API usage
- **Claude Flow** - SPARC workflow automation with 54+ built-in agents
- **600+ Specialized Agents** - From the 610ClaudeSubagents repository plus custom additions

### VSCode Extensions (Auto-installed)
- Roo Cline - AI pair programming
- Gist FS - GitHub Gist integration
- GitHub Copilot - AI code completion
- GitHub Copilot Chat - AI chat interface

## Quick Start

### 1. Create DevPod Workspace
```bash
devpod up https://github.com/marcuspat/agentists-quickstart --devcontainer-path devpods/claude-code/devcontainer.json --ide vscode
```

This single command:
- Creates a DigitalOcean droplet (VM)
- Builds a Docker container with all features
- Installs all tools and 600+ agents
- Configures the development environment
- Opens VSCode connected to the container

### 2. Automatic Setup
When VSCode opens, a terminal will automatically launch with tmux configured with 4 windows:
- **Window 0 (Claude-1)**: Primary Claude workspace
- **Window 1 (Claude-2)**: Secondary Claude workspace
- **Window 2 (Claude-Meter)**: Running `claude-usage-cli` for usage monitoring
- **Window 3 (htop)**: System resource monitor

### 3. Using Claude Agents
```bash
# List all available agents
ls /workspaces/agentists-quickstart/agents/*.md | wc -l

# Search for specific agents
ls /workspaces/agentists-quickstart/agents/*test*.md

# Tell Claude to use agents
"Look in /workspaces/agentists-quickstart/agents/ and select the best agents for [task]"

# Load a specific agent
cat /workspaces/agentists-quickstart/agents/doc-planner.md
```

## Cost Optimization

### Recommended Droplet Sizes
```bash
# Before creating workspace, configure size:

# 2GB RAM ($12/month) - Good for most development
devpod provider update digitalocean --option DROPLET_SIZE=s-2vcpu-2gb

# 4GB RAM ($24/month) - For memory-intensive work
devpod provider update digitalocean --option DROPLET_SIZE=s-2vcpu-4gb

# Current default: 8GB RAM ($48/month)
```

### Save Money When Not Working
```bash
# Stop workspace (preserves everything, stops billing for compute)
devpod stop agentists-quickstart

# Resume workspace
devpod up agentists-quickstart --ide vscode
```

## File Structure
```
devpods/claude-code/
├── devcontainer.json      # Container configuration
├── setup.sh              # Automated setup script
├── tmux-workspace.sh     # Tmux session creator
├── README.md            # This file
└── additional-agents/   # Custom agents directory
    ├── doc-planner.md
    └── microtask-breakdown.md
```

## After Setup
Your workspace will have:
```
/workspaces/agentists-quickstart/
├── agents/                    # 600+ AI agents
│   ├── doc-planner.md
│   ├── microtask-breakdown.md
│   └── ... (600+ more)
├── claude.md                  # Claude configuration
├── claude-flow               # SPARC workflow tools
└── [your project files]
```

## Key Commands

### DevPod Management
```bash
# List workspaces
devpod list

# SSH into workspace
devpod ssh agentists-quickstart

# Delete workspace completely
devpod delete agentists-quickstart --force
```

### Tmux Navigation
- `Ctrl+b` then `0-3`: Switch between windows
- `Ctrl+b` then `n`: Next window
- `Ctrl+b` then `p`: Previous window
- `Ctrl+b` then `d`: Detach from session
- `tmux attach -t workspace`: Reattach to session

### Verification Commands
```bash
# Quick system check
echo "Agents: $(ls -1 /workspaces/agentists-quickstart/agents/*.md | wc -l)"
which claude-code && echo "Claude Code: ✓"
which claude-usage-cli && echo "Claude Usage: ✓"
tmux -V && echo "Tmux: ✓"
```

## Architecture Overview
```
Your Computer
    ↓ (DevPod CLI)
DigitalOcean Droplet (VM)
    ├── Docker Engine
    └── DevContainer
         ├── Your Code
         ├── 600+ AI Agents
         ├── Development Tools
         ├── Docker-in-Docker
         └── VSCode Server
              ↓
         Your VSCode (connected)
```

## Troubleshooting

### Permission Issues
```bash
# Fix DevPod permissions
sudo chown -R $(whoami):staff ~/.devpod
chmod +x ~/.devpod/contexts/default/providers/digitalocean/binaries/do_provider/*
```

### Connection Issues
1. Close VSCode completely: `killall "Code"`
2. Retry: `devpod up agentists-quickstart --ide vscode`

### Verify Agent Installation
```bash
# Check specific agents exist
ls -la /workspaces/agentists-quickstart/agents/doc-planner.md
ls -la /workspaces/agentists-quickstart/agents/microtask-breakdown.md
```

## Updates and Maintenance

To update the setup (new agents, tools, etc.):
1. Modify files in this directory
2. Commit and push to repository
3. Recreate workspace to apply changes

## Resources
- [DevPod Documentation](https://devpod.sh/docs)
- [Claude Flow SPARC](https://github.com/ruvnet/claude-flow)
- [610ClaudeSubagents Repository](https://github.com/ChrisRoyse/610ClaudeSubagents) - The source of 600+ specialized Claude agents
- [Claude Usage Monitor CLI](https://github.com/jedarden/claude-usage-monitor-cli) - Track your Claude API usage (Note: We use the npm version `claude-usage-cli`)

### Agent Categories Available
The agents cover a wide range of capabilities including:
- **Development**: Code review, test generation, debugging, refactoring
- **Documentation**: Technical writing, API docs, user guides
- **Architecture**: System design, database modeling, scalability planning
- **Security**: Vulnerability scanning, penetration testing, compliance
- **Performance**: Optimization, profiling, bottleneck analysis
- **Project Management**: Planning, estimation, risk assessment
- **Data Science**: Analysis, visualization, ML model development
- **DevOps**: CI/CD, infrastructure as code, monitoring
- **Business Strategy**: Market analysis, competitive intelligence, growth planning
- **Creative**: Content creation, brainstorming, innovation workshops
- **And 500+ more specialized roles**

### Basic Agent Commands
```bash
# List all available agents
ls /workspaces/agentists-quickstart/agents/*.md | wc -l

# Search for specific agents
ls /workspaces/agentists-quickstart/agents/*test*.md

# Load a specific agent
cat /workspaces/agentists-quickstart/agents/doc-planner.md
```

---

**Note**: This setup provides a complete Claude development environment with extensive AI agent capabilities. The 600+ agents cover everything from code review to test generation, documentation planning to performance optimization.
