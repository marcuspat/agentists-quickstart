#!/bin/bash
set -ex  # Add -x for debugging output

# Update and install packages
sudo apt-get update
sudo apt-get install -y tmux

# Install npm packages
npm install -g @anthropic-ai/claude-code
npm install -g claude-usage-cli

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

# Create claude.md file with enhanced content
cat << 'EOF' > claude.md
# Claude Code Configuration - SPARC Development Environment

## 🎯 MASTER PATTERN - Always Use This
**CRITICAL**: Always include in your prompts:
```
"Identify all of the subagents that could be useful in any way for this task and then figure out how to utilize the claude-flow hivemind to maximize your ability to accomplish the task."
```

## 🚨 CRITICAL: Development Fundamentals

### Mandatory for ALL Work:
1. **doc-planner** agent - ALWAYS use for documentation planning (SPARC workflow)
2. **microtask-breakdown** agent - ALWAYS use for atomic 10-minute tasks (TDD principles)
3. **Playwright** - REQUIRED for all frontend/web development (visual verification)
4. **Current Date** - ALWAYS specify for time-sensitive information (Today: August 12, 2025)
5. **Recursive Problem Solving** - Break down to atomic, solvable units
6. **Iterate Until Success** - Tasks continue until achieved
7. **Deep Research Protocol** - When stuck, search YouTube transcripts, GitHub repos, blogs

### 🔄 Swarm vs Hive-Mind Decision Tree
| Use Swarm When | Use Hive-Mind When |
|----------------|-------------------|
| Quick tasks, single objectives | Complex projects, persistent sessions |
| "Build X", "Fix Y", "Analyze Z" | Multi-feature projects, team coordination |
| Temporary coordination | Project-wide memory needed |
| Simple parallelization | Complex multi-agent coordination |

**Quick Rule**: Start with `swarm` for most tasks. Use `hive-mind` for persistent sessions.

### 🔍 Deep Research Protocol
When stuck or need information:
```bash
# 1. YouTube transcripts for tutorials
# 2. GitHub repos for implementation examples  
# 3. Blog posts for best practices
# 4. Analyze existing code for patterns
# 5. Search all web-accessible resources
# Keep recursing until you find a working solution
```

### 🎭 Visual Verification Loop
For all frontend/web development:
```bash
# 1. Create UI component
# 2. Install playwright: npm install playwright
# 3. Take screenshot: playwright screenshot --viewport 1920x1080
# 4. Verify output matches design
# 5. Iterate on CSS/layout if needed
# 6. Keep iterating until pixel-perfect
```

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

### Swarm/Hive:
- `npx claude-flow@alpha swarm "quick task"` - For simple tasks
- `npx claude-flow@alpha hive-mind wizard` - For complex projects
- `npx claude-flow@alpha hive-mind spawn "task" --claude` - Spawn with Claude
- `npx claude-flow@alpha hive-mind resume session-xxxxx` - Continue work

### Build:
- `npm run build/test/lint/typecheck`

## 🤖 Agent Reference (600+ Total Available)

### Essential Agents (Always Load First):
- **doc-planner** - Documentation planning (SPARC)
- **microtask-breakdown** - Atomic task decomposition

### Core Development (54 Built-in)
| Agent | Purpose |
|-------|---------|
| coder | Implementation |
| reviewer | Code quality |
| tester | Test creation |
| planner | Strategic planning |
| researcher | Information gathering |

### 600+ Specialized Agents Available
Located in `/workspaces/agentists-quickstart/agents/`:
- **Development**: Code review, test generation, debugging, refactoring
- **Documentation**: Technical writing, API docs, user guides
- **Architecture**: System design, database modeling, scalability
- **Security**: Vulnerability scanning, penetration testing
- **Performance**: Optimization, profiling, bottleneck analysis
- **Business**: Market analysis, competitive intelligence
- **Creative**: Content creation, brainstorming, innovation
- **500+ Non-Coding Agents**: Business, life, productivity

To use agents:
```bash
# List all available agents (600+)
ls /workspaces/agentists-quickstart/agents/*.md | wc -l

# Search for specific agents
ls /workspaces/agentists-quickstart/agents/*test*.md

# Load essential agents
cat /workspaces/agentists-quickstart/agents/doc-planner.md
cat /workspaces/agentists-quickstart/agents/microtask-breakdown.md
```

## 🚀 Prompting Examples

### Example 1: Full Project with Visualizations
```
"I need to build a REST API. Look in /workspaces/agentists-quickstart/agents/ and:
1. Identify all subagents that could be useful for this task
2. Create a complete development plan with visualizations
3. Break down the plans into many SVG visualizations
4. Figure out how to utilize the claude-flow hivemind
5. Chain the appropriate agents for planning, implementation, testing
6. Create visualizations of what I would build first
7. Make sure visualizations are extremely explainable"
```

### Example 2: Research & Implementation
```
"Research Kubernetes LLM serving. Current date is August 12, 2025.
- Spawn 5 agents to work on this process concurrently
- Use YouTube transcripts, GitHub repos, blog posts
- Put output into research/kubernetes folder
- Keep iterating until a clear implementation path exists
- If stuck, do deep research to find solutions"
```

### Example 3: Frontend with Visual Verification
```
"Create an animation using anime.js:
- Create folder /frontend-demo/
- Spawn 3 agents to work in parallel
- Install playwright and take screenshots (400x750px viewport)
- Keep iterating until animation is smooth on mobile
- If stuck, search GitHub repos and YouTube tutorials"
```

## 🚀 Swarm Patterns

### Full-Stack Swarm (8 agents)
```bash
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
6. **Use Playwright** - Visual verification for frontend
7. **Recursive Thinking** - Break down to atomic units
8. **Deep Research** - YouTube, GitHub, blogs when stuck
9. **Date Context** - Always specify current date
10. **Master Pattern** - Identify all useful subagents

## ⚡ Quick Examples

### Research Task
```javascript
// Single message with all operations
mcp__claude-flow__swarm_init { topology: "mesh", maxAgents: 5 }
mcp__claude-flow__agent_spawn { type: "researcher" }
mcp__claude-flow__agent_spawn { type: "code-analyzer" }
mcp__claude-flow__task_orchestrate { task: "Research patterns" }
```

### Development Task
```javascript
// All todos in ONE call
TodoWrite { todos: [
  { id: "1", content: "Design API", status: "in_progress", priority: "high" },
  { id: "2", content: "Implement auth", status: "pending", priority: "high" },
  { id: "3", content: "Write tests", status: "pending", priority: "medium" },
  { id: "4", content: "Documentation", status: "pending", priority: "low" }
]}
```

### Visual Verification Task
```javascript
// Frontend development with playwright
Bash("npm install playwright")
Write("component.jsx", componentCode)
Bash("npx playwright screenshot --viewport=1920x1080 component.html screenshot.png")
Read("screenshot.png") // Verify visually
```

## 🔗 Resources

- Docs: https://github.com/ruvnet/claude-flow
- Issues: https://github.com/ruvnet/claude-flow/issues
- SPARC: https://github.com/ruvnet/claude-flow/docs/sparc.md
- Agents: /workspaces/agentists-quickstart/agents/

---

**Remember**: 
- Claude Flow coordinates, Claude Code creates! 
- Always use doc-planner and microtask-breakdown agents
- Visual verification with Playwright for all frontend work
- Recursive problem solving until success
- Deep research when stuck
- Never save working files, text/mds and tests to the root folder
EOF

# Append the rest of the claude.md content (protocols section)
cat << 'EOF' >> claude.md

---

## Protocols (a.k.a. YOLO Protocols)
Standard protocols executed on request, e.g. "Initialize CI protocol": 

### Model Protocol
Always use Claude Sonnet. Start every Claude session with `model /sonnet`.

### Agile Delivery Protocols
Deliver work in manageable chunks through fully automated pipelines. The goal is to deliver features and keep going unattended (don't stop!) until the feature is fully deployed.

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
