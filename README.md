# Matt City

Matt City is a personal, identity-aware multi-agent operating environment for research, technical analysis, writing, career work, content development, and other repeatable knowledge workflows.

It is designed around five principles:

1. **Durable work** rather than disposable chat sessions.
2. **Separate identities** for Matthew, the primary assistant, specialized agents, runtimes, and service principals.
3. **Bounded context** so each agent receives only the information required for its task.
4. **Explicit authority** so no agent inherits another principal's connections, permissions, or credentials.
5. **Reconstructable attribution** for every artifact, delegation, approval, and external action.

Matt City is not intended to replace Matthew's judgment or the primary assistant relationship. It provides the workflow, context, policy, and provenance infrastructure beneath that collaboration.

## Project vision

The long-term goal is to turn recurring methods into reusable, inspectable workflows without collapsing every participant into an unaccountable identity called "AI."

```text
Matthew
   │
   ▼
Primary Assistant
   │ interprets intent, selects context, delegates, and synthesizes
   ▼
Gas City Control Plane
   │ formulas, beads, dependencies, sessions, orders, and events
   ├──────────────────────┐
   ▼                      ▼
Specialized Agents       Context Layer
   │                      │
   └──────────┬───────────┘
              ▼
     Policy and Connection Boundary
              │
              ▼
 GitHub, Asana, Drive, WordPress, web, local files, and other systems
```

## Core architecture

### 1. Human and primary-assistant layer

Matthew remains the human owner, decision-maker, and approval authority.

The primary assistant is a separate principal and collaborator. It may:

- Interpret Matthew's request
- Select or create a workflow
- Assemble relevant context
- Delegate bounded work
- Reconcile conflicting agent outputs
- Use only its own granted connections
- Present results to Matthew
- Request approval for consequential actions

The primary assistant is not impersonating Matthew, and local Gas City agents are not impersonating the primary assistant.

### 2. Gas City control plane

Gas City provides the orchestration substrate:

- Formulas for repeatable methods
- Beads for durable work
- Dependencies and gates
- Agent sessions and runtime providers
- Orders and event-driven execution
- Retries, waits, and health supervision
- Rigs for project-level isolation
- Packs for reusable configuration

Gas City coordinates Matt City workflows. It does not, by itself, provide the complete context, identity-governance, policy, or external-connection architecture described here.

### 3. Specialized agent layer

Agents are defined around bounded functions rather than fictional job titles.

Planned agent roles include:

- **Context Agent**: identifies relevant prior work, decisions, preferences, and constraints
- **Research Agent**: gathers and normalizes evidence
- **Technical Analyst**: explains architecture, components, dependencies, and operational behavior
- **Identity and Security Analyst**: evaluates identity, authorization, credentials, governance, attribution, and blast radius
- **Skeptic**: challenges unsupported claims, assumptions, and weak reasoning
- **Writing Agent**: drafts from approved analysis
- **Matt Voice Reviewer**: checks tone, structure, hype, artificial phrasing, and known writing preferences

Agents may exchange durable artifacts and task-linked messages. They do not receive universal shared context or ambient authority.

### 4. Context layer

Context is separated into four scopes:

```text
Global context
├── Stable profile
├── Writing preferences
├── Professional background
└── Standing decision criteria

Domain context
├── Identity and security
├── AI agents
├── Quantum computing
├── Technical marketing
└── Career

Project context
├── Current article
├── Current application
├── Current research program
└── Current business initiative

Task context
├── Approved sources
├── Current questions
├── Acceptance criteria
└── Required outputs
```

Each agent receives the minimum useful context package. Sensitive or unrelated context is not automatically shared across workflows.

### 5. Policy and connection boundary

External systems are accessed only through explicitly granted identities and capabilities.

Examples:

- Matthew's GitHub identity owns or administers resources.
- `ChatGPTBot-MattR` is a separate GitHub principal with its own granted repository access.
- A future Matt City GitHub App, Asana identity, or WordPress identity would also be separate principals.
- Specialized agents do not inherit those identities because they received delegated work.

A connection or policy layer will evaluate:

- Requesting principal
- Delegating workflow
- Requested capability
- Target resource
- Executing identity
- Required approval
- Result and provenance

### 6. Artifact and provenance layer

Every meaningful artifact should record:

- Resource owner
- Work initiator
- Delegating principal
- Performing agent
- Runtime session and provider
- Inputs and outputs
- Capabilities used
- External identity used, if any
- Human approval, when required

The intended attribution chain is:

```text
Matthew initiated the work.
The primary assistant interpreted or delegated it.
A specialized agent performed bounded analysis.
A specific runtime executed that agent.
A specific target-system identity performed any external action.
Matthew approved the action where required.
```

## Rigs and workstreams

Matt City is expected to grow into separate rigs with distinct context and access boundaries.

### Career rig

- Role discovery and evaluation
- Company research
- Resume alignment
- Cover letters
- Interview preparation
- Application and feedback analysis

### TechThatMattRs rig

- Topic intake
- Technical research
- Identity and security analysis
- Article development
- Editorial review
- Distribution planning

### Social rig

- LinkedIn
- Mastodon
- GitHub presence
- Replies, reposts, and campaign sequencing

### Business rig

- Matt & Jody Co planning
- Operations
- Research
- Administration

### Creative rig

- Songs
- Poetry
- Image-driven concepts
- Experimental writing

The creative rig should remain lightly orchestrated. Not every useful idea needs a workflow diagram and a quarterly business review.

## Human approval model

Actions are grouped into three operational tiers.

### Tier 1: autonomous, read-only, and reversible

Examples:

- Read approved sources
- Analyze documents
- Compare job descriptions
- Produce research artifacts
- Draft content locally

### Tier 2: assistant-mediated

Examples:

- Create an internal draft
- Update a known workflow record
- Attach an artifact to an approved project

These actions must be performed by the identity that actually holds access.

### Tier 3: Matthew approval required

Examples:

- Send email
- Publish content
- Submit applications
- Merge code
- Delete resources
- Change permissions
- Make financial or legal commitments

## Implementation roadmap

### Phase 1: trustworthy research workflow

Build one read-only research workflow in Ubuntu WSL using Gas City.

The workflow accepts a topic, approved sources, and questions, then produces:

1. A source and findings package
2. A technical analysis
3. An identity and security analysis
4. A skeptical review
5. A provenance record
6. A human review gate for Matthew

Phase 1 agents receive local file access only. They receive no GitHub, Asana, email, calendar, WordPress, or other external credentials.

### Phase 2: Matt context layer

Add structured repositories and retrieval for:

- Writing preferences
- Professional profile
- Prior research
- Published work
- Decisions and superseded guidance
- Domain-specific knowledge

### Phase 3: article development

Add writing and Matt Voice review after Matthew selects the approved angle.

### Phase 4: career workflows

Add job evaluation, company research, fit analysis, application preparation, and feedback tracking.

### Phase 5: external integrations

Add separately governed identities one at a time, beginning with low-risk draft or tracking operations.

### Phase 6: policy enforcement and operations

Add formal capability checks, approval flows, audit events, cost tracking, health monitoring, and workflow dashboards.

## Phase 1 security constraints

- No autonomous publishing or messaging
- No email, calendar, Asana, WordPress, or GitHub writes by local agents
- No inherited credentials between principals
- No agent impersonation
- No bulk ingestion of private conversation history
- No secrets or runtime state committed to Git
- Human review before downstream use

## Repository map

```text
matt-city/
├── README.md
├── docs/
│   ├── architecture.md
│   ├── identity-model.md
│   └── phase-1-scope.md
├── city/
│   ├── agents/
│   └── formulas/
├── schemas/
├── policies/
├── context/
├── examples/
└── artifacts/
```

- `docs/` contains architecture, scope, and design decisions
- `city/agents/` contains bounded agent definitions
- `city/formulas/` contains workflow definitions
- `schemas/` contains artifact and provenance contracts
- `policies/` contains capability and approval rules
- `context/` will contain governed context definitions and indexes
- `examples/` contains safe test inputs and fixtures
- `artifacts/` is reserved for approved outputs; generated or private runtime artifacts remain excluded from Git

## Governing principle

> Agents may inherit tasks. They do not inherit another principal's identity, authority, connections, context, or permissions.

Matt City succeeds only if work can move between people and agents while identity, authority, context, and attribution remain distinct and visible.
