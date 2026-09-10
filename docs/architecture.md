# Matt City Architecture

Matt City separates human work, machine execution, versioned implementation, telemetry transport, observability interfaces, and external actions into distinct planes.

The complete implementation sequence is maintained in [Matt City Project Roadmap](roadmap.md).

```text
Matthew
   |
   v
ASANA
canonical work, decisions, approvals, and project context
   |
   +----------------> Primary assistant
   |                  interprets intent, retrieves bounded context,
   |                  delegates, synthesizes, and performs authorized returns
   |
   v
GAS CITY + BEADS/DOLT
formulas, workflows, routing, claims, dependencies,
agents, sessions, orders, events, and durable state
   |
   +----------------> Specialist agents
   |                  bounded local research, analysis, review, and writing
   |
   +----------------> OpenTelemetry / OpenInference
   |                  instrumentation, semantic conventions,
   |                  context propagation, and transport
   |                         |
   |                         v
   |                     PHOENIX
   |                     primary Phase 2 interface for traces,
   |                     evaluations, datasets, experiments,
   |                     annotations, and trace-derived signals
   |
   +----------------> Gas City + system tools
   |                  workflow inspection, service health, logs,
   |                  Docker, process, filesystem, and store diagnosis
   |
   v
ARTIFACT + PROVENANCE LAYER
   |
   v
GITHUB
versioned implementation and approved artifacts
   |
   v
ASANA
links, findings, blockers, decisions, approval requests, and final status
```

## System responsibilities

### Asana

Asana is the canonical human work, context, decision, and approval plane.

- Every workflow begins with an Asana task.
- The task contains or links the objective, sources, questions, prior work, decisions, constraints, and acceptance criteria.
- Results, blockers, artifacts, approval requests, and final status return to the task.
- The task remains the durable parent work object when machine sessions terminate.
- Human approval is represented in Asana, not as an invented machine wait state.
- The project roadmap in Asana remains canonical for phase state and human sequencing.

### Primary assistant

- Operates through its own Asana, GitHub, Google Drive, and other connected identities.
- Interprets Matthew's intent and retrieves relevant shared context.
- Creates a structured machine request referencing the Asana task.
- Delegates work without transferring identity, authority, credentials, or unrelated context.
- Synthesizes outputs and performs authorized external updates through its own connected identities.

### Gas City plus Beads/Dolt

- Gas City manages formulas, routing, claims, dependencies, agents, sessions, retries, orders, and events.
- Beads and Dolt hold durable machine work and workflow state.
- Machine execution exists beneath the originating Asana task.
- The execution plane does not replace Asana as the human project system of record.
- The execution plane remains authoritative for machine lifecycle state, even when a live session is replaced.
- Dashboard or telemetry data never overrides the durable execution record.

### Specialist agents

- Operate within narrow prompts and local-file capabilities.
- Receive bounded context packages rather than universal project access.
- Do not receive Asana, GitHub, email, calendar, publishing, or telemetry-administration credentials.
- Record their actual agent, session, provider, and contribution identities.

### GitHub

- Stores version-controlled prompts, formulas, schemas, policies, implementation code, documentation, roadmap decisions, and approved artifacts.
- Commits and pull requests should reference the originating Asana task where practical.
- Runtime-generated state is not committed as a substitute for Beads/Dolt or Asana history.
- The repository roadmap records architecture and phase gates but does not replace live task state in Asana.

### OpenTelemetry and OpenInference

OpenTelemetry and OpenInference are the neutral instrumentation and transport layer.

- Define or carry trace context and semantic metadata.
- Export telemetry without becoming an execution dependency.
- Allow filtering, redaction, buffering, and future fan-out through a collector when justified.
- Preserve the option to add another backend later without coupling workflow code directly to that backend.
- Do not own workflow state, authorization, approval, or canonical provenance.

### Phoenix

Phoenix is the committed primary Phase 2 observability and evaluation interface.

- Stores and displays AI traces, annotations, datasets, experiments, and evaluations.
- Correlates workflow, Bead, session, agent, Asana, Git, provider, model, artifact, and outcome identifiers.
- Provides the first interface for trace-derived latency, error, usage, token, model, and cost signals where available.
- Remains observational and outside the execution dependency chain.
- Does not own workflow routing, authorization, approval, durable state, or canonical provenance.
- Starts with metadata-only spans and excludes sensitive content by default.
- Uses distinct collector, viewer, and future MCP identities.

### Gas City and system operational tools

The initial operational plane uses the tools already authoritative for the local runtime:

- Gas City CLI, API, doctor checks, events, and built-in views
- systemd service state and journal output
- Docker service, container, volume, and log inspection
- process, filesystem, disk, and direct store inspection

These surfaces cover basic infrastructure and service diagnosis without requiring a second dashboard stack during the first Phoenix deployment.

### Future Grafana-class stack

Grafana, Prometheus, Loki, Tempo, or equivalent components are deferred until a concrete operational requirement is documented.

Potential triggers include:

- continuous host or container metrics
- centralized log aggregation and search
- alerting
- service-level reporting
- separate operational retention
- correlation across multiple non-AI services at a scale direct tools cannot handle

OpenTelemetry compatibility preserves this option. Deferral is not a ban, and inclusion is not automatic.

### Operator dashboard and integration layer

The Matt City operator-dashboard work should connect existing surfaces rather than reproduce them.

- Use Phoenix for workflow traces, AI behavior, evaluations, and trace-derived signals.
- Use Gas City and Beads/Dolt for authoritative workflow and session state.
- Link to Asana and GitHub for canonical human and versioned records.
- Surface systemd, Docker, collector, store, and Phoenix health with explicit degraded states.
- Add custom summaries or navigation only where they reduce operator friction.
- Keep state-changing controls separately authorized and attributed.

## Work-object relationship

```text
Asana project
  └── Asana task: canonical human request, decision, or approval
        └── Gas City workflow: machine execution instance
              ├── root Bead
              ├── step and attempt Beads
              ├── routing and claim state
              ├── agent sessions
              ├── artifacts and provenance
              └── Phoenix trace correlation
                    └── linked back to canonical Asana, Git, and Bead objects
```

Phoenix references canonical identifiers but does not replace them.

## Execution lifecycle

1. Validate the originating Asana task and required fields.
2. Build a bounded context package from the task, related work, and approved links.
3. Materialize a Formula V2 workflow referencing the Asana project and task GIDs.
4. Route claimable work to a concrete run target.
5. A session claims and performs the bounded step.
6. Durable state is recorded in Beads/Dolt.
7. Artifacts and provenance are packaged in Git-versionable paths.
8. Workflow finalization records terminal state.
9. The authorized assistant returns or links outputs to Asana.
10. Matthew reviews and approves downstream use.
11. A separate instrumented run may export metadata-first telemetry to Phoenix without altering steps 1 through 10.

## Current execution boundary

Smoke Test #3 completed the tested local research lifecycle and is retained as baseline evidence. The current execution gate is the production editorial request `building-matt-city-blog-001` after read-only post-reboot runtime reconciliation.

The last durable recorded production workflow pointer is `mc-069`, with outline attempt `mc-417`. Because the Debian WSL runtime has not been directly revalidated since the August 23, 2026 Windows Update reboot, those identifiers describe the last preserved state rather than a claim about what is currently live.

GitHub `main` is the canonical versioned base after PR #13. Historical references to `fix/restore-bd-provider` describe the branch on which earlier work occurred and must not be treated as current branch instructions.

## Identity and authority chain

The following roles must remain distinct even when one person or service occupies several of them:

- resource owner
- human initiator
- delegating assistant principal
- canonical task owner
- Gas City agent
- runtime session
- provider entitlement holder
- target-system authenticated principal
- telemetry instrumentor
- telemetry collector
- telemetry viewer
- dashboard operator
- reviewer
- approver

The governing rule is:

> Agents may inherit work. They do not inherit another principal's identity, authority, connections, credentials, permissions, or unrelated context.

## Telemetry boundary

The first Phoenix implementation records correlation and lifecycle metadata only.

Allowed initial categories include:

- request and workflow identifiers
- Asana project and task GIDs
- formula name and version
- root, step, and attempt Bead IDs
- city, rig, agent, and session identifiers
- provider and model names
- Git commit and artifact hashes
- approval state
- timestamps, status transitions, durations, and error classes
- trace-derived usage or cost fields when the provider exposes them safely

Excluded by default:

- prompt bodies
- tool input or output bodies
- source-document bodies
- connected-system content
- credentials or secrets
- personal data

Telemetry failure must not stop, roll back, or invalidate workflow execution.

## Roadmap boundary

Phoenix, dashboards, context automation, publishing, and career or business workflows are phases within Matt City. None of them is the whole project.

The project sequence is:

1. foundation and operating model
2. durable execution baseline
3. observability and operator experience
4. core context and content workflows
5. governed integrations and synchronization
6. workflow expansion
7. operational hardening across all phases

See [Matt City Project Roadmap](roadmap.md) for gates, deferred work, and canonical Asana links.

## Primary implementation references

- Matt City Asana project: https://app.asana.com/1/1204112251101459/project/1216444827581484
- Matt City roadmap task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216740612789172
- Current production workflow stabilization task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216777414350711
- Completed Smoke Test #3 baseline task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216740708489953
- Phoenix implementation task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216732585597325
- Operator dashboard task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216477412200438
- Gas City documentation: https://docs.gascity.com/
- Gas City repository: https://github.com/gastownhall/gascity/
- Phoenix repository: https://github.com/Arize-ai/phoenix
- Phoenix documentation: https://arize.com/docs/phoenix
