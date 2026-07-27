# Asana Context Snapshot for Smoke Test #3

## Canonical project roadmap

- Project: Matt City
- Project GID: 1216444827581484
- Roadmap task: Matt City project roadmap and phase gates
- Roadmap task GID: 1216740612789172

## Canonical execution task

- Task: Smoke Test #3: Fresh bd-backed end-to-end workflow
- Task GID: 1216740708489953
- Status: Current Phase 1 project gate
- Request ID: phase-1-smoke-test-003

## Originating content context

- Blog project GID: 1213500168987836
- Blog task GID: 1216445335991016
- Article: Building Matt City: An Identity-Aware Multi-Agent Work System

The blog task supplies downstream context only. This smoke test does not write
to Google Docs, WordPress, Asana, GitHub, or another external system.

## Current architecture

- Asana is canonical for human work, decisions, approval, and status.
- Gas City plus Beads/Dolt are canonical for machine execution and durable
  workflow state.
- GitHub is canonical for versioned implementation and approved artifacts.
- The primary assistant interprets intent, packages context, delegates bounded
  work, synthesizes results, and performs separately authorized external
  actions through its own identities.
- Local agents do not inherit the primary assistant's credentials, connectors,
  permissions, or unrelated context.

## Current runtime baseline

- Debian GNU/Linux 13.5 under WSL2
- Repository: /home/matt/src/matt-city
- Runtime: /home/matt/matt-city-runtime
- Gas City: 1.3.5
- Beads: 1.1.0
- Dolt: 2.2.1
- Beads provider: bd
- Durable store: city-managed Dolt service
- Local execution provider: builtin:codex
- Docker Engine: native inside Debian
- Startup: Gas City supervisor and Matt City systemd services
- Implementation branch: fix/restore-bd-provider

Exact runtime versions, Git commit, service state, and health observations must
be captured again during execution rather than assumed from this snapshot.

## Historical smoke-test evidence

### Smoke Test #1

- Request ID: phase-1-smoke-test-001
- Workflow root: gc-465
- Generated graph: gc-465 through gc-481
- Diagnostic session Bead: gc-686
- Result: formula graph created, but the intended route and concrete claim path
  were not proven
- Forced routing did not establish valid worker visibility
- The failed graph remains preserved as historical evidence

### Smoke Test #2

- Request ID: phase-1-smoke-test-002
- Workflow root: gc-38022
- Generated graph: gc-38022 through gc-38039
- Result: fresh bd-backed graph materialized successfully
- Hold point: root inspection and supported launch path
- The graph was not advanced through manual downstream routing
- The retained result is historical evidence, not the workflow for this test

## Corrections now in place

- The repository example uses the bd-backed provider.
- Formula V2 steps use `metadata.gc.run_target`.
- The qualified local run operator is `matt-city/matt.run-operator`.
- Specialist targets are:
  - matt-city/matt.researcher
  - matt-city/matt.technical-analyst
  - matt-city/matt.identity-security-analyst
  - matt-city/matt.skeptic
- The run operator claims work through the standard `gc hook --claim --json`
  protocol.
- Generated downstream attempts are not manually routed during normal
  execution.
- The current workflow must use new request, Bead, workflow, and session
  identities.

## Current project gate

The project must prove:

`cook -> route -> claim -> execute -> package -> finalize`

The result must include durable state, local artifacts, hashes, concrete
sessions, explicit outcomes, and reconstructable provenance.

## Observability roadmap

Phoenix is an accepted Phase 2 component.

OpenTelemetry and OpenInference will provide neutral instrumentation and
transport. Phoenix will be the primary interface for AI workflow traces,
annotations, datasets, experiments, evaluations, and trace-derived signals.

Phoenix is not workflow authority, canonical provenance, or durable execution
state.

Smoke Test #3 is deliberately uninstrumented. No Phoenix, OpenTelemetry
exporter, evaluation hook, or dashboard dependency may be added to this run.

## Known operational warnings

- Gas City status and session snapshots have shown substantial latency.
- The managed store has shown transaction conflict and storage-churn warnings.
- These warnings are not proof of corruption or workflow failure.
- Do not restart services, clean Dolt, truncate logs, delete records, or perform
  destructive maintenance merely to make the smoke test appear cleaner.
- Failures must remain visible and attributable.

## Approval boundary

Matthew has approved:

- creation of this local request package
- creation of a fresh originating request Bead
- local Formula V2 materialization and routing
- local run-operator and specialist execution
- local artifact creation
- local provenance capture
- read-only diagnostic inspection of the resulting workflow

Matthew has not delegated to local agents:

- Asana access
- GitHub access
- Google Drive access
- email, calendar, contacts, or Slack access
- WordPress or publishing access
- external messages
- credential use belonging to Matthew or the primary assistant
- Phoenix instrumentation for the baseline run
- deletion or repair of prior workflow evidence
