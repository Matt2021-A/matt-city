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

As of September 10, 2026, the versioned repository has been consolidated onto `main` through PR #13. Smoke Test #3 is complete and demonstrated the tested local bd-backed Formula V2 lifecycle through cook, route, claim, execute, package, and finalize.

The current operational gate is no longer Smoke Test #3. It is recovery of the first production editorial workflow, request `building-matt-city-blog-001`, after a read-only post-reboot reconciliation of the local Debian WSL runtime and Git worktree.

Durable recorded production state:

- current workflow pointer: `mc-069`
- recorded outline attempt: `mc-417`
- no production `outline.md`, `draft-v1.md`, review package, `draft-final.md`, artifact index, or production provenance file existed in the latest preserved runtime evidence
- the August investigation isolated the observed blocker to the local strategist/session nudge submission/input path before delivery or queue persistence
- PR #13 merged a bounded editorial-strategist PATH fix so fresh sessions use the known Gas City and Homebrew toolchain paths explicitly

Freshness boundary: the Debian WSL runtime has **not** been directly revalidated since the unapproved August 23 Windows Update reboot. Current service state, installed runtime versions, live sessions, workflow state, claimability, and local worktree state must therefore be treated as unknown until a fresh read-only capture is performed.

Phoenix remains a committed Phase 2 component, not the Matt City roadmap by itself. OpenTelemetry/OpenInference provide neutral instrumentation and transport, while Phoenix will be the primary initial interface for workflow traces, AI behavior, evaluations, and trace-derived signals. Grafana-class operational tooling remains deferred until a concrete infrastructure-monitoring, log-search, alerting, or retention requirement justifies it.

See [Live Runtime Validation](docs/runtime-validation.md) for runtime observations and [Matt City Project Roadmap](docs/roadmap.md) for the current phase gates.

## Project roadmap

The complete roadmap is maintained in [Matt City Project Roadmap](docs/roadmap.md) and in the canonical [Asana roadmap task](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216740612789172).

The implementation sequence is:

1. **Foundation and operating model:** Asana, GitHub, identity, authority, provenance, Debian, Docker, Gas City, Codex, and bd/Dolt.
2. **Durable execution baseline:** route, claim, execution, dependencies, retries, packaging, provenance, finalization, request schema, regression coverage, session replacement, and operator documentation.
3. **Observability and operator experience:** OpenTelemetry/OpenInference instrumentation, Phoenix, deterministic evaluations, and dashboard navigation across canonical systems.
4. **Core context and content workflows:** bounded retrieval, TechThatMattRs, approval states, and the future Context Agent.
5. **Governed integrations and synchronization:** Asana sync, draft-only publishing, and carefully scoped external identities.
6. **Workflow expansion:** career, social, and business workflows.
7. **Operational hardening:** backup, recovery, retention, upgrades, service identities, health, and security review.

The current project gate is the [production editorial workflow stabilization task](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216777414350711), beginning with read-only post-reboot runtime reconciliation. Smoke Test #3 is retained as completed baseline evidence.

## Systems of record and interfaces

| System | Role |
|---|---|
| **Asana** | Canonical human work, context, decisions, approvals, status, and history |
| **Gas City plus Beads/Dolt** | Machine orchestration, durable workflow state, dependencies, agents, sessions, orders, and events |
| **GitHub** | Versioned prompts, formulas, schemas, policies, implementation, documentation, and approved artifacts |
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
- [Production editorial workflow stabilization](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216777414350711)
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
- The local Linux runtime runs as `matt` when the Debian WSL environment is active.
- GitHub CLI has historically authenticated as `Matt2021-A`; revalidate local authentication before relying on it after restart.
- Codex uses Matthew's OpenAI account for runtime entitlement when configured and authenticated.
- Local Gas City agents inherit neither Asana nor GitHub access.
- Future Phoenix collector, viewer, and MCP identities remain distinct.

The governing rule is:

> Agents may inherit work. They do not inherit another principal's identity, authority, connections, credentials, permissions, or unrelated context.

Consequential external actions must be performed by the principal that actually owns the connection, with Matthew's approval where required.

## Context architecture

Context is scoped as global, domain, project, and task context. Agents receive explicit context packages, not ambient access to every conversation or connected system.

Agents coordinate through Gas City's store-mediated mechanisms such as slung work, mail, hooks, Beads, routing, and artifacts. They do not talk directly or acquire one another's private connection state.

## Last observed Gas City runtime baseline

The last preserved Phase 1 runtime evidence used:

```text
City: /home/matt/matt-city-runtime
Rig:  /home/matt/src/matt-city
Dolt: 127.0.0.1:44381
```

The last observed component baseline was Debian GNU/Linux 13.5 under WSL2, Gas City 1.3.5, Beads 1.1.0, Dolt 2.2.1, native Docker Engine inside Debian, `builtin:codex`, and the managed bd/Dolt data plane. These are historical runtime observations, not September 10 live assertions. Revalidate them locally before acting on version-specific assumptions.

The earlier `fix/restore-bd-provider` branch recorded the recovery from the temporary file-provider path and subsequent editorial-workflow work. That branch has now been merged through PRs #12 and #13 and pruned remotely. `main` is the canonical versioned base; new changes should use a new branch and normal PR review.

## Native Phase 1 agents

Matt City contains hand-authored native agent scaffolds for:

- `run-operator`
- `researcher`
- `technical-analyst`
- `identity-security-analyst`
- `skeptic`

Editorial workflow agents are also present for the production content path.

Gas City projects runtime skills into `.agents/skills/` when the repository is registered as a rig. Those files come from installed Gas City packs and are ignored rather than vendored. See [.agents/README.md](.agents/README.md).

## Phase 1 workflow baseline

Smoke Test #3 validated one read-only, Asana-linked research workflow:

1. An Asana task supplied the objective, approved sources, questions, and acceptance criteria.
2. The primary assistant packaged the authorized context.
3. Gas City materialized the `research-topic` Formula V2 workflow.
4. Local run-operator and specialist sessions claimed and executed the tested work.
5. The workflow packaged artifacts and provenance.
6. The authorized assistant returned outputs to Asana.
7. Matthew reviewed the result.

That baseline does not prove the production `draft-technical-blog` workflow or current post-reboot runtime state. The production recovery task is the next execution gate.

## Trust and telemetry boundary

Local specialist agents may read approved inputs and write local generated artifacts. They receive no:

- Asana credentials
- GitHub credentials
- email or calendar credentials
- WordPress credentials
- inherited assistant connections
- unrelated private context

The first Phoenix implementation will collect correlation and lifecycle metadata only. It will not capture prompt bodies, tool input or output bodies, source-document bodies, connected-system content, credentials, secrets, or personal data by default.

## Phase 1 acceptance state

Demonstrated by the completed baseline:

- Gas City installation and version capture for the tested environment
- Debian WSL city initialization
- supervisor operation and automatic startup before the later reboot
- native Docker Engine installation inside Debian
- Codex provider registration and authentication
- Matt City rig registration
- managed bd/Dolt store accessibility
- cross-rig routing generation
- native run operator and specialist-agent configuration
- Formula V2 compilation and workflow materialization
- route, concrete claim, execution, packaging, provenance, and finalization for Smoke Test #3

Still required before Phase 1 exits:

- fresh post-reboot runtime and local-Git reconciliation
- stable production editorial route/claim/session behavior for `building-matt-city-blog-001`
- session replacement behavior demonstrated without lost durable work state
- regression and acceptance coverage
- operator documentation aligned to observed current behavior
- production editorial artifact packaging and provenance
- confirmation that no specialist agent performed an unauthorized external write

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
