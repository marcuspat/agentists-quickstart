#!/bin/bash
set -ex  # Add -x for debugging output

# Update and install packages
sudo apt-get update
sudo apt-get install -y tmux

# Install npm packages
npm install -g @anthropic-ai/claude-code

# Install claude-monitor from npm (simpler than the Python version)
npm install -g claude-monitor

# Initialize claude-flow in the project directory
cd /workspaces/agentists-quickstart
npx claude-flow@alpha init --force

# Install Claude subagents
echo "Installing Claude subagents..."
AGENTS_DIR="/workspaces/agentists-quickstart/agents"
mkdir -p "$AGENTS_DIR"
cd "$AGENTS_DIR"
git clone https://github.com/ChrisRoyse/610ClaudeSubagents.git temp-agents
cp -r temp-agents/agents/*.md .
rm -rf temp-agents

# Copy the two additional agents if they're included in the repo
# (doc-planner.md and microtask-breakdown.md from the paste)
# These will be handled if needed

echo "Installed $(ls -1 *.md | wc -l) agents in $AGENTS_DIR"
cd /workspaces/agentists-quickstart

# Create claude.md file
cat << 'EOF' > claude.md
# Claude Code Configuration - SPARC Development Environment

## 🚀 SESSION INITIALIZATION PROTOCOL

**EVERY Claude session MUST begin with:**
```bash
# Step 1: Initialize mandatory agents
echo "Loading mandatory agents..."
cat /workspaces/agentists-quickstart/agents/doc-planner.md
cat /workspaces/agentists-quickstart/agents/microtask-breakdown.md

# Step 2: Confirm agents loaded
echo "✅ doc-planner agent loaded"
echo "✅ microtask-breakdown agent loaded"

# Step 3: Set current date
echo "Current date: $(date +'%B %d, %Y')"

# Step 4: Ready for all operations
echo "Ready for individual tasks, swarms, and hive-minds with mandatory agents"
```

## 🎯 FUNDAMENTAL PRINCIPLES (Apply to ALL Work)

### 1. **Mandatory Agent Usage**
- **EVERY task** (individual, swarm, or hive) MUST start with doc-planner and microtask-breakdown
- Even single Claude tasks: "Using doc-planner and microtask-breakdown, [task]"
- No exceptions - these agents ensure proper planning and atomic task creation

### 2. **Frontend/Web Development Protocol**
- **ALWAYS** use Playwright for ALL web-facing development
- Take screenshots at every stage to verify UI functionality
- Test pattern: Build → Screenshot → Verify → Iterate
- Required for: React, Vue, HTML/CSS, any UI work
```bash
# Mandatory for web development
npm install playwright
# Take screenshot after each change
await page.screenshot({ path: 'verification.png' })
```

### 3. **Recursive Problem Solving**
- Use recursive thinking to break down complex problems
- If hitting a wall, recurse deeper into sub-problems
- Apply pattern: Problem → Sub-problems → Atomic units → Solve → Combine

### 4. **Iterate Until Goal Achievement**
- **NEVER** stop until the desired result is achieved
- Define clear success criteria upfront
- Keep iterating through: Attempt → Test → Refine → Repeat
- "Iterate until goal is met" is the default mode

### 5. **Deep Research When Stuck**
- If ANY agent gets stuck, trigger deep research protocol:
  1. YouTube transcripts for tutorials
  2. GitHub repos for implementation examples
  3. Blog posts for best practices
  4. Stack Overflow for common issues
  5. Documentation for latest updates
- Continue researching until a solution is found
- "If stuck, do deep research" is mandatory

### 6. **Always Specify Current Date**
- Every task/prompt MUST include current date
- Format: "Current date is [Month DD, YYYY]"
- Critical for time-sensitive information and API updates

### 7. **Swarm vs Hive Decision Tree**
Ask yourself these questions:
- Single focused task? → Use **swarm**
- Complex multi-phase project? → Use **hive-mind**
- Need persistent memory? → Use **hive-mind**
- Quick prototype? → Use **swarm**
- Long-term development? → Use **hive-mind**

## 🚨 CRITICAL: Mandatory Agents for ALL Tasks

**THESE AGENTS ARE REQUIRED FOR EVERYTHING:**
1. **doc-planner** - Documentation planning and phase breakdown
2. **microtask-breakdown** - Atomic 10-minute task creation

### Usage Patterns:
```bash
# Individual Claude task
"Using doc-planner and microtask-breakdown agents, implement user authentication"

# Swarm command
npx claude-flow@alpha swarm "Using doc-planner and microtask-breakdown agents, build REST API"

# Hive-mind operations
npx claude-flow@alpha hive-mind spawn "Start with doc-planner and microtask-breakdown agents, then create full-stack app" --claude
```

### 🔴 ENFORCEMENT RULE:
**NO WORK BEGINS** without these agents. They ensure:
- Proper documentation structure (doc-planner)
- Atomic, testable tasks (microtask-breakdown)
- TDD compliance
- SPARC workflow adherence

## 🚨 CRITICAL: Concurrent Execution Rules

**ABSOLUTE RULE**: ALL operations MUST be concurrent/parallel in ONE message:

### 🔴 Mandatory Patterns:
- **TodoWrite**: ALWAYS batch ALL todos in ONE call (5-10+ minimum)
- **Task tool**: ALWAYS spawn ALL agents in ONE message
- **File operations**: ALWAYS batch ALL reads/writes/edits
- **Bash commands**: ALWAYS batch ALL terminal operations
- **Memory operations**: ALWAYS batch ALL store/retrieve

### ⚡ Golden Rule: "1 MESSAGE = ALL RELATED OPERATIONS"

✅ **CORRECT**: Everything in ONE message
```javascript
[Single Message]:
  - TodoWrite { todos: [10+ todos] }
  - Task("Agent 1"), Task("Agent 2"), Task("Agent 3")
  - Read("file1.js"), Read("file2.js")
  - Write("output1.js"), Write("output2.js")
  - Bash("npm install"), Bash("npm test")
```

❌ **WRONG**: Multiple messages (6x slower!)

## 🎯 Claude Code vs MCP Tools

### Claude Code Handles ALL:
- File operations (Read/Write/Edit/Glob/Grep)
- Code generation & programming
- Bash commands & system operations
- TodoWrite & task management
- Git operations & package management
- Testing, debugging & implementation

### MCP Tools ONLY:
- Coordination & planning
- Memory management
- Performance tracking
- Swarm orchestration
- GitHub integration

**Key**: MCP coordinates, Claude Code executes!

## 📦 SPARC Commands

### Core:
- `npx claude-flow sparc modes` - List modes
- `npx claude-flow sparc run <mode> "<task>"` - Execute mode
- `npx claude-flow sparc tdd "<feature>"` - TDD workflow
- `npx claude-flow sparc batch <modes> "<task>"` - Parallel modes
- `npx claude-flow sparc pipeline "<task>"` - Full pipeline

### Build:
- `npm run build/test/lint/typecheck`

## 🤖 Agent Reference (54 Total + 2 MANDATORY)

### 🔴 MANDATORY AGENTS (Always Include in ALL Work)
| Agent | Purpose | Auto-Include |
|-------|---------|--------------|
| doc-planner | Documentation planning & phase breakdown | YES - First in every task |
| microtask-breakdown | Atomic 10-minute task creation | YES - Second in every task |

### Core Development
| Agent | Purpose |
|-------|---------|
| coder | Implementation |
| reviewer | Code quality |
| tester | Test creation |
| planner | Strategic planning |
| researcher | Information gathering |

### Swarm Coordination
| Agent | Purpose |
|-------|---------|
| hierarchical-coordinator | Queen-led |
| mesh-coordinator | Peer-to-peer |
| adaptive-coordinator | Dynamic topology |
| collective-intelligence-coordinator | Hive-mind |
| swarm-memory-manager | Distributed memory |

### Specialized
| Agent | Purpose |
|-------|---------|
| backend-dev | API development |
| mobile-dev | React Native |
| ml-developer | Machine learning |
| system-architect | High-level design |
| sparc-coder | TDD implementation |
| production-validator | Real validation |

### GitHub Integration
| Agent | Purpose |
|-------|---------|
| github-modes | Comprehensive integration |
| pr-manager | Pull requests |
| code-review-swarm | Multi-agent review |
| issue-tracker | Issue management |
| release-manager | Release coordination |

### Performance & Consensus
| Agent | Purpose |
|-------|---------|
| perf-analyzer | Bottleneck identification |
| performance-benchmarker | Performance testing |
| byzantine-coordinator | Fault tolerance |
| raft-manager | Leader election |
| consensus-builder | Decision-making |

## 🚀 Swarm Patterns

### 🚨 MANDATORY: Base Pattern for ALL Swarms/Hives
**Whether using `swarm`, `hive-mind wizard`, or `hive-mind spawn`, ALWAYS include:**

1. **For Task-based spawning:**
```bash
# ALWAYS START WITH:
Task("Documentation Planning", "Plan all phases and create structured docs", "doc-planner")
Task("Microtask Breakdown", "Break phases into 10-minute atomic tasks", "microtask-breakdown")

# THEN ADD YOUR SPECIFIC AGENTS:
Task("Architecture", "...", "system-architect")
Task("Backend", "...", "backend-dev")
# ... additional agents as needed
```

2. **For command-line swarm:**
```bash
npx claude-flow@alpha swarm "Using doc-planner and microtask-breakdown agents, <task>"
```

3. **For hive-mind operations:**
```bash
# Wizard mode
npx claude-flow@alpha hive-mind wizard
# When prompted: "Use doc-planner and microtask-breakdown first, then..."

# Direct spawn
npx claude-flow@alpha hive-mind spawn "Start with doc-planner and microtask-breakdown, then <task>" --claude

# Resume session (agents already included)
npx claude-flow@alpha hive-mind resume session-xxxxx
```

### Full-Stack Swarm Example (10 agents total)
```bash
# Mandatory agents first
Task("Documentation Planning", "Plan phases and structure", "doc-planner")
Task("Microtask Breakdown", "Create atomic tasks", "microtask-breakdown")

# Then domain-specific agents
Task("Architecture", "...", "system-architect")
Task("Backend", "...", "backend-dev")
Task("Frontend", "...", "mobile-dev")
Task("Database", "...", "coder")
Task("API Docs", "...", "api-docs")
Task("CI/CD", "...", "cicd-engineer")
Task("Testing", "...", "performance-benchmarker")
Task("Validation", "...", "production-validator")
```

### Agent Count Rules
1. **CLI Args First**: `npx claude-flow@alpha --agents 5`
2. **Auto-Decide**: Simple (3-4), Medium (5-7), Complex (8-12)

## 📋 Agent Coordination Protocol

### Every Agent MUST:

**1️⃣ START:**
```bash
npx claude-flow@alpha hooks pre-task --description "[task]"
npx claude-flow@alpha hooks session-restore --session-id "swarm-[id]"
```

**2️⃣ DURING (After EVERY step):**
```bash
npx claude-flow@alpha hooks post-edit --file "[file]" --memory-key "swarm/[agent]/[step]"
npx claude-flow@alpha hooks notify --message "[decision]"
```

**3️⃣ END:**
```bash
npx claude-flow@alpha hooks post-task --task-id "[task]" --analyze-performance true
npx claude-flow@alpha hooks session-end --export-metrics true
```

## 🛠️ MCP Setup

```bash
# Add MCP server
claude mcp add claude-flow npx claude-flow@alpha mcp start
```

### Key MCP Tools:
- `mcp__claude-flow__swarm_init` - Setup topology
- `mcp__claude-flow__agent_spawn` - Create agents
- `mcp__claude-flow__task_orchestrate` - Coordinate tasks
- `mcp__claude-flow__memory_usage` - Persistent memory
- `mcp__claude-flow__swarm_status` - Monitor progress

## 📊 Progress Format

```
📊 Progress Overview
├── Total: X | ✅ Complete: X | 🔄 Active: X | ⭕ Todo: X
└── Priority: 🔴 HIGH | 🟡 MEDIUM | 🟢 LOW
```

## 🎯 Performance Tips

1. **Batch Everything** - Multiple operations = 1 message
2. **Parallel First** - Think concurrent execution
3. **Memory is Key** - Cross-agent coordination
4. **Monitor Progress** - Real-time tracking
5. **Enable Hooks** - Automated coordination
6. **Playwright Always** - For any web/UI work
7. **Recurse Deep** - Break problems to atomic units
8. **Research When Stuck** - YouTube, GitHub, blogs
9. **Date Context** - Always include current date
10. **Iterate to Success** - Never stop until goal met

## ⚡ Quick Examples

### Frontend Development with Playwright
```javascript
// ALWAYS for web UI development
import { chromium } from 'playwright';

// Build component
const component = createReactComponent();

// Verify with screenshot
const browser = await chromium.launch();
const page = await browser.newPage();
await page.goto('http://localhost:3000');
await page.screenshot({ path: 'ui-verification.png' });

// Iterate until pixel-perfect
while (!meetsDesignSpecs) {
  adjustCSS();
  await page.screenshot({ path: `iteration-${count}.png` });
}
```

### Research Task with Recursion
```javascript
// Single message with mandatory agents + deep research
Task("Documentation", "Plan architecture", "doc-planner")
Task("Breakdown", "Create microtasks", "microtask-breakdown")
Task("Research", "If stuck, search YouTube/GitHub/blogs", "researcher")

// Recursive problem solving
function solveProblem(problem) {
  if (isAtomic(problem)) return solve(problem);
  const subProblems = breakDown(problem);
  return subProblems.map(solveProblem).combine();
}
```

### Development Task with Date Context
```javascript
// Always include current date
const context = {
  date: "November 25, 2024",
  task: "Implement auth using latest OAuth 2.1 spec"
};

// All todos in ONE call with date context
TodoWrite { todos: [
  { id: "1", content: "Design API (Nov 25, 2024 context)", priority: "high" },
  { id: "2", content: "Implement auth", status: "pending", priority: "high" },
  { id: "3", content: "Playwright tests", status: "pending", priority: "high" },
  { id: "4", content: "Iterate until working", priority: "medium" }
]}
```

## 🔗 Resources

- Docs: https://github.com/ruvnet/claude-flow
- Issues: https://github.com/ruvnet/claude-flow/issues
- SPARC: https://github.com/ruvnet/claude-flow/docs/sparc.md

## 📍 Agent Location & Discovery

### Finding Agents
```bash
# Count all available agents (600+)
ls /workspaces/agentists-quickstart/agents/*.md | wc -l

# Search for specific agent types
ls /workspaces/agentists-quickstart/agents/*test*.md
ls /workspaces/agentists-quickstart/agents/*security*.md
ls /workspaces/agentists-quickstart/agents/*frontend*.md

# Load any specific agent
cat /workspaces/agentists-quickstart/agents/[agent-name].md
```

### Agent Categories Available
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
- **500+ Non-Coding Agents**: Business, life enhancement, productivity

## 🧠 Master Agent Selection Pattern

**For maximum effectiveness, ALWAYS use this pattern:**
```
"Look in /workspaces/agentists-quickstart/agents/ and:
1. Identify all subagents that could be useful for this task
2. Figure out how to utilize the claude-flow hivemind to maximize ability
3. Chain appropriate agents for planning, implementation, testing, deployment"
```

## 💡 Advanced Prompting Patterns

### Visual-First Development
```
"Create visualizations of what to build first:
- Break down plans into many SVG visualizations 
- Make them simple and explainable
- Ensure understandable by humans
- Use Playwright to verify all visual output"
```

### Multi-Source Research
```
"Draw information from:
- YouTube transcripts (tools/youtube-transcript-api)
- GitHub repos for implementation examples
- Blog posts for best practices
- Web-accessible sources from last 2 years
- Keep researching until solution found"
```

### Concurrent Agent Spawning
```
"Spawn [N] agents to work on this process concurrently"
"Create parallel strategies using available MCP servers"
"Use swarm for independent tasks, hive-mind for shared context"
```

### Goal-Driven Iteration
```
"Define end result: [specific goal]
Iterate until achieved:
1. Attempt implementation
2. Test with Playwright if UI
3. If fails, deep research
4. Apply findings and retry
5. Continue until 100% success"
```

## 🚀 Quick Reference Commands

### Workspace Management
```bash
# SSH into workspace
devpod ssh agentists-quickstart

# Check system status
echo "Agents: $(ls -1 /workspaces/agentists-quickstart/agents/*.md | wc -l)"
echo "Claude-code: $(which claude-code && echo '✓' || echo '✗')"
echo "Claude-monitor: $(which claude-monitor && echo '✓' || echo '✗')"

# Tmux navigation
tmux attach -t workspace  # Reattach to session
# Ctrl+b then 0-3 to switch windows
# Ctrl+b d to detach
```

### Claude Flow Advanced Features
```bash
# Neural network training
npx claude-flow@alpha neural train --pattern coordination

# Memory management
npx claude-flow@alpha memory store "context" "value"
npx claude-flow@alpha memory query "topic" --namespace sparc

# GitHub integration
npx claude-flow@alpha github pr-manager review --ai-powered
npx claude-flow@alpha github issue-tracker manage

# Security scanning
npx claude-flow security scan --deep --report
```

---

**Remember**: Claude Flow coordinates, Claude Code creates! 
- Never save working files, text/mds and tests to the root folder.
EOF

# Append the rest of the claude.md content
cat << 'EOF' >> claude.md

---

## Protocols (a.k.a. YOLO Protocols)
Standard protocols executed on request, e.g. "Initialize CI protocol": 

### Model Protocol
Always use Claude Sonnet. Start every Claude session with `model /sonnet`.

### Agile Delivery Protocols
Deliver work in manageable chunks through fully automated pipelines. The goal is to deliver features and keep going unattended (don't stop!) until the feature is fully deployed.

**🔴 MANDATORY: All agile work MUST:**
1. Start with doc-planner and microtask-breakdown agents
2. Include current date in all planning
3. Use Playwright for any UI/web components
4. Apply recursive problem-solving
5. Iterate until deployment succeeds
6. Research deeply when blocked

#### Work Chunking Protocol (WCP)
Feature-based agile with CI integration using EPICs, Features, and Issues:

##### 🎯 PHASE 1: Planning
1. **EPIC ISSUE**: Business-focused GitHub issue with objectives, requirements, criteria, dependencies. Labels: `epic`, `enhancement`

2. **FEATURE BREAKDOWN**: 3-7 Features (1-3 days each, independently testable/deployable, incremental value)

3. **ISSUE DECOMPOSITION**: 1-3 Issues per Feature with testable criteria, linked to parent, priority labeled

##### 🔗 PHASE 2: GitHub Structure
4. **CREATE SUB-ISSUES** (GitHub CLI + GraphQL):
  ```bash
  # Create issues
  gh issue create --title "Parent Feature" --body "Description"
  gh issue create --title "Sub-Issue Task" --body "Description"
  
  # Get GraphQL IDs  
  gh api graphql --header 'X-Github-Next-Global-ID:1' -f query='
  { repository(owner: "OWNER", name: "REPO") { 
      issue(number: PARENT_NUM) { id }
  }}'
  
  # Add sub-issue relationship
  gh api graphql --header 'X-Github-Next-Global-ID:1' -f query='
  mutation { addSubIssue(input: {
    issueId: "PARENT_GraphQL_ID"
    subIssueId: "CHILD_GraphQL_ID"
  }) { issue { id } subIssue { id } }}'
  ```

5. **EPIC TEMPLATE**:
  ```markdown
  # EPIC: [Name]
  
  ## Business Objective
  [Goal and value]
  
  ## Technical Requirements
  - [ ] Requirement 1-N
  
  ## Features (Linked)
  - [ ] Feature 1: #[num] - [Status]
  
  ## Success Criteria
  - [ ] Criteria 1-N
  - [ ] CI/CD: 100% success
  
  ## CI Protocol
  Per CLAUDE.md: 100% CI before progression, implementation-first, swarm coordination
  
  ## Dependencies
  [List external dependencies]
  ```

6. **FEATURE TEMPLATE**:
  ```markdown
  # Feature: [Name]
  **Parent**: #[EPIC]
  
  ## Description
  [What feature accomplishes]
  
  ## Sub-Issues (Proper GitHub hierarchy)
  - [ ] Sub-Issue 1: #[num] - [Status]
  
  ## Acceptance Criteria
  - [ ] Functional requirements
  - [ ] Tests pass (100% CI)
  - [ ] Review/docs complete
  
  ## Definition of Done
  - [ ] Implemented/tested
  - [ ] CI passing
  - [ ] PR approved
  - [ ] Deployed
  ```

##### 🚀 PHASE 3: Execution
7. **ONE FEATURE AT A TIME**: Complete current feature (100% CI) before next. No parallel features. One PR per feature.

8. **SWARM DEPLOYMENT**: For complex features (2+ issues) - hierarchical topology, agent specialization, memory coordination

##### 🔄 PHASE 4: CI Integration
9. **MANDATORY CI**: Research→Implementation→Monitoring. 100% success required.

10. **CI MONITORING**:
   ```bash
   gh run list --repo owner/repo --branch feature/[name] --limit 10
   gh run view [RUN_ID] --repo owner/repo --log-failed
   npx claude-flow@alpha hooks ci-monitor-init --branch feature/[name]
   ```

##### 📊 PHASE 5: Tracking
11. **VISUAL TRACKING**:
   ```
   📊 EPIC: [Name]
     ├── Features: X total
     ├── ✅ Complete: X (X%)
     ├── 🔄 Current: [Feature] (X/3 issues)
     ├── ⭕ Pending: X
     └── 🎯 CI: [PASS/FAIL]
   ```

12. **ISSUE UPDATES**: Add labels, link parents, close with comments

##### 🎯 KEY RULES
- ONE feature at a time to production
- 100% CI before progression
- Swarm for complex features
- Implementation-first focus
- Max 3 issues/feature, 7 features/EPIC

#### Continuous Integration (CI) Protocol
Fix→Test→Commit→Push→Monitor→Repeat until 100%:

##### 🔬 PHASE 1: Research
1. **SWARM**: Deploy researcher/analyst/detective via `mcp__ruv-swarm__swarm_init`

2. **SOURCES**: Context7 MCP, WebSearch, Codebase analysis, GitHub

3. **ANALYSIS**: Root causes vs symptoms, severity categorization, GitHub documentation

4. **TARGETED FIXES**: Focus on specific CI failures (TypeScript violations, console.log, unused vars)

##### 🎯 PHASE 2: Implementation
5. **IMPLEMENTATION-FIRST**: Fix logic not test expectations, handle edge cases, realistic thresholds

6. **SWARM EXECUTION**: Systematic TDD, coordinate via hooks/memory, target 100% per component

##### 🚀 PHASE 3: Monitoring
7. **ACTIVE MONITORING**: ALWAYS check after pushing
   ```bash
   gh run list --repo owner/repo --limit N
   gh run view RUN_ID --repo owner/repo
   ```

8. **INTELLIGENT MONITORING**:
   ```bash
   npx claude-flow@alpha hooks ci-monitor-init --adaptive true
   ```
   Smart backoff (2s-5min), auto-merge, swarm coordination

9. **INTEGRATION**: Regular commits, interval pushes, PR on milestones

10. **ISSUE MANAGEMENT**: Close with summaries, update tracking, document methods, label appropriately

11. **ITERATE**: Continue until deployment success, apply lessons, scale swarm by complexity

##### 🏆 TARGET: 100% test success

#### Continuous Deployment (CD) Protocol
Deploy→E2E→Monitor→Validate→Auto-promote:

##### 🚀 PHASE 1: Staging
1. **AUTO-DEPLOY**: Blue-green after CI passes
   ```bash
   gh workflow run deploy-staging.yml --ref feature/[name]
   ```

2. **VALIDATE**: Smoke tests, connectivity, configuration/secrets, resource baselines

##### 🧪 PHASE 2: E2E Testing
3. **EXECUTION**: User journeys, cross-service integration, security/access, performance/load

4. **ANALYSIS**: Deploy swarm on failures, categorize flaky/environment/code, auto-retry, block critical

##### 🔍 PHASE 3: Production Readiness
5. **SECURITY**: SAST/DAST, container vulnerabilities, compliance, SSL/encryption

6. **PERFORMANCE**: SLA validation, load tests, response/throughput metrics, baseline comparison

##### 🎯 PHASE 4: Production
7. **DEPLOY**: Canary 5%→25%→50%→100%, monitor phases, auto-rollback on spikes, feature flags

##### 🔄 PHASE 5: Validation
9. **VALIDATE**: Smoke tests, synthetic monitoring, business metrics, service health

10. **CLEANUP**: Archive logs/metrics, clean temp resources, update docs/runbooks, tag VCS

11. **COMPLETE**: Update GitHub issues/boards, generate summary, update swarm memory

##### 🏆 TARGETS: Zero-downtime, <1% error rate
EOF

# Create subagents directory notice
cat << 'EOF' >> claude.md

---

## 📚 Subagents Directory

Specialized Claude subagents are available in `/workspaces/agentists-quickstart/agents/`

To view available agents:
```bash
cat /workspaces/agentists-quickstart/agents/agents-index.md
```

To use a specific agent:
```bash
cat /workspaces/agentists-quickstart/agents/[agent-name].md
```

These agents provide specialized capabilities for:
- Documentation planning (doc-planner)
- Microtask breakdown (microtask-breakdown)
- Code review and analysis
- Test generation
- And many more specialized tasks

Each agent follows strict CLAUDE.md principles and provides atomic, testable tasks.
EOF

echo "Setup completed successfully!"
