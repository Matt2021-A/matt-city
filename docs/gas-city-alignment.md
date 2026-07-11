# Gas City Documentation Alignment

This document maps Matt City to the official Gas City documentation at https://docs.gascity.com/.

## Source of truth

Implementation decisions follow the official documentation and the `gastownhall/gascity` repository. Steve Yegge's article provides vision and context, not configuration authority.

Primary references:

- https://docs.gascity.com/llms.txt
- https://docs.gascity.com/getting-started/installation
- https://docs.gascity.com/getting-started/quickstart
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
| Agent | Bounded specialist worker |
| Bead | Durable machine work item beneath an Asana task |
| Formula | Reusable method such as `research-topic` |
| Rig | Registered project directory where work executes |
| Pack | Reusable collection of agents, formulas, orders, prompts, and support files |
| Event | Observable activity for status, audit, and automation |

Gas City remains role-agnostic. Matt City roles are configuration, not built-in platform roles.

## Work-object mapping

```text
Asana project
  canonical human project and context boundary

Asana task
  canonical human request, decision, or approval

Gas City formula
  reusable method

Gas City workflow
  v2 graph materialized from a formula

Gas City root and step beads
  durable machine work objects

Gas City convoy
  tracking container used for ordinary slung work
  not a synonym for every formula workflow

Gas City session
  replaceable live agent process

GitHub artifact
  versioned configuration, schema, policy, or approved output
```

A direct `gc sling <agent> <formula> --formula` starts a workflow. Cooking a formula and then slinging the root bead routes ordinary work and creates an auto-convoy. Matt City provenance records both when present.

Every workflow and artifact must retain the originating Asana project and task IDs.

## Native agent configuration

Gas City custom agents use:

```text
agents/<agent-name>/agent.toml
agents/<agent-name>/prompt.template.md
```

The Phase 1 branch now includes native directories for:

- `researcher`
- `technical-analyst`
- `identity-security-analyst`
- `skeptic`

The older top-level Markdown files under `city/agents/` are design notes only. They are not executable Gas City configuration.

Provider aliases referenced by `agent.toml` must be registered in the runtime city's `city.toml`. The committed Phase 1 configs currently reference `claude` and must be validated against the installed provider catalog.

## Communication and context

Agents do not share ambient memory or direct references. They coordinate through durable store-mediated mechanisms:

- slung work
- mail
- hooks
- beads
- artifacts and metadata

Matt City therefore packages context deliberately. An agent receives only approved task context and linked artifacts, not the full Asana workspace or another agent's session history.

## Formula alignment

Formula files live under a city's `formulas/` directory. The Phase 1 `research-topic.toml` now follows the documented v2 shape:

- top-level `formula` and `description`
- `[requires] formula_compiler = ">=2.0.0"`
- declared variables
- `[[steps]]`
- `needs` dependency edges
- documented retry configuration

Unsupported placeholder fields such as `[formula]`, per-step `agent`, `input`, `output`, and `type = "wait"` were removed.

Human approval is not modeled as an invented formula wait step. The Gas City workflow packages artifacts and closes; the authorized assistant returns results to Asana, where Matthew reviews or approves downstream use.

## Beads provider

Gas City supports the default `bd` plus Dolt data plane and a file backend for small or tutorial setups. Phase 1 may use `GC_BEADS=file` to validate configuration and workflow behavior with less setup friction.

Before treating Matt City as durable operational infrastructure, test the documented default provider and recovery behavior.

Asana remains the canonical human work plane. Beads remain the machine execution plane.

## Installation baseline for Ubuntu WSL

Documented Linux runtime dependencies:

- `tmux`
- `jq`
- `git`
- `dolt` 2.1.0 or newer for the default provider
- `bd` 1.0.0
- `flock`
- optional `gh`

Homebrew is the documented recommended installation method on Linux. Direct release download is also supported. Source builds require Go 1.26+ and `make`.

Verification begins with:

```bash
gc version
gc init ~/matt-city-runtime
cd ~/matt-city-runtime
```

The installed versions and WSL-specific findings must be recorded in the corresponding Asana task.

## Identity and authority extension

Gas City tracks work, agent, session, routing, provider, and event identity. Matt City adds an external governance chain:

- resource owner
- human initiator
- delegating assistant principal
- Gas City agent
- runtime session and provider
- target-system authenticated principal
- human approver

Agents may inherit work. They do not inherit another principal's identity, credentials, connections, permissions, or unrelated context.

## Trust boundary

Phase 1 local agents receive only the local access required to read approved inputs and write generated artifacts. They receive no Asana, GitHub, email, calendar, WordPress, or other external credentials.

External updates are performed later by the separately authorized principal that actually owns the connection.

## Current implementation status

Completed in the branch:

- full architecture and systems-of-record model
- official documentation map
- native Phase 1 agent directories and prompts
- documented v2 `research-topic` formula
- Asana and Gas City provenance schema
- capability policy denying specialist-agent external writes
- Asana tasks updated with installation and validation criteria

Not yet demonstrated:

- Gas City installed under Ubuntu WSL
- city initialized and supervisor running
- rig registered
- provider aliases validated
- agent prompts loaded by `gc prime`
- formula compiled by `gc formula show`
- workflow cooked or slung
- dependencies, retry, finalization, and session recovery observed
- real workflow, bead, convoy, event, and session IDs captured
- output linked back to the parent Asana task

## Phase 1 runtime acceptance

Phase 1 is complete only after the installed Gas City version demonstrates:

- city initialization under Ubuntu WSL
- Matt City rig registration
- native agent discovery and prompt loading
- provider registration in `city.toml`
- successful v2 formula compilation
- workflow execution with correct dependencies
- durable bead state across session replacement
- provenance containing Asana and Gas City identifiers
- artifact return to the originating Asana task
- no specialist-agent external writes

Any conflict between this document and the official documentation must be resolved in favor of the official documentation, with the decision recorded in Asana.
