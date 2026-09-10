# Matt City Project Roadmap

- Status: Active
- Updated: 2026-09-10
- Canonical human roadmap: [Matt City project roadmap and phase gates](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216740612789172)
- Canonical project: [Matt City in Asana](https://app.asana.com/1/1204112251101459/project/1216444827581484)

## Purpose

This document is the versioned project roadmap for Matt City.

It covers the complete system rather than treating any one component as the project itself. Detailed task state, decisions, approvals, comments, and human ownership remain canonical in Asana. This file records implementation sequence, phase gates, architecture boundaries, and deferred work in Git.

Matt City is being built as an identity-aware work system with six connected concerns:

1. durable machine execution
2. bounded context and workflow design
3. identity, authorization, approval, and provenance
4. observability and operator experience
5. governed external integrations
6. operational hardening and recovery

## Current project gate

Smoke Test #3 is complete. It demonstrated the tested local bd-backed Formula V2 lifecycle through:

```text
cook -> route -> claim -> execute -> package -> finalize
```

That result is retained as Phase 1 baseline evidence. It is not the current gate.

The current operational gate is recovery of production request `building-matt-city-blog-001` under [Stabilize research-to-draft workflow for building-matt-city-blog-001](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216777414350711).

Last durable recorded production state:

```text
Request: building-matt-city-blog-001
Formula: draft-technical-blog
Workflow pointer: mc-069
Recorded outline attempt: mc-417
Repository base: main
Latest main consolidation: PR #13 / 733d811199cea3c00bf30e3e993c3a624021c1f9
```

The August runtime investigation ended after an unapproved Windows Update reboot on August 23, 2026. The Debian WSL runtime has not been directly revalidated since that reboot. Therefore service state, live versions, sessions, `mc-069`/`mc-417` state, claimability, and local worktree state are unknown until a fresh read-only local capture is performed.

The next safe sequence is:

1. Reconcile the local Git worktree to current remote truth without deleting untracked evidence.
2. Revalidate Gas City paths/version resolution and the two user services.
3. Run bounded health inspection.
4. Inspect `mc-069`, `mc-417`, strategist/control sessions, artifact existence, and claimability.
5. Preserve the capture.
6. Only then decide whether the existing durable workflow can resume or a replacement execution attempt is required.

Do not launch a duplicate workflow, manually claim work, force-route downstream steps, clean untracked state, or make destructive store changes merely to advance the graph.

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
- Debian WSL2 runtime baseline
- native Docker Engine inside Debian
- Gas City supervisor and automatic systemd startup baseline
- Codex provider registration
- Matt City Pack v2, local run operator, specialist agents, and Formula V2 configuration
- managed bd/Dolt data plane restored as the intended architecture

### Foundation rule

A new component must fit the existing authority model. It does not gain ownership merely because it can display or transport another system's data.

## Phase 1: Durable execution baseline

Status: Active.

### Demonstrated

Smoke Test #3 demonstrated a fresh bd-backed workflow with concrete route, claim, specialist execution, packaging, provenance, and terminal finalization for the tested path.

### Remaining objectives

- complete read-only post-reboot runtime reconciliation
- stabilize production editorial route/claim/session behavior
- prove durable workflow state survives session replacement in the production path
- complete regression and acceptance coverage
- capture workflow, Bead, event, agent, session, provider, Git, artifact, and approval identities together
- produce and validate local production artifacts and provenance
- formalize the reusable request and context-package format
- complete the operator manual and reusable smoke-test/recovery runbook
- characterize slow status/session snapshot behavior without destructive cleanup
- preserve failed and superseded workflow evidence

### Exit gate

Phase 1 exits when a new operator can reconstruct and operate a normal workflow from versioned documentation without relying on hidden chat history, and when the execution result remains diagnosable without an observability sidecar.

### Canonical work

- [Production editorial workflow stabilization](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216777414350711)
- [Smoke Test #3, completed baseline evidence](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216740708489953)
- [Create Matt City Operator's Manual](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216647357424303)
- [Build Matt City workflow regression and acceptance test suite](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216777394352544)
- [Build Asana-first context package format](https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216444828181081)

## Phase 2: Observability and operator experience

Status: Planned after the Phase 1 execution and production-workflow baseline is stable.

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

Phoenix does not own workflow routing, claim state, durable workflow state, authorization, human approval, canonical provenance, or source artifacts.

### Operator surfaces

The initial operator experience combines rather than duplicates existing surfaces:

- Phoenix for workflow traces, AI behavior, evaluations, and trace-derived signals
- Gas City and Beads/Dolt for authoritative workflow and session state
- Asana for human work, decisions, blockers, and approval
- GitHub for versioned implementation and approved artifacts
- systemd, journald, Docker, process, filesystem, and direct store inspection for infrastructure troubleshooting

### Grafana decision

Grafana, Prometheus, Loki, Tempo, or equivalent operational stacks remain deferred until Matt City demonstrates an unmet requirement for continuous host/container metrics, centralized logs, alerting, service-level reporting, independent operational retention, or cross-service correlation at a scale direct tools cannot handle.

### Phase 2 sequence

1. Preserve the uninstrumented Phase 1 baseline as evidence.
2. Finalize the metadata-first privacy and trace schema.
3. Deploy a pinned Phoenix version locally in Debian Docker.
4. Instrument a separate fresh workflow through OpenTelemetry/OpenInference.
5. Prove telemetry failure cannot stop or redefine execution.
6. Add deterministic evaluations.
7. Connect Phoenix traces to canonical Asana, Git, workflow, Bead, session, and artifact records.
8. Wire dashboard/operator tasks around Phoenix and proven Gas City surfaces.
9. Document retention, access, backup, upgrades, health, and degraded behavior.
10. Add a separate operational stack only when a documented gap justifies it.

## Phase 3: Core context and content workflows

Status: Design and production bridge active; implementation remains gated by the Phase 1 production-workflow recovery.

### Objectives

- version the Asana-first request and context-package schema
- classify evidence as observed, versioned, documented, inferred, planned, failed, or temporary
- define staleness, conflict, sensitivity, relevance, and redaction behavior
- complete the TechThatMattRs workflow from topic intake through research, analysis, skeptical review, packaging, drafting, Matt Voice review, distribution planning, and human approval
- implement reusable approval, rejection, requested-change, timeout, and escalation states
- design the read-only Context Agent after the manual bounded-retrieval model is stable

### Current production acceptance case

`building-matt-city-blog-001` is the first real content-production acceptance case. Its approved editorial brief and story map already exist, and Matthew approved local outline/draft execution on July 21, 2026. The system must produce a recognizable draft through Matt City before any external transfer or publication is considered.

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

## Cross-cutting rules

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
- runtime host renaming during the current recovery cycle
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
