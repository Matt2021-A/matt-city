# Matt City

Matt City is a personal, identity-aware multi-agent operating environment for research, technical analysis, writing, career work, content development, and other repeatable knowledge workflows.

It is built around six principles:

1. **All human-visible work exists in Asana.**
2. **Gas City provides durable machine execution.**
3. **GitHub holds versioned implementation and approved artifacts.**
4. **Every principal keeps a separate identity and authority boundary.**
5. **Context is deliberately packaged, not ambiently shared.**
6. **Every action and artifact is reconstructably attributable.**

Matt City does not replace Matthew's judgment or the primary-assistant relationship. It provides the workflow, policy, context, and provenance infrastructure beneath that collaboration.

## Systems of record

| System | Role |
|---|---|
| **Asana** | Canonical human work, context, decisions, approvals, status, and history |
| **Gas City** | Machine orchestration, formulas, Beads, dependencies, agents, sessions, orders, and events |
| **GitHub** | Versioned prompts, formulas, schemas, policies, code, documentation, and approved artifacts |
| **Context layer** | Governed retrieval from relevant Asana work and approved linked artifacts |
| **Primary assistant** | Interpretation, context selection, delegation, synthesis, and mediated external actions under its own identities |
| **Matthew** | Direction, ownership, judgment, and approval |

Canonical project links:

- [Matt City Asana project](https://app.asana.com/1/1204112251101459/project/1216444827581484)
- [Matt City GitHub repository](https://github.com/Matt2021-A/matt-city)

## Architecture

```text
Matthew
   │ creates, directs, reviews, and approves work
   ▼
ASANA
   canonical work and context plane
   │
   ├──────────────► Primary Assistant
   │                 interprets intent, retrieves context,
   │                 delegates, synthesizes, and returns results
   │
   ▼
GAS CITY
   formulas, Beads, dependencies, agents, sessions, orders, events
   │
   ├──────────────► Specialized Agents
   │                 bounded research, analysis, review, and writing roles
   │
   └──────────────► Context Packages
                     approved task context and linked artifacts only
   │
   ▼
ARTIFACT + PROVENANCE LAYER
   │
   ▼
GITHUB
   versioned implementation and approved outputs
   │
   ▼
ASANA
   links, findings, decisions, blockers, approvals, and final status
```

## Work-object model

Matt City deliberately separates human work objects from machine execution objects.

| Object | Meaning |
|---|---|
| **Asana project** | Human-visible program or persistent context boundary |
| **Asana task** | Canonical human request, decision, review, or approval object |
| **Gas City formula** | Reusable method that materializes machine work |
| **Gas City workflow** | Formula-generated v2 graph |
| **Root and step Beads** | Durable machine work objects and dependency state |
| **Gas City convoy** | Tracking container for ordinary slung work; not a synonym for every workflow |
| **Agent session** | Replaceable live process performing bounded work |
| **GitHub artifact** | Versioned configuration, schema, policy, implementation, or approved output |
| **Provenance record** | Link among the Asana task, Gas City objects, agents, sessions, identities, artifacts, and approvals |

Every Gas City workflow must reference an originating Asana task. Every meaningful output must return or link back to that task.

## Identity and authority

Matthew, the primary assistant, Gas City agents, runtime sessions, and target-system principals are separate actors.

Current examples:

- Matthew owns the Matt City Asana project.
- `ChatGPT AI Agent Bot - MattR` is a separate Asana member.
- Matthew owns or administers the GitHub repository.
- `ChatGPTBot-MattR` is a separate GitHub principal with granted access.
- Local Gas City agents inherit neither Asana nor GitHub access.

The governing rule is:

> Agents may inherit work. They do not inherit another principal's identity, authority, connections, credentials, permissions, or unrelated context.

Consequential external actions must be performed by the principal that actually owns the connection, with Matthew's approval where required.

## Context architecture

Context is divided into four scopes:

```text
Global context
├── stable profile
├── writing preferences
├── professional background
└── standing decision criteria

Domain context
├── identity and security
├── AI agents
├── quantum computing
├── technical marketing
└── career

Project context
├── Asana project description and status
├── project decisions and links
├── approved project artifacts
└── related project references

Task context
├── objective and acceptance criteria
├── comments and decisions
├── approved sources
└── required outputs
```

Agents do not share ambient memory or direct references. They coordinate through Gas City's store-mediated mechanisms such as slung work, mail, hooks, Beads, and artifacts.

## Gas City implementation

Official implementation authority:

- [Gas City documentation](https://docs.gascity.com/)
- [Gas City documentation index for language models](https://docs.gascity.com/llms.txt)
- [Gas City GitHub repository](https://github.com/gastownhall/gascity/)
- [Welcome to Gas City](https://steve-yegge.medium.com/welcome-to-gas-city-57f564bb3607)

Matt City uses the documented Gas City model:

- Cities contain registered rigs.
- Custom agents use `agents/<name>/agent.toml` and `prompt.template.md`.
- Formulas use the v2 TOML contract.
- Formula steps materialize into durable Beads with dependency edges.
- Sessions are replaceable live processes.
- Orders and events support later automation and observation.
- The Beads store remains separate from Asana's human work plane.

See [Gas City Documentation Alignment](docs/gas-city-alignment.md) for the detailed mapping and runtime acceptance criteria.

## Native Phase 1 agents

The branch includes native Gas City scaffolds for:

- `researcher`
- `technical-analyst`
- `identity-security-analyst`
- `skeptic`

Each uses:

```text
city/agents/<agent-name>/agent.toml
city/agents/<agent-name>/prompt.template.md
```

The older top-level Markdown role files are retained as design history only.

## Phase 1: Asana-linked research workflow

Phase 1 implements one read-only workflow under Ubuntu WSL:

1. An Asana task supplies the objective, approved sources, questions, and acceptance criteria.
2. The primary assistant creates a structured request linked to that task.
3. Gas City materializes the `research-topic` formula.
4. Bounded agents produce research, technical analysis, identity and security analysis, and skeptical review.
5. The workflow packages artifacts and provenance.
6. The authorized assistant returns the outputs to Asana.
7. Matthew reviews and approves any downstream use.

The formula requires:

- `request_id`
- `asana_project_gid`
- `asana_task_gid`
- `request_path`

Human approval is not represented as an invented Gas City wait step. The machine workflow packages its output, then the human approval process occurs in Asana.

## Phase 1 trust boundary

Local specialist agents receive only the local access required to read approved inputs and write generated artifacts.

They receive no:

- Asana credentials
- GitHub credentials
- email or calendar credentials
- WordPress credentials
- inherited assistant connections
- unrelated private context

The initial lab may use the documented file Beads backend to validate behavior. The default `bd` and Dolt data plane must be tested before the system is treated as durable production infrastructure.

## Phase 1 runtime acceptance

The scaffold is documentation-aligned, but it is not yet runtime-proven. Phase 1 completes only when Ubuntu WSL demonstrates:

- Gas City installation and version capture
- city initialization and supervisor operation
- Matt City rig registration
- provider registration in `city.toml`
- native agent discovery and prompt loading
- successful v2 formula compilation
- correct dependency and retry behavior
- session replacement without lost Bead state
- real workflow, Bead, convoy where applicable, session, and event identifiers
- provenance linked to the originating Asana project and task
- outputs returned to Asana
- no specialist-agent external writes

## Provenance model

Every meaningful artifact records:

- Asana project GID
- Asana task GID
- optional Asana approval task GID
- Gas City city, rig, formula, and workflow ID
- optional convoy and root Bead IDs
- Bead and event IDs
- requester and delegator
- contributing agents, sessions, providers, and contributions
- inputs and outputs
- capabilities used
- external identities used
- approval state and approver

## Human approval tiers

### Tier 1: autonomous, read-only, and reversible

- Read approved task context and linked sources
- Analyze documents
- Produce research artifacts
- Draft locally

### Tier 2: assistant-mediated

- Update the originating Asana task
- Link approved artifacts
- Create internal drafts using the assistant's own identity

### Tier 3: Matthew approval required

- Send email
- Publish content
- Submit applications
- Merge code
- Delete resources
- Change permissions
- Make financial or legal commitments

## Planned rigs and workstreams

### TechThatMattRs

- topic intake
- technical research
- identity and security analysis
- article development
- editorial review
- distribution planning

The first planned content acceptance test is [Building Matt City: An Identity-Aware Multi-Agent Work System](https://app.asana.com/1/1204112251101459/project/1213500168987836/task/1216445335991016).

### Career

- role discovery and evaluation
- company research
- resume alignment
- cover letters
- interview preparation
- application and feedback analysis

### Social

- LinkedIn
- Mastodon
- GitHub presence
- replies, reposts, and campaign sequencing

### Business

- Matt & Jody Co planning
- operations
- research
- administration

### Creative

- songs
- poetry
- image-driven concepts
- experimental writing

The creative rig remains lightly orchestrated. Not every useful idea needs a dependency graph and a quarterly review.

## Roadmap

1. **Phase 1:** Asana-linked read-only research workflow
2. **Phase 2:** Asana-first context retrieval
3. **Phase 3:** TechThatMattRs content workflow
4. **Phase 4:** Career workflows
5. **Phase 5:** Governed external integrations
6. **Phase 6:** Capability policy, observability, recovery, cost, and operations

## Repository map

```text
matt-city/
├── README.md
├── docs/
│   ├── architecture.md
│   ├── identity-model.md
│   ├── gas-city-alignment.md
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

## Status

The branch is now aligned to the official Gas City documentation at the configuration and architecture level. It remains **unvalidated in a live Gas City runtime** until the WSL acceptance tests are completed.
