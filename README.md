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

## Current status

Matt City is now running in a live Phase 1 lab:

- Debian GNU/Linux 13.5 under WSL2
- Gas City 1.3.4 under the supervisor
- Codex CLI 0.144.1 using the `builtin:codex` provider
- Matt City repository registered as a rig
- file-backed Beads active for Phase 1
- cross-rig routing generated
- runtime and rig checks passing without fatal errors

The architecture is no longer merely documentation-aligned. The city and rig are operational. Agent discovery, formula compilation, workflow execution, provenance, and Asana return-path validation remain open.

Dolt-backed rig initialization is temporarily blocked by a reproducible Beads schema-migration defect associated with `gastownhall/beads#4566`. The file backend is an explicit Phase 1 substitution, not a production durability claim.

See [Live Runtime Validation](docs/runtime-validation.md) for exact versions, observed behavior, identity boundaries, warnings, and remaining gates.

## Systems of record

| System | Role |
|---|---|
| **Asana** | Canonical human work, context, decisions, approvals, status, and history |
| **Gas City** | Machine orchestration, formulas, Beads, dependencies, agents, sessions, orders, and events |
| **GitHub** | Versioned prompts, formulas, schemas, policies, code, documentation, and approved artifacts |
| **Context layer** | Governed retrieval from relevant Asana work and approved linked artifacts |
| **Primary assistant** | Interpretation, context selection, delegation, synthesis, and mediated external actions under its own identities |
| **Matthew** | Direction, ownership, judgment, and approval |

Canonical links:

- [Matt City Asana project](https://app.asana.com/1/1204112251101459/project/1216444827581484)
- [Matt City GitHub repository](https://github.com/Matt2021-A/matt-city)
- [Gas City documentation](https://docs.gascity.com/)
- [Gas City repository](https://github.com/gastownhall/gascity/)
- [Welcome to Gas City](https://steve-yegge.medium.com/welcome-to-gas-city-57f564bb3607)

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

Matt City separates human work from machine execution.

| Object | Meaning |
|---|---|
| **Asana project** | Human-visible program or persistent context boundary |
| **Asana task** | Canonical human request, decision, review, or approval object |
| **Gas City formula** | Reusable method that materializes machine work |
| **Gas City workflow** | Formula-generated v2 graph |
| **Root and step Beads** | Durable machine work objects and dependency state |
| **Gas City convoy** | Tracking container for ordinary slung work, not a synonym for every workflow |
| **Agent session** | Replaceable live process performing bounded work |
| **GitHub artifact** | Versioned configuration, schema, policy, implementation, or approved output |
| **Provenance record** | Link among the Asana task, Gas City objects, agents, sessions, identities, artifacts, and approvals |

Every Gas City workflow must reference an originating Asana task. Every meaningful output must return or link back to that task.

## Identity and authority

Matthew, the primary assistant, Gas City agents, runtime sessions, entitlement accounts, and target-system principals are separate actors.

Current examples:

- Matthew owns the Matt City Asana project.
- `ChatGPT AI Agent Bot - MattR` is a separate Asana member.
- Matthew owns or administers the GitHub repository.
- `ChatGPTBot-MattR` is a separate GitHub principal with granted access.
- The local Linux runtime runs as `matt`.
- GitHub CLI authenticates as `Matt2021-A`.
- Codex uses Matthew's OpenAI account for runtime entitlement.
- Local Gas City agents inherit neither Asana nor GitHub access.

The governing rule is:

> Agents may inherit work. They do not inherit another principal's identity, authority, connections, credentials, permissions, or unrelated context.

Consequential external actions must be performed by the principal that actually owns the connection, with Matthew's approval where required.

## Context architecture

Context is scoped as global, domain, project, and task context. Agents receive explicit context packages, not ambient access to every conversation or connected system.

Agents coordinate through Gas City's store-mediated mechanisms such as slung work, mail, hooks, Beads, routing, and artifacts. They do not talk directly or acquire one another's private connection state.

## Live Gas City configuration

The tested Phase 1 city uses:

```toml
[workspace]
provider = "codex"

[providers.codex]
base = "builtin:codex"

[beads]
provider = "file"
```

The current runtime paths are:

```text
City: /home/matt/matt-city-runtime
Rig:  /home/matt/src/matt-city
```

The file backend is used because a clean Dolt-backed rig initialization repeatedly reproduced the upstream Beads migration failure. Dolt remains the intended durability target after the relevant Gas City and Beads releases are aligned.

## Native Phase 1 agents

Matt City contains hand-authored native agent scaffolds for:

- `researcher`
- `technical-analyst`
- `identity-security-analyst`
- `skeptic`

Each uses:

```text
city/agents/<agent-name>/agent.toml
city/agents/<agent-name>/prompt.template.md
```

Gas City also projects runtime skills into `.agents/skills/` when the repository is registered as a rig. Those files come from the installed Gas City packs and are ignored rather than vendored. See [.agents/README.md](.agents/README.md).

## Phase 1 workflow

Phase 1 validates one read-only, Asana-linked research workflow:

1. An Asana task supplies the objective, approved sources, questions, and acceptance criteria.
2. The primary assistant packages the authorized context.
3. Gas City materializes the `research-topic` formula.
4. Bounded agents produce research, technical analysis, identity and security analysis, and skeptical review.
5. The workflow packages artifacts and provenance.
6. The authorized assistant returns outputs to Asana.
7. Matthew reviews and approves downstream use.

The formula requires:

- `request_id`
- `asana_project_gid`
- `asana_task_gid`
- `request_path`

Human approval occurs in Asana. It is not represented as an invented machine wait step.

## Trust boundary

Local specialist agents may read approved inputs and write local generated artifacts. They receive no:

- Asana credentials
- GitHub credentials
- email or calendar credentials
- WordPress credentials
- inherited assistant connections
- unrelated private context

## Phase 1 acceptance gates

Completed:

- Gas City installation and version capture
- Debian WSL city initialization
- supervisor operation
- Codex provider registration and authentication
- Matt City rig registration
- file-backed rig store accessibility
- cross-rig routing generation

Remaining:

- native agent discovery and prompt loading
- successful v2 formula compilation
- correct dependency and retry behavior
- session replacement without lost work state
- real workflow, Bead, event, agent, and session identifiers
- provenance linked to an Asana project and task
- outputs returned to Asana
- no specialist-agent external writes
- Dolt-backed durability on aligned releases

## Provenance model

Every meaningful artifact records:

- Asana project and task GIDs
- optional approval task GID
- Gas City city, rig, formula, workflow, convoy, Bead, and event identifiers where applicable
- requester and delegator
- contributing agents, sessions, providers, and contributions
- inputs and outputs
- capabilities and external identities used
- approval state and approver

## Human approval tiers

**Tier 1:** read-only, reversible analysis and local drafts.

**Tier 2:** assistant-mediated Asana updates, artifact links, and internal drafts performed through the assistant's own identity.

**Tier 3:** Matthew approval required for publishing, email, applications, merges, deletion, permission changes, and consequential commitments.

## Planned workstreams

- **TechThatMattRs:** research, article development, editorial review, and distribution planning
- **Career:** role research, resume alignment, cover letters, and interview preparation
- **Social:** LinkedIn, Mastodon, GitHub presence, replies, reposts, and campaign sequencing
- **Business:** Matt & Jody Co planning and operations
- **Creative:** songs, poetry, image-driven concepts, and experimental writing

The first content acceptance test is [Building Matt City: An Identity-Aware Multi-Agent Work System](https://app.asana.com/1/1204112251101459/project/1213500168987836/task/1216445335991016).

## Repository map

```text
matt-city/
├── README.md
├── .agents/
│   └── README.md
├── docs/
│   ├── architecture.md
│   ├── identity-model.md
│   ├── gas-city-alignment.md
│   ├── phase-1-scope.md
│   └── runtime-validation.md
├── city/
│   ├── agents/
│   └── formulas/
├── schemas/
├── policies/
└── examples/
```

## Roadmap

1. **Phase 1:** Asana-linked read-only research workflow
2. **Phase 2:** Asana-first context retrieval
3. **Phase 3:** TechThatMattRs content workflow
4. **Phase 4:** Career workflows
5. **Phase 5:** Governed external integrations
6. **Phase 6:** capability policy, observability, recovery, cost, and operations
