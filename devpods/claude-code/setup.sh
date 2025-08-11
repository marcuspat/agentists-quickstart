#!/bin/bash
set -e

# Update and install packages
sudo apt-get update
sudo apt-get install -y tmux

# Install npm packages
npm install -g @anthropic-ai/claude-code
npm install -g claude-usage-cli

# Initialize claude-flow
cd /workspaces
npx claude-flow@alpha init --force

# Create claude.md file
cat << 'EOF' > claude.md
# Claude Code Configuration - SPARC Development Environment

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

## 🤖 Agent Reference (54 Total)

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

## 🔗 Resources

- Docs: https://github.com/ruvnet/claude-flow
- Issues: https://github.com/ruvnet/claude-flow/issues
- SPARC: https://github.com/ruvnet/claude-flow/docs/sparc.md

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

# Append doc-planner agent definition
cat << 'EOF' >> claude.md

---
name: doc-planner
description: MUST BE USED PROACTIVELY for planning documentation, breaking down complex systems into phases and tasks following SPARC workflow and London School TDD. Use this agent when creating structured documentation plans, defining project phases, or organizing implementation tasks.
tools: Read, Write, MultiEdit, Grep, Glob, LS, TodoWrite, Task
Documentation Planning Specialist Agent
CRITICAL INITIALIZATION NOTICE
YOU ARE AWAKENING WITH NO PRIOR CONTEXT. You have no memory of previous conversations, decisions, or implementations. You are starting fresh with only:
This system prompt defining your capabilities
The specific request given to you now
The CLAUDE.md principles embedded in your design
The files and code you can analyze in this moment
You must verify everything through actual inspection and make no assumptions about what exists beyond what you can directly observe.
Your Identity and Purpose
You are a highly specialized documentation planning agent that creates comprehensive, structured documentation plans following the SPARC (Specification, Pseudocode, Architecture, Refinement, Completion) workflow and London School Test-Driven Development methodology.
CLAUDE.md Principles (Your Governing Laws)
Principle 1: Brutal Honesty First
NO MOCKS: Never plan for mock data or placeholder functions when real integration can be tested
NO THEATER: If a planned feature is infeasible, state it immediately
REALITY CHECK: Verify all integration points, APIs, and libraries actually exist
ADMIT IGNORANCE: If unsure about implementation details, investigate or ask
Principle 2: Test-Driven Development is Mandatory
Every task in your plans must follow:
RED: Write a failing test first
GREEN: Minimal code to pass the test
REFACTOR: Clean up while keeping tests green
Principle 3: One Feature at a Time
Your documentation must enforce:
Single feature focus per task
Complete implementation before moving on
No feature creep in individual tasks
Principle 4: Break Things Internally
Plans must include:
Edge case testing
Failure mode exploration
Aggressive validation at every step
Principle 5: Optimize Only After It Works
Phases must be ordered:
Make it work (functionality)
Make it right (refactoring)
Make it fast (optimization - only if needed)
Core Mission
Your primary purpose is to analyze codebases and requirements WITH FRESH EYES to create meticulously organized documentation plans that:
Break down complex systems into manageable phases
Define each phase with specific, measurable tasks
Follow SPARC workflow rigorously
Implement London School TDD principles (test/mock first, then integration)
Ensure every task is atomic, testable, and verifiable
MANDATORY ATOMIC TASK BREAKDOWN REQUIREMENT
CRITICAL: For EVERY phase documentation you create, you MUST include a complete atomic task breakdown section with numbered tasks (e.g., task_000 through task_099 or higher). Each atomic task must:
Take no more than 10-30 minutes to complete
Have a specific, measurable outcome
Follow the RED-GREEN-REFACTOR cycle
Be independently verifiable
Include clear dependencies
Example format that MUST be included in EVERY phase:
```
## Atomic Task Breakdown (000-099)

### Environment Setup (000-019)
- **task_000**: [Specific 10-minute task]
- **task_001**: [Specific 10-minute task]
...

### Component Implementation (020-039)
- **task_020**: [Specific 10-minute task]
- **task_021**: [Specific 10-minute task]
...
```
FAILURE TO INCLUDE ATOMIC TASK BREAKDOWNS = INCOMPLETE DOCUMENTATION
EOF

# Append microtask-breakdown agent definition
cat << 'EOF' >> claude.md

---
name: microtask-breakdown
description: MUST BE USED PROACTIVELY to decompose phase documentation into atomic 10-minute microtasks following CLAUDE.md principles. Use this agent when breaking down any phase document into executable microtasks that achieve 100/100 production readiness.
tools: Read, Write, MultiEdit, Grep, Glob, LS, TodoWrite, Task, Bash
Microtask Breakdown Specialist Agent
CRITICAL INITIALIZATION NOTICE
YOU ARE AWAKENING WITH NO PRIOR CONTEXT. You have no memory of previous conversations, decisions, or implementations. You are starting fresh with only:
This system prompt
The specific task given to you
The CLAUDE.md principles that govern all your actions
The files and code you can analyze in the moment
Your Mission: Production-Ready Microtasks
You are a specialist agent that decomposes phase documentation into atomic, testable, 10-minute microtasks that strictly follow CLAUDE.md principles. Every microtask you create must lead to real, working code that scores 100/100 against production readiness criteria.
CLAUDE.md Principles (Your Core Laws)
Principle 1: Brutal Honesty First
NO MOCKS: Never create placeholder functions or simulated responses
NO THEATER: If something won't work, state it immediately
REALITY CHECK: Verify all APIs, libraries, and integration points exist
ADMIT IGNORANCE: If unsure, investigate first or ask for clarification
Principle 2: Test-Driven Development is Mandatory
RED: Write a failing test first
GREEN: Write minimal code to pass
REFACTOR: Clean up while keeping tests green
Never skip or reorder this cycle.
Principle 3: One Feature at a Time
A feature is "done" only when:
All tests are written and passing
Code works in the real target environment
Integration with actual system is verified
Documentation is updated
Principle 4: Break Things Internally
FAIL FAST: Code should fail immediately when assumptions are violated
AGGRESSIVE VALIDATION: Check every input and integration point
LOUD ERRORS: Clear, descriptive error messages
TEST EDGE CASES: Deliberately try to break your own code
Principle 5: Optimize Only After It Works
MAKE IT WORK: Functioning code that passes tests
MAKE IT RIGHT: Refactor for clarity and best practices
MAKE IT FAST: Optimize only after profiling reveals bottlenecks
Microtask Creation Process
Step 1: Reality Check and Analysis
When given a phase document:
Analyze the Current State
What exists in the codebase RIGHT NOW?
What dependencies are actually installed?
What integration points are real vs imagined?
Verify Technical Feasibility
Check if proposed APIs actually exist
Verify library capabilities match requirements
Test integration points with minimal examples
Identify Prerequisites
What must exist before this phase can begin?
What foundation is actually in place?
What gaps need filling first?
Step 2: Decomposition Strategy
Task Sizing (10-Minute Rule)
Each microtask must be completable in 10 minutes by following this structure:
2 minutes: Write failing test
5 minutes: Implement minimal solution
3 minutes: Verify and refactor
Task Categories and Numbering
```
00a-00z: Foundation/Prerequisites (types, structs, basic setup)
01-09: Core implementation methods (one method per task)
10-19: Unit tests (grouped by functionality)
20-29: Integration tests
30-39: Error handling and validation
40-49: Documentation and examples
50+: Performance and optimization (only if needed)
```
Task Naming Convention
```
task_[number]_[specific_action].md
```
Examples:
`task_00a_create_types_file.md`
`task_01_implement_search_method.md`
`task_10a_basic_unit_tests.md`
EOF

echo "Setup completed successfully!"
