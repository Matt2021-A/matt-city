# Matt City Phoenix Trace and Correlation Schema

- Status: Draft for implementation
- Canonical Asana task: https://app.asana.com/1/1204112251101459/task/1216732585818405
- Depends on: a successful or stable-failure bd-backed workflow baseline

## Purpose

This schema defines the first metadata-only Phoenix trace model for Matt City. It is designed to answer operational questions without capturing prompt bodies, tool content, source-document bodies, credentials, secrets, or personal data.

The schema is not canonical workflow state. Gas City plus Beads/Dolt remain authoritative for execution. Asana remains authoritative for human work and approvals. GitHub remains authoritative for versioned implementation and approved artifacts.

## Root trace

```text
matt-city.workflow
```

One root trace represents one fresh Matt City workflow instance.

## Candidate child spans

```text
formula.cook
workflow.launch
step.materialize
step.route
step.claim
agent.session
artifact.write
workflow.finalize
```

Additional spans require a clear operational question. The first implementation should remain small enough to inspect manually.

## Required correlation attributes

### Request and governance

- `matt_city.request.id`
- `matt_city.asana.project_gid`
- `matt_city.asana.task_gid`
- `matt_city.approval.state`
- `matt_city.requester`
- `matt_city.delegator`

### Formula and workflow

- `matt_city.formula.name`
- `matt_city.formula.version`
- `matt_city.workflow.root_bead_id`
- `matt_city.workflow.status`

### Step and durable work

- `matt_city.step.name`
- `matt_city.step.bead_id`
- `matt_city.step.attempt_bead_id`
- `matt_city.step.run_target`
- `matt_city.step.claim_state`
- `matt_city.step.status`

### Runtime identity

- `matt_city.city`
- `matt_city.rig`
- `matt_city.agent`
- `matt_city.session.id`
- `matt_city.session.name`
- `matt_city.provider`
- `matt_city.model`

### Version and implementation

- `matt_city.git.commit`
- `matt_city.gas_city.version`
- `matt_city.beads.version`
- `matt_city.dolt.version`

### Artifact correlation

- `matt_city.artifact.path`
- `matt_city.artifact.sha256`
- `matt_city.artifact.type`

### Outcome

- `matt_city.outcome.status`
- `matt_city.error.class`
- `matt_city.error.code`
- `matt_city.retry.count`

## Span requirements

### `formula.cook`

Required:

- request ID
- Asana project and task GIDs
- formula name and version
- Git commit
- resulting workflow root Bead ID
- success or failure status

### `workflow.launch`

Required:

- workflow root Bead ID
- city and rig
- initial workflow state
- launch timestamp

### `step.materialize`

Required:

- workflow root Bead ID
- step name
- step and attempt Bead IDs
- dependency identifiers
- run target

### `step.route`

Required:

- step Bead ID
- route target
- routing timestamp
- routing outcome

### `step.claim`

Required:

- step or attempt Bead ID
- claiming agent
- session ID and name
- claim timestamp
- claim outcome

### `agent.session`

Required:

- agent
- session ID and name
- provider and model
- start and terminal timestamps
- terminal status
- error class when present

### `artifact.write`

Required:

- producing step Bead ID
- artifact path
- artifact type
- SHA-256 hash
- Git commit when committed

### `workflow.finalize`

Required:

- workflow root Bead ID
- expected step count
- terminal step count
- final workflow state
- provenance-present flag
- completion-recorded flag

## Data classification

### Allowed by default

- opaque identifiers
- service and component names
- versions
- timestamps and durations
- state transitions
- error classes and codes
- file paths within the Matt City repository or approved artifact directory
- cryptographic hashes

### Prohibited by default

- prompt text
- model response text
- tool arguments containing user or connected-system content
- tool output bodies
- source-document excerpts or bodies
- Asana task descriptions or comments
- email, calendar, contact, Slack, or Drive content
- credentials, tokens, cookies, API keys, or session secrets
- personal data

### Review-required expansion

Any proposal to capture content rather than metadata requires:

1. an explicit Asana decision
2. a documented purpose
3. data minimization review
4. retention and deletion rules
5. access-control review
6. an update to ADR-0001

## Attribute behavior

- Missing optional metadata must remain missing rather than be invented.
- Unknown values should use a documented enum such as `unknown`, not a guessed value.
- Identifiers should preserve the exact canonical form from their owning system.
- Human-readable labels may accompany identifiers but must not replace them.
- Error bodies should be normalized to class and code where possible.
- High-cardinality fields should be limited to identifiers required for correlation.

## Degraded-state behavior

Instrumentation must be fail-open with respect to workflow execution.

- exporter failures do not change workflow state
- trace submission uses bounded timeouts
- local buffering, when enabled, has a bounded size
- dropped spans are counted and reported operationally
- retries are bounded
- Phoenix unavailability does not block artifact creation or workflow finalization

## Initial deterministic evaluations

The first evaluation set is derived from canonical workflow and artifact metadata:

| Evaluation | Pass condition |
|---|---|
| `all_expected_steps_created` | expected step and attempt objects exist |
| `all_steps_have_run_target` | every executable attempt has a concrete run target |
| `all_steps_reached_terminal_state` | every expected executable step is complete, failed, or otherwise terminal |
| `required_provenance_present` | the provenance record includes required Asana, workflow, agent, session, and Git identifiers |
| `artifact_paths_exist` | every declared artifact path exists |
| `no_unauthorized_external_write` | no specialist step records an external write capability or action |
| `workflow_completion_recorded` | the workflow finalization record exists and matches durable state |

## Validation questions

The pilot trace should answer:

1. Where did this workflow stop?
2. Which Bead and attempt represented the stopped step?
3. Was the step routed?
4. Was it claimed?
5. Which concrete agent session performed or attempted it?
6. Which provider, model, and Git revision were active?
7. Which artifacts were written and what are their hashes?
8. Did every expected step reach terminal state?
9. Was provenance complete?
10. Did telemetry fail without affecting execution?

## Example metadata-only trace

```yaml
trace:
  name: matt-city.workflow
  attributes:
    matt_city.request.id: phase-1-smoke-test-003
    matt_city.asana.project_gid: "1216444827581484"
    matt_city.asana.task_gid: "1216641220635093"
    matt_city.formula.name: research-topic
    matt_city.workflow.root_bead_id: "<runtime value>"
    matt_city.city: matt-city-runtime
    matt_city.rig: matt-city
    matt_city.git.commit: "<runtime value>"
    matt_city.approval.state: local-research-analysis-only
```

Placeholders in this example must be replaced with observed runtime values. They are not evidence that the workflow has run.
