# Gas City Documentation Alignment

This document maps Matt City to the official Gas City model and records the current local implementation state.

## Source of truth

Implementation decisions follow the official Gas City documentation and the `gastownhall/gascity` repository. Vision articles provide useful context but are not configuration authority.

Primary references:

- https://docs.gascity.com/
- https://docs.gascity.com/getting-started/how-gas-city-works
- https://docs.gascity.com/tutorials/01-cities-and-rigs
- https://docs.gascity.com/tutorials/02-agents
- https://docs.gascity.com/tutorials/03-sessions
- https://docs.gascity.com/tutorials/04-communication
- https://docs.gascity.com/tutorials/05-formulas
- https://docs.gascity.com/tutorials/06-beads
- https://docs.gascity.com/tutorials/07-orders
- https://docs.gascity.com/reference/config
- https://docs.gascity.com/reference/specs/formula-spec-v2
- https://docs.gascity.com/reference/trust-boundaries
- https://github.com/gastownhall/gascity/

## Primitive mapping

| Gas City primitive | Matt City use |
|---|---|
| Agent | Bounded worker definition |
| Session | Replaceable live process executing as a concrete agent instance |
| Bead | Durable machine work item beneath an Asana task |
| Formula | Reusable method such as `research-topic` |
| Workflow | Formula V2 graph materialized as root, step, and attempt work |
| Rig | Registered project directory where Matt City work executes |
| Pack | Reusable collection of agents, formulas, orders, prompts, and support files |
| Order | Scheduled or event-triggered control-plane work |
| Event | Observable activity for status, audit, and automation |
| Convoy | Tracking container for ordinary slung work, not a synonym for every workflow |

Gas City remains role-agnostic. Matt City roles are local configuration and policy, not built-in platform roles.

## Work-object mapping

```text
Asana project
  canonical human project and context boundary

Asana task
  canonical human request, decision, review, or approval

Gas City formula
  reusable execution method

Gas City workflow
  Formula V2 graph materialized beneath the Asana task

Root, step, and attempt Beads
  durable machine work, dependencies, routing, and lifecycle state

Gas City session
  replaceable live process that claims and performs bounded work

GitHub artifact
  versioned configuration, schema, policy, implementation, or approved output

Phoenix trace
  optional observational correlation, not canonical workflow state
```

Every workflow and artifact must retain the originating Asana project and task GIDs.

## Native agent configuration

Gas City custom agents use:

```text
city/agents/<agent-name>/agent.toml
city/agents/<agent-name>/prompt.template.md
```

The current branch includes:

- `run-operator`
- `researcher`
- `technical-analyst`
- `identity-security-analyst`
- `skeptic`

Provider aliases referenced by `agent.toml` must be registered in the runtime city. Matt City uses Gas City's built-in Codex harness:

```toml
[providers.codex]
base = "builtin:codex"
```

Selecting the provider does not grant specialist agents another principal's GitHub, Asana, email, calendar, publishing, or telemetry-administration access.

## Communication and context

Agents coordinate through durable store-mediated mechanisms:

- slung or routed work
- mail
- hooks
- Beads
- orders and events
- artifacts and metadata

Matt City packages context deliberately. An agent receives only approved task context and linked artifacts, not the entire Asana workspace, another agent's session history, or the primary assistant's private connections.

## Formula alignment

The Phase 1 `research-topic` formula follows Formula V2 conventions:

- top-level formula name and description
- `[requires] formula_compiler = ">=2.0.0"`
- declared variables
- explicit step specifications and attempts
- `needs` dependency edges
- concrete run targets
- bounded retry behavior
- a workflow finalization step

Human approval is not modeled as an invented wait step. The machine workflow packages artifacts and reaches terminal state. The authorized assistant returns results to Asana, where Matthew reviews or approves downstream use.

## Beads and Dolt provider

The active Phase 1 runtime uses the intended managed bd/Dolt model.

Current observed versions:

- Gas City 1.3.5
- Beads 1.1.0
- Dolt 2.2.1

Current endpoint:

```text
127.0.0.1:44381
```

The earlier file-provider substitution was temporary. It allowed configuration work to continue while the initial schema-migration failure was investigated, but it is not the active durability model now.

An inactive legacy embedded-Dolt store remains present for deliberate reconciliation. It must not be deleted or merged without export, dry-run review, and explicit approval.

Asana remains the canonical human work plane. Beads/Dolt remain the canonical machine execution-state plane.

## Debian WSL runtime

The live environment is Debian GNU/Linux 13.5 under WSL2, not Ubuntu.

The stack is contained inside the Debian instance:

- Gas City and its supervisor
- Beads and Dolt
- native Docker Engine
- Matt City runtime services
- local agent sessions
- future Phoenix container

Docker, the Gas City supervisor, and the Matt City bootstrap service are managed by Debian systemd. Windows must still start the WSL distribution before those services can run.

## Identity and authority extension

Gas City tracks work, agent, session, routing, provider, and event identities. Matt City adds a governance chain:

- resource owner
- human initiator
- delegating assistant principal
- canonical task owner
- Gas City agent
- runtime session
- provider entitlement holder
- target-system authenticated principal
- telemetry collector
- telemetry viewer
- reviewer
- approver

Agents may inherit work. They do not inherit another principal's identity, credentials, connections, permissions, or unrelated context.

## Trust boundary

Phase 1 local agents receive only the local access required to read approved inputs and write generated artifacts. They receive no Asana, GitHub, email, calendar, WordPress, or other external credentials.

External updates are performed by the separately authorized principal that owns the connection.

The first Phoenix integration will be metadata-first. It will exclude prompt bodies, tool output, source-document bodies, connected-system content, credentials, secrets, and personal data by default.

## Current implementation status

Demonstrated:

- Debian WSL city initialization
- Gas City 1.3.5 supervisor operation
- automatic startup through systemd
- native Docker Engine inside Debian
- Matt City rig registration
- Codex provider registration and authentication
- managed bd/Dolt accessibility
- native run operator and specialist-agent configuration
- Formula V2 compilation
- bd-backed workflow materialization
- runtime-alignment validation
- doctor output with no failed checks in the current baseline

Not yet demonstrated end to end:

- fresh workflow route and claim
- specialist execution through concrete sessions
- dependency, retry, and finalization behavior across the full graph
- durable state across session replacement
- one correlated set of workflow, Bead, event, agent, and session identifiers
- artifact packaging and provenance return to Asana
- explicit proof that no specialist agent performed an external write

The current session-snapshot and store-status latency is an operational warning. It is not a substitute for the actual smoke test.

## Phase 1 runtime acceptance

Phase 1 is complete only after a fresh workflow demonstrates:

- unique request and workflow identifiers
- successful Formula V2 materialization
- correct route and concrete claim
- specialist execution with dependency ordering
- terminal step and workflow states
- durable Bead state across session replacement
- provenance containing Asana, Gas City, Beads, session, and Git identifiers
- artifact return to the originating Asana task
- no unauthorized specialist-agent external writes

Any conflict between this document and current official Gas City documentation must be resolved in favor of the official documentation, with the decision recorded in Asana and reflected in GitHub.
