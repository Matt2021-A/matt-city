# ADR-0001: Phoenix as the AI Observability and Evaluation Plane

- Status: Accepted
- Date: 2026-07-20
- Decision owner: Matthew Romero
- Canonical Asana task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216732585597325

## Context

Matt City needs to reconstruct what an agent workflow did, identify where a run stopped, attribute work to the correct workflow, Bead, agent, and session, compare revisions, and evaluate whether a change improved the result.

Gas City plus Beads/Dolt already own machine execution and durable workflow state. Asana owns human work, decisions, approvals, and project context. GitHub owns versioned implementation and approved artifacts. Operational metrics and logs require a separate infrastructure-focused plane.

A dedicated AI-specific trace and evaluation layer is still needed.

## Decision

Matt City will use Arize Phoenix as its AI-specific observability and evaluation plane.

Phoenix will own:

- AI execution traces
- span and trace annotations
- datasets
- experiments
- deterministic and later model-assisted evaluations

Phoenix will not own:

- workflow routing
- task assignment
- claim state
- durable workflow state
- authorization
- human approval
- canonical provenance
- source artifacts
- operational infrastructure metrics and logs

## System boundaries

| System | Authority |
|---|---|
| Asana | human work, context, decisions, approvals, and status |
| Gas City plus Beads/Dolt | machine execution and durable workflow state |
| GitHub | versioned implementation and approved artifacts |
| OpenTelemetry plus Grafana | operational metrics, logs, and health |
| Phoenix | AI traces, annotations, datasets, experiments, and evaluations |

Phoenix may correlate identifiers from the other systems. Correlation does not transfer authority.

## Sequencing

Phoenix implementation follows the current bd-backed workflow baseline.

1. Complete or stabilize a fresh end-to-end bd-backed workflow.
2. Define the privacy-safe trace schema.
3. Deploy a pinned Phoenix version locally.
4. Instrument one fresh workflow with metadata-first spans.
5. Prove that execution continues when Phoenix is unavailable.
6. Add deterministic evaluations.
7. Operationalize retention, access, health, upgrades, and documentation.

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
- telemetry collector
- telemetry viewer
- future Phoenix MCP principal

Collector access does not imply viewer access. Viewer access does not imply mutation access. MCP access is deferred until its permission and mutation boundaries are explicitly designed.

## Failure behavior

Telemetry is observational and non-blocking.

- Phoenix unavailability must not stop workflow execution.
- Export failure must not change workflow success or failure state.
- Buffered or dropped telemetry must be visible as an operational condition.
- A workflow must remain diagnosable from Gas City, Beads/Dolt, GitHub, and Asana even when Phoenix data is absent.

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

## Licensing and cost assumption

Phoenix is recorded as an Elastic License 2.0 dependency. The project assumes no Phoenix software license fee for the planned local internal deployment. Compute, storage, retention, upgrades, backup, and maintenance remain project costs.

This is an implementation assumption, not a claim that operating Phoenix is cost-free.

## Consequences

Benefits:

- clearer workflow stopping-point analysis
- correlation across workflow, Bead, agent, session, Asana, and Git
- repeatable comparison of workflow, prompt, and model revisions
- a place for datasets, experiments, and evaluation results

Costs and risks:

- additional local service and storage footprint
- retention and upgrade responsibility
- potential sensitive-data exposure if capture policy drifts
- possible confusion between telemetry and canonical provenance
- future access-control work for collectors, viewers, and MCP access

## Acceptance

This decision is implemented when:

- a fresh Matt City workflow appears as a complete Phoenix trace
- correlation identifiers resolve back to canonical systems
- no sensitive content is captured by default
- execution continues when Phoenix is unavailable
- deterministic evaluations compare at least two revisions
- retention, access, maintenance, and degraded behavior are documented
