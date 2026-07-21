# Matt City

Matt City is a personal, identity-aware multi-agent operating environment for research, technical analysis, writing, career work, content development, and other repeatable knowledge workflows.

It is built around six principles:

1. **All human-visible work exists in Asana.**
2. **Gas City plus Beads/Dolt provide durable machine execution and workflow state.**
3. **GitHub holds versioned implementation and approved artifacts.**
4. **Every principal keeps a separate identity and authority boundary.**
5. **Context is deliberately packaged, not ambiently shared.**
6. **Every action and artifact is reconstructably attributable.**

Matt City does not replace Matthew's judgment or the primary-assistant relationship. It provides the workflow, policy, context, provenance, and observability infrastructure beneath that collaboration.

## Current status

Matt City is running in a live Phase 1 lab:

- Debian GNU/Linux 13.5 under WSL2
- native Docker Engine installed and managed inside Debian
- Gas City 1.3.5 under the machine supervisor
- Beads 1.1.0 with the managed Dolt data plane
- Dolt 2.2.1 on the city-managed endpoint
- Codex through the `builtin:codex` provider
- Matt City registered as a rig at `/home/matt/src/matt-city`
- runtime at `/home/matt/matt-city-runtime`
- automatic startup through Debian systemd and the Gas City supervisor
- Formula V2 compilation and bd-backed workflow materialization demonstrated
- runtime-alignment checks passing without a failed doctor check

The current gate is a fresh end-to-end bd-backed smoke test that proves route, claim, execution, artifact packaging, provenance, and finalization. A slow session-snapshot and store-status path remains an operational warning, not a completed root-cause investigation.

Phoenix is a committed Phase 2 component, not the Matt City roadmap by itself. OpenTelemetry/OpenInference provide neutral instrumentation and transport, while Phoenix will be the primary initial interface for workflow traces, AI behavior, evaluations, and trace-derived signals. Grafana-class operational tooling is deferred until a concrete infrastructure-monitoring, log-search, alerting, or retention requirement justifies it.

See [Live Runtime Validation](docs/runtime-validation.md) for exact observations and remaining gates.

## Project roadmap

The complete roadmap is maintained in [Matt City Project Roadmap](docs/roadmap.md) and in the canonical [Asana roadmap task](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216740612789172).

The implementation sequence is:

1. **Foundation and operating model:** Asana, GitHub, identity, authority, provenance, Debian, Docker, Gas City, Codex, and bd/Dolt.
2. **Durable execution baseline:** fresh route, claim, execution, dependencies, retries, packaging, provenance, finalization, request schema, and operator documentation.
3. **Observability and operator experience:** OpenTelemetry/OpenInference instrumentation, Phoenix, deterministic evaluations, and dashboard navigation across canonical systems.
4. **Core context and content workflows:** bounded retrieval, TechThatMattRs, approval states, and the future Context Agent.
5. **Governed integrations and synchronization:** Asana sync, draft-only publishing, and carefully scoped external identities.
6. **Workflow expansion:** career, social, and business workflows.
7. **Operational hardening:** backup, recovery, retention, upgrades, service identities, health, and security review.

The current project gate is [Smoke Test #3: Fresh bd-backed end-to-end workflow](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216740708489953).

## Systems of record and interfaces

| System | Role |
|---|---|
| **Asana** | Canonical human work, context, decisions, approvals, status, and history |
| **Gas City plus Beads/Dolt** | Machine orchestration, durable workflow state, dependencies, agents, sessions, orders, and events |
| **GitHub** | Versioned prompts, formulas, schemas, policies, code, documentation, and approved artifacts |
| **OpenTelemetry/OpenInference** | Neutral instrumentation, semantic conventions, context propagation, and telemetry transport |
| **Phoenix** | Primary Phase 2 interface for AI traces, annotations, datasets, experiments, evaluations, and trace-derived signals |
| **Gas City CLI/API plus system tools** | Initial operational diagnosis through Gas City, systemd, journald, Docker, process, filesystem, and store inspection |
| **Future Grafana-class stack** | Deferred until continuous infrastructure metrics, centralized logs, alerting, or separate retention are required |
| **Context layer** | Governed retrieval from relevant Asana work and approved linked artifacts |
| **Primary assistant** | Interpretation, context selection, delegation, synthesis, and mediated external actions under its own identities |
| **Matthew** | Direction, ownership, judgment, and approval |

Canonical links:

- [Matt City Asana project](https://app.asana.com/1/1204112251101459/project/1216444827581484)
- [Matt City project roadmap](docs/roadmap.md)
- [Matt City GitHub repository](https://github.com/Matt2021-A/matt-city)
- [Gas City documentation](https://docs.gascity.com/)
- [Gas City repository](https://github.com/gastownhall/gascity/)
- [Phoenix repository](https://github.com/Arize-ai/phoenix)
- [Phoenix documentation](https://arize.com/docs/phoenix)

## Architecture

```text
Matthew
   | creates, directs, reviews, and approves work
   v
ASANA
   canonical human work, decision, and approval plane
   |
   +----------------> Primary assistant
   |                  interprets intent, packages context,
   |                  delegates, synthesizes, and returns results
   |
   v
GAS CITY + BEADS/DOLT
   formulas, workflows, dependencies, agents, sessions,
   orders, events, and durable machine state
   |
   +----------------> Specialized agents
   |                  bounded research, analysis, review, and writing
   |
   +----------------> Context packages
   |                  approved task context and linked artifacts only
   |
   +----------------> OTEL / OPENINFERENCE
   |                  instrumentation, semantics, and transport
   |                         |
   |                         v
   |                     PHOENIX
   |                     primary trace, evaluation,
   |                     experiment, and AI-observability interface
   |
   +----------------> GAS CITY + SYSTEM TOOLS
   |                  workflow state, service health, logs,
   |                  Docker, process, filesystem, and store diagnosis
   |
   v
ARTIFACT + PROVENANCE LAYER
   |
   v
GITHUB
   versioned implementation and approved outputs
   |
   v
ASANA
   links, findings, decisions, blockers, approvals, and final status
```

Telemetry is observational. Phoenix, a collector, or any future dashboard failure must not stop workflow execution or change its outcome.

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
| **Phoenix trace** | Observational record of AI execution, correlation, and evaluation |
| **GitHub artifact** | Versioned configuration, schema, policy, implementation, or approved output |
| **Provenance record** | Link among the Asana task, Gas City objects, agents, sessions, identities, artifacts, and approvals |

Every Gas City workflow must reference an originating Asana task. Every meaningful output must return or link back to that task. Phoenix correlation metadata may reference canonical identifiers but does not become the source of truth for them.

## Identity and authority

Matthew, the primary assistant, Gas City agents, runtime sessions, entitlement accounts, telemetry collectors, telemetry viewers, and target-system principals are separate actors.

Current examples:

- Matthew owns the Matt City Asana project.
- `ChatGPT AI Agent Bot - MattR` is a separate Asana member.
- Matthew owns or administers the GitHub repository.
- `ChatGPTBot-MattR` is a separate GitHub principal with granted access.
- The local Linux runtime runs as `matt`.
- GitHub CLI authenticates as `Matt2021-A`.
- Codex uses Matthew's OpenAI account for runtime entitlement.
- Local Gas City agents inherit neither Asana nor GitHub access.
- Future Phoenix collector, viewer, and MCP identities remain distinct.

The governing rule is:

> Agents may inherit work. They do not inherit another principal's identity, authority, connections, credentials, permissions, or unrelated context.

Consequential external actions must be performed by the principal that actually owns the connection, with Matthew's approval where required.

## Context architecture

Context is scoped as global, domain, project, and task context. Agents receive explicit context packages, not ambient access to every conversation or connected system.

Agents coordinate through Gas City's store-mediated mechanisms such as slung work, mail, hooks, Beads, routing, and artifacts. They do not talk directly or acquire one another's private connection state.

## Live Gas City configuration

The Phase 1 runtime uses the `builtin:codex` provider and the managed bd/Dolt data plane. The canonical live paths are:

```text
City: /home/matt/matt-city-runtime
Rig:  /home/matt/src/matt-city
Dolt: 127.0.0.1:44381
```

The runtime was restored from the earlier temporary file-provider path to the intended bd-backed model. The branch `fix/restore-bd-provider` records that recovery work and the request package for the current smoke-test baseline.

## Native Phase 1 agents

Matt City contains hand-authored native agent scaffolds for:

- `run-operator`
- `researcher`
- `technical-analyst`
- `identity-security-analyst`
- `skeptic`

Each uses:

```text
city/agents/<agent-name>/agent.toml
city/agents/<agent-name>/prompt.template.md
```

Gas City also projects runtime skills into `.agents/skills/` when the repository is registered as a rig. Those files come from installed Gas City packs and are ignored rather than vendored. See [.agents/README.md](.agents/README.md).

## Phase 1 workflow

Phase 1 validates one read-only, Asana-linked research workflow:

1. An Asana task supplies the objective, approved sources, questions, and acceptance criteria.
2. The primary assistant packages the authorized context.
3. Gas City materializes the `research-topic` Formula V2 workflow.
4. The local run operator and bounded specialist agents claim and execute routed work.
5. The workflow packages artifacts and provenance.
6. The authorized assistant returns outputs to Asana.
7. Matthew reviews and approves downstream use.

The formula requires:

- `request_id`
- `asana_project_gid`
- `asana_task_gid`
- `request_path`

Human approval occurs in Asana. It is not represented as an invented machine wait step.

## Trust and telemetry boundary

Local specialist agents may read approved inputs and write local generated artifacts. They receive no:

- Asana credentials
- GitHub credentials
- email or calendar credentials
- WordPress credentials
- inherited assistant connections
- unrelated private context

The first Phoenix implementation will collect correlation and lifecycle metadata only. It will not capture prompt bodies, tool input or output bodies, source-document bodies, connected-system content, credentials, secrets, or personal data by default.

## Phase 1 acceptance gates

Completed:

- Gas City installation and version capture
- Debian WSL city initialization
- supervisor operation and automatic startup
- native Docker Engine installation inside Debian
- Codex provider registration and authentication
- Matt City rig registration
- managed bd/Dolt store accessibility
- cross-rig routing generation
- native run operator and specialist-agent configuration
- Formula V2 compilation and workflow materialization
- runtime alignment validation

Remaining:

- fresh workflow route and claim
- specialist execution through concrete sessions
- correct dependency, retry, and finalization behavior
- session replacement without lost durable work state
- real workflow, Bead, event, agent, and session identifiers captured together
- provenance linked to an Asana project and task
- outputs returned to Asana
- confirmation that no specialist agent performed an external write

The current `gc status` session-snapshot timeout and store latency remain documented operational warnings. They do not count as a successful workflow test or as proof that workflow execution is blocked.

## Provenance model

Every meaningful artifact records:

- Asana project and task GIDs
- optional approval task GID
- Gas City city, rig, formula, workflow, convoy, Bead, and event identifiers where applicable
- requester and delegator
- contributing agents, sessions, providers, and contributions
- inputs and outputs
- capabilities and external identities used
- Git commit and artifact hash
- approval state and approver

Phoenix adds observational correlation. It does not replace canonical provenance.
