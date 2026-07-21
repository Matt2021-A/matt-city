# Matt City Project Roadmap

- Status: Active
- Updated: 2026-07-20
- Canonical human roadmap: [Matt City project roadmap and phase gates](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216740612789172)
- Canonical project: [Matt City in Asana](https://app.asana.com/1/1204112251101459/project/1216444827581484)

## Purpose

This document is the versioned project roadmap for Matt City.

It covers the complete system rather than treating any one component, including Phoenix, as the project itself. Detailed task state, decisions, approvals, comments, and human ownership remain canonical in Asana. This file records the implementation sequence, phase gates, architecture boundaries, and deferred work in Git.

Matt City is being built as an identity-aware work system with six connected concerns:

1. durable machine execution
2. bounded context and workflow design
3. identity, authorization, approval, and provenance
4. observability and operator experience
5. governed external integrations
6. operational hardening and recovery

## Current project gate

The immediate gate is a fresh bd-backed Formula V2 workflow:

```text
Formula: research-topic
Request ID: phase-1-smoke-test-003
Branch: fix/restore-bd-provider
Lifecycle: cook -> route -> claim -> execute -> package -> finalize
```

Asana task: [Smoke Test #3: Fresh bd-backed end-to-end workflow](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216740708489953)

This run must create new workflow and session objects. It must not repair, reuse, or delete retained evidence from earlier smoke tests.

Success requires:

- a fresh Formula V2 graph in the managed bd/Dolt store
- supported routing to the qualified run operator
- concrete specialist sessions claiming their own work
- correct dependency, retry, outcome, and finalization behavior
- local artifacts and reconstructable provenance
- links back to the canonical Asana task and Git state
- no unauthorized external access or write
- either successful completion or a stable, fully evidenced failure

Phoenix and other new telemetry dependencies are excluded from this baseline run.

## Phase 0: Foundation and operating model

Status: Substantially complete.

### Delivered

- Asana established as the canonical human work, decision, approval, and status plane
- GitHub established as the versioned implementation and approved-artifact plane
- Gas City plus Beads/Dolt established as the machine execution and durable-state plane
- separate identities for Matthew, the primary assistant, GitHub authorship, Asana activity, local agents, runtime sessions, providers, collectors, viewers, and target-system principals
- identity and attribution model
- work-object mapping across Asana, Gas City, Beads, sessions, artifacts, and Git
- provenance schema
- approval and external-write boundary
- Debian 13 WSL2 runtime
- native Docker Engine inside Debian
- Gas City supervisor and automatic systemd startup
- Codex provider registration
- Matt City Pack v2, local run operator, specialist agents, and Formula V2 configuration
- managed bd/Dolt data plane restored as the active architecture

### Foundation rule

A new component must fit the existing authority model. It does not gain ownership merely because it can display or transport another system's data.

## Phase 1: Durable execution baseline

Status: Active.

### Objectives

- complete the fresh bd-backed end-to-end workflow
- prove route, claim, execution, dependency, retry, outcome, and finalization behavior
- prove durable workflow state survives session replacement
- capture workflow, Bead, event, agent, session, provider, Git, artifact, and approval identities together
- produce and validate local artifacts and provenance
- formalize the reusable request and context-package format
- complete the operator manual and reusable smoke-test runbook
- document the current slow status/session snapshot path without destructive cleanup
- preserve failed and superseded workflow evidence

### Exit gate

Phase 1 exits when a new operator can reconstruct and operate a normal workflow from versioned documentation without relying on hidden chat history, and when the execution result remains diagnosable without an observability sidecar.

### Canonical work

- [Smoke Test #3](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216740708489953)
- [Create Matt City Operator's Manual](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216647357424303)
- [Build Asana-first context package format](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216444828181081)

## Phase 2: Observability and operator experience

Status: Planned after the Phase 1 execution gate.

### Design

OpenTelemetry and OpenInference provide neutral instrumentation, semantic conventions, context propagation, and transport.

Phoenix is the primary Phase 2 interface for everything it represents naturally:

- complete workflow and agent traces
- formula, routing, claim, session, tool, artifact, and finalization spans
- annotations and human review
- datasets and experiments
- deterministic and later model-assisted evaluations
- trace-derived latency, error, usage, model, token, and cost signals where available
- comparison across workflow, prompt, model, provider, and configuration revisions

Phoenix does not own:

- workflow routing
- claim or assignment state
- durable workflow state
- authorization
- human approval
- canonical provenance
- source artifacts
- infrastructure truth

Gas City, Beads/Dolt, Asana, and GitHub remain authoritative for those concerns.

### Operator surfaces

The initial operator experience combines rather than duplicates existing surfaces:

- Phoenix for workflow traces, AI behavior, evaluations, and trace-derived signals
- Gas City CLI, API, and built-in views for formulas, workflows, Beads, routing, agents, sessions, orders, and events
- Asana for human work, decisions, blockers, and approval
- GitHub for versioned implementation and approved artifacts
- systemd, journald, Docker, process, filesystem, and direct store inspection for basic infrastructure troubleshooting

The Matt City dashboard work should provide coherent navigation, correlation, summaries, and degraded-state handling across those surfaces. It should not rebuild Phoenix trace and evaluation views merely to create a custom cockpit.

### Grafana decision

Grafana, Prometheus, Loki, Tempo, or equivalent operational stacks are deferred until Matt City demonstrates an unmet requirement for one or more of the following:

- continuous host or container metrics
- centralized log aggregation and search
- alerting
- service-level reporting
- independent operational retention
- correlation across multiple non-AI services at a scale direct tools cannot handle

OpenTelemetry compatibility preserves that option without requiring it during the first Phoenix deployment.

### Phase 2 sequence

1. Keep the uninstrumented Phase 1 baseline as evidence.
2. Finalize the metadata-first privacy and trace schema.
3. Deploy a pinned Phoenix version locally in Debian Docker.
4. Instrument a separate fresh workflow through OpenTelemetry/OpenInference.
5. Prove telemetry failure cannot stop or redefine execution.
6. Add deterministic evaluations.
7. Connect Phoenix traces to canonical Asana, Git, workflow, Bead, session, and artifact records.
8. Wire the dashboard/operator tasks around Phoenix and proven Gas City surfaces.
9. Document retention, access, backup, upgrades, health, and degraded behavior.
10. Add a separate operational stack only when a documented gap justifies it.

### Canonical work

- [Implement Phoenix as Matt City's AI observability and evaluation plane](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216732585597325)
- [Implement Matt City operator dashboard and observability integration](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216477412200438)
- [Add cost, health, audit, and operational reporting](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216444828063721)

## Phase 3: Core context and content workflows

Status: Design active, implementation gated by Phase 1.

### Objectives

- version the Asana-first request and context-package schema
- classify evidence as observed, versioned, documented, inferred, planned, failed, or temporary
- define staleness, conflict, sensitivity, relevance, and redaction behavior
- complete the TechThatMattRs workflow from topic intake through research, analysis, skeptical review, packaging, drafting, Matt Voice review, distribution planning, and human approval
- implement reusable approval, rejection, requested-change, timeout, and escalation states
- design the read-only Context Agent after the manual bounded-retrieval model is stable

### Exit gate

A complete content workflow can produce a reviewed local artifact and stop at the external-write boundary with every contribution and approval reconstructable.

### Canonical work

- [Build TechThatMattRs workflow](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216444887413796)
- [Define Asana context retrieval model](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216444723633271)
- [Build Context Agent](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216445116969545)
- [Define approval and escalation workflow in Asana](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216444723497848)

## Phase 4: Governed integrations and synchronization

Status: Deferred until the core workflow and approval model are proven.

### Objectives

- choose the long-term Asana integration principal and minimum permission scope
- implement narrow, idempotent Asana-to-Gas-City request creation
- return status, blockers, identifiers, artifacts, provenance, and approval requests to the correct Asana task
- add draft-only Google Docs transfer through the principal that owns the connection
- add WordPress draft creation only after the document-transfer boundary is proven
- extend GitHub automation while preserving separate author, reviewer, merger, and local-executor identities
- implement conflict, retry, duplication, and revocation handling

### Restrictions

- no specialist agent inherits the primary assistant's connectors
- no external write follows merely from local execution approval
- publication remains separate from draft creation
- applications, messages, deletion, permission changes, and consequential writes require explicit approval

### Canonical work

- [Design Asana integration principal and permission scope](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216444723524067)
- [Implement bidirectional Asana and Gas City synchronization](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216444723735803)
- [Add draft-only publishing integrations](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216444723687460)

## Phase 5: Workflow expansion

Status: Future.

### Career workflow

- role intake and freshness validation
- company and product research
- fit and compensation analysis
- apply or skip decision
- tailored materials
- interview preparation
- outcome tracking
- explicit approval before submissions or messages

### Social and business workflows

- draft-only social content first
- separate review and publishing identities
- Matt & Jody Co workflows introduced one bounded domain at a time
- sensitivity inventory before business-system access
- explicit approval before customer, household, financial, publishing, or messaging actions

### Canonical work

- [Build career workflow](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216444723633287)
- [Build social and business workflows](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216444723380034)

## Phase 6: Operational hardening

Status: Continuous, with major work after Phases 1 and 2.

### Objectives

- tested backup and restore for Beads/Dolt, artifacts, Phoenix, and required configuration
- off-host recovery where local-only storage is insufficient
- retention and capacity policies
- conservative component upgrade and rollback procedures
- package, schema, formula, prompt, and provider compatibility checks
- service identity lifecycle, rotation, revocation, and least-privilege review
- health checks and explicit degraded states
- incident evidence collection before repair
- recovery procedures that do not destroy failed-run evidence
- service and runtime naming migration only through a documented rollback plan
- security review for every new integration or state-changing interface

## Cross-cutting workstreams

These are not separate roadmap phases. They apply to every phase.

### Identity and authorization

Agents inherit bounded work, not another principal's identity, authority, credentials, connections, permissions, or unrelated context.

### Provenance

Every meaningful artifact must map back to the canonical Asana task and the actual workflow, Beads, agents, sessions, provider, Git state, inputs, outputs, failures, and approval state.

### Human control

Human approval is represented in Asana. It is not invented as a machine wait state, and it is not inferred from tool reachability.

### Privacy

Telemetry and context packages begin with metadata. Prompt bodies, tool bodies, source content, credentials, secrets, personal data, and connected-system content require explicit policy expansion.

### Failure behavior

Observability, dashboards, synchronization, and external integrations remain outside the local execution dependency chain unless a later architecture decision explicitly changes that boundary.

### Evidence preservation

Failed runs and superseded decisions remain part of the project record. They are not deleted or rewritten merely to make status appear cleaner.

## Explicitly deferred

The following are not current implementation gates:

- direct publishing
- automated job applications or outbound messages
- broad local-agent connector access
- Phoenix MCP access
- autonomous state-changing dashboard controls
- Grafana-class operational stack without a documented need
- Wasteland or multi-city federation
- runtime host renaming during the current smoke-test cycle
- destructive store cleanup performed only to remove warnings

## Roadmap maintenance

Update this file and the canonical Asana roadmap whenever any of the following changes:

- current phase or gate
- selected architecture component
- authority boundary
- sequencing dependency
- privacy policy
- external-write policy
- success criteria
- deferred component status

Project status updates should summarize the complete roadmap and current gate. They should not present the most recently selected component as though it were the project.