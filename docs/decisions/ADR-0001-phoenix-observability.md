# ADR-0001: Phoenix as the AI Observability and Evaluation Plane

- Status: Accepted
- Date: 2026-07-20
- Amended: 2026-07-20
- Decision owner: Matthew Romero
- Canonical Asana task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216732585597325
- Project roadmap: ../roadmap.md

## Context

Matt City needs to reconstruct what an agent workflow did, identify where a run stopped, attribute work to the correct workflow, Bead, agent, and session, compare revisions, and evaluate whether a change improved the result.

Gas City plus Beads/Dolt already own machine execution and durable workflow state. Asana owns human work, decisions, approvals, and project context. GitHub owns versioned implementation and approved artifacts.

A dedicated AI-specific trace and evaluation interface is still needed. OpenTelemetry and OpenInference provide a suitable neutral instrumentation and transport layer, but they are not themselves the operator interface.

The original form of this ADR placed Phoenix beside a presumed OpenTelemetry plus Grafana operational stack. That separation is valid as a possible long-term architecture, but it adds a second cockpit before Matt City has demonstrated an operational requirement Phoenix and direct system tools cannot satisfy.

## Decision

Matt City will use Arize Phoenix as its primary Phase 2 observability and evaluation interface for the telemetry Phoenix represents naturally.

Phoenix will own the interface for:

- AI execution traces
- workflow and agent span inspection
- span and trace annotations
- datasets
- experiments
- deterministic and later model-assisted evaluations
- trace-derived latency, error, provider, model, usage, token, and cost signals where available
- comparison across workflow, prompt, model, provider, and configuration revisions

OpenTelemetry and OpenInference will own:

- instrumentation contracts
- semantic conventions
- trace context and correlation propagation
- telemetry transport
- filtering, redaction, buffering, and future fan-out when a collector is introduced

Phoenix will not own:

- workflow routing
- task assignment
- claim state
- durable workflow state
- authorization
- human approval
- canonical provenance
- source artifacts
- infrastructure truth

Gas City CLI/API, Beads/Dolt, systemd, journald, Docker, process, filesystem, and direct store inspection remain the initial operational troubleshooting surfaces.

Grafana, Prometheus, Loki, Tempo, or equivalent operational tooling is deferred until a documented requirement exists for continuous infrastructure metrics, centralized logs, alerting, service-level reporting, independent operational retention, or cross-service correlation at a scale direct tools cannot handle.

## System boundaries

| System | Authority or role |
|---|---|
| Asana | human work, context, decisions, approvals, and status |
| Gas City plus Beads/Dolt | machine execution and durable workflow state |
| GitHub | versioned implementation and approved artifacts |
| OpenTelemetry/OpenInference | neutral instrumentation, semantics, context propagation, and transport |
| Phoenix | primary trace, AI-observability, experiment, dataset, annotation, and evaluation interface |
| Gas City plus system tools | initial operational diagnosis and infrastructure truth |
| Future Grafana-class stack | deferred, requirement-driven operational metrics, logs, alerting, and retention |

Phoenix may correlate identifiers from the other systems. Correlation does not transfer authority.

## Sequencing

Phoenix implementation follows the current bd-backed workflow baseline.

1. Complete or stabilize a fresh end-to-end bd-backed workflow.
2. Define and review the privacy-safe trace schema.
3. Deploy a pinned Phoenix version locally.
4. Instrument a separate fresh workflow with metadata-first spans through OpenTelemetry/OpenInference.
5. Prove that execution continues and retains canonical diagnosis when Phoenix is unavailable.
6. Add deterministic evaluations.
7. Wire the operator/dashboard work to Phoenix and canonical Gas City, Asana, Git, Bead, session, and artifact records.
8. Operationalize retention, access, health, upgrades, backup, and documentation.
9. Add a Grafana-class stack only after recording the unmet operational requirement and its ownership boundary.

Phoenix is Phase 2 within the broader Matt City roadmap. It is not the project roadmap itself.

## Deployment baseline

The pilot deployment will:

- run inside the Debian 13 WSL2 instance
- use the native Docker Engine already managed by Debian systemd
- bind to localhost by default
- expose the Phoenix user interface on localhost port 6006
- accept OpenTelemetry Protocol traffic on localhost port 4317
- use a persistent local volume
- pin the Phoenix image version
- disable or avoid external telemetry where supported
- remain outside the workflow execution dependency chain

A local OpenTelemetry Collector may be added when filtering, redaction, buffering, or fan-out requirements justify it. Direct export to Phoenix is acceptable for the first bounded pilot when the same privacy and fail-open behavior can be demonstrated.

Exact image tags, storage settings, and retention values will be recorded during implementation rather than guessed in this ADR.

## Privacy and security policy

The initial implementation is metadata-first.

Allowed initial data categories:

- request ID
- Asana project and task GIDs
- formula name and version
- workflow root Bead ID
- step and attempt Bead IDs
- city and rig identifiers
- agent and concrete session identifiers
- provider and model names
- Gas City, Beads, and Dolt versions
- Git commit
- approval state
- artifact path and hash
- timestamps, status transitions, duration, and error class
- safely exposed usage or cost metadata

Excluded by default:

- prompt bodies
- tool input or output bodies
- source-document bodies
- connected-system content
- credentials
- secrets
- personal data

Any expansion of captured content requires an explicit policy decision and review.

## Identity model

The following identities remain separate:

- workflow executor
- telemetry instrumentor
- telemetry collector
- telemetry viewer
- operator-dashboard viewer
- future Phoenix MCP principal

Collector access does not imply viewer access. Viewer access does not imply mutation access. Dashboard access does not imply execution authority. MCP access is deferred until its permission and mutation boundaries are explicitly designed.

## Failure behavior

Telemetry is observational and non-blocking.

- Phoenix unavailability must not stop workflow execution.
- Export failure must not change workflow success or failure state.
- Buffered or dropped telemetry must be visible as an operational condition.
- A workflow must remain diagnosable from Gas City, Beads/Dolt, GitHub, Asana, and local operational evidence when Phoenix data is absent.
- A dashboard must show unavailable or degraded telemetry rather than infer a healthy state.

## Evaluation policy

Deterministic evaluations come before LLM-judge evaluations.

Initial deterministic checks:

- `all_expected_steps_created`
- `all_steps_have_run_target`
- `all_steps_reached_terminal_state`
- `required_provenance_present`
- `artifact_paths_exist`
- `no_unauthorized_external_write`
- `workflow_completion_recorded`

LLM judges remain secondary to deterministic checks and human review.

## Operational-stack trigger

A separate Grafana-class operational stack may be proposed when at least one requirement is not adequately handled by Phoenix and direct local tools.

The proposal must identify:

- the unmet operator question
- the required signal type
- the source and authority of that signal
- retention and storage requirements
- alerting requirements
- access and identity boundaries
- maintenance and recovery cost
- why a new interface is preferable to extending the existing operator workflow

OpenTelemetry compatibility makes later fan-out possible without pre-installing every backend.

## Licensing and cost assumption

Phoenix is recorded as an Elastic License 2.0 dependency. The project assumes no Phoenix software license fee for the planned local internal deployment. Compute, storage, retention, upgrades, backup, and maintenance remain project costs.

This is an implementation assumption, not a claim that operating Phoenix is cost-free.

## Consequences

Benefits:

- one primary Phase 2 interface for workflow traces, AI behavior, evaluations, and trace-derived signals
- less duplicated dashboard work
- clearer workflow stopping-point analysis
- correlation across workflow, Bead, agent, session, Asana, Git, provider, model, and artifact
- repeatable comparison of workflow, prompt, model, and configuration revisions
- a place for datasets, experiments, annotations, and evaluation results
- a neutral telemetry layer that preserves future backend choice
- an explicit gate before adding a broader operational stack

Costs and risks:

- additional local service and storage footprint
- retention, backup, and upgrade responsibility
- potential sensitive-data exposure if capture policy drifts
- possible confusion between telemetry and canonical provenance
- possible overloading of Phoenix with questions it does not answer well
- future access-control work for collectors, viewers, dashboard access, and MCP access
- a later operational stack may still be required

## Acceptance

This decision is implemented when:

- a fresh Matt City workflow appears as a complete Phoenix trace
- the Phoenix interface answers the expected workflow, agent, session, latency, error, and evaluation questions without a duplicate custom trace dashboard
- correlation identifiers resolve back to canonical systems
- no sensitive content is captured by default
- execution continues when Phoenix is unavailable
- deterministic evaluations compare at least two revisions
- dashboard and operator navigation integrate Phoenix with Gas City, Asana, Git, and artifacts
- retention, access, backup, maintenance, and degraded behavior are documented
- any proposed Grafana-class addition is justified by a recorded unmet operational requirement
