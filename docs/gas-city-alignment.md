# Gas City Documentation Alignment

This document maps Matt City to the official Gas City model and records the current known implementation state.

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
| Formula | Reusable method such as `research-topic` or `draft-technical-blog` |
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

Matt City includes local run-operator, research, technical-analysis, identity/security, skeptical-review, and editorial workflow agents.

Provider aliases referenced by `agent.toml` must be registered in the runtime city. The last observed Matt City runtime used Gas City's built-in Codex harness:

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

Matt City's Formula V2 workflows use:

- top-level formula name and description
- `[requires] formula_compiler = ">=2.0.0"`
- declared variables
- explicit step specifications and attempts
- `needs` dependency edges
- concrete run targets
- bounded retry behavior
- workflow finalization

Human approval is not modeled as an invented wait step. The machine workflow packages artifacts and reaches terminal state. The authorized assistant returns results to Asana, where Matthew reviews or approves downstream use.

## Beads and Dolt provider

The intended Phase 1 durability model is managed bd/Dolt.

Last observed runtime versions before the August 23, 2026 reboot were:

- Gas City 1.3.5
- Beads 1.1.0
- Dolt 2.2.1

Last observed endpoint:

```text
127.0.0.1:44381
```

These are preserved runtime observations, not current September live assertions. Revalidate locally before relying on version-specific behavior.

The earlier file-provider substitution was temporary and is retained as historical recovery evidence. It is not the intended active durability model.

An inactive legacy embedded-Dolt store was previously retained for deliberate reconciliation. It must not be deleted or merged without current inspection, export/dry-run review where applicable, and explicit approval.

Asana remains the canonical human work plane. Beads/Dolt remain the canonical machine execution-state plane.

## Debian WSL runtime

The last known environment was Debian GNU/Linux 13.5 under WSL2, not Ubuntu.

The stack was contained inside the Debian instance:

- Gas City and its supervisor
- Beads and Dolt
- native Docker Engine
- Matt City runtime services
- local agent sessions
- future Phoenix container

Docker, the Gas City supervisor, and the Matt City bootstrap service were managed by Debian systemd. Windows must still start the WSL distribution before those services can run.

Freshness boundary: the runtime has not been directly revalidated since the unapproved August 23 Windows Update reboot. Service state, process/session state, installed versions, and current store/workflow state are unknown until read-only reconciliation is performed.

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

### Demonstrated in preserved evidence

- Debian WSL city initialization
- Gas City supervisor operation and automatic startup before the later reboot
- native Docker Engine inside Debian
- Matt City rig registration
- Codex provider registration and authentication for the tested environment
- managed bd/Dolt accessibility
- native run operator and specialist-agent configuration
- Formula V2 compilation and bd-backed workflow materialization
- runtime-alignment validation
- Smoke Test #3 route, concrete claim, specialist execution, dependency ordering, artifact packaging, provenance, and finalization for the tested `research-topic` path

Smoke Test #3 therefore closed the earlier question of whether the basic local bd-backed lifecycle could execute end to end for that tested workflow.

### Not yet demonstrated or not currently revalidated

- current post-reboot service/store/session state
- production `draft-technical-blog` route/claim/session recovery for `building-matt-city-blog-001`
- current state of workflow pointer `mc-069` and outline attempt `mc-417`
- production outline and draft generation
- production-path session replacement without lost durable work state
- regression/acceptance coverage across supported workflows
- production artifact packaging and provenance return
- current confirmation that no specialist agent performed an unauthorized external write

The August strategist/session investigation showed an important split: targetless hook discovery could find `mc-417`, while `hook --claim` still returned `drain/no_work`; later nudge attempts stalled before delivery or queue persistence. PR #13 merged a bounded PATH fix for fresh editorial-strategist sessions, but the runtime was rebooted before a post-fix fresh-session result was captured. That fix must not be described as proven runtime remediation until the local environment is revalidated and tested.

## Phase 1 acceptance state

The baseline lifecycle acceptance case has passed through Smoke Test #3. Phase 1 as a project phase remains open because production recovery, session-replacement evidence, regression coverage, operator documentation, and durable request/context handling are still incomplete.

The current gate is:

1. read-only post-reboot Git/runtime reconciliation
2. inspect `mc-069`, `mc-417`, strategist/control sessions, artifact existence, and claimability
3. preserve evidence
4. recover the production editorial workflow through the supported path
5. produce and validate the expected local article artifacts and provenance

Any conflict between this document and current official Gas City documentation must be resolved in favor of the official documentation, with the decision recorded in Asana and reflected in GitHub.
