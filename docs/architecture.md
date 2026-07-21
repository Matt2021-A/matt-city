# Matt City Architecture

Matt City separates human work, machine execution, versioned implementation, operational telemetry, and AI-specific observability into distinct planes.

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
   +----------------> OpenTelemetry + Grafana
   |                  operational metrics, logs, and health
   |
   +----------------> Phoenix
   |                  optional AI traces, evaluations, datasets,
   |                  experiments, and annotations
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

### Primary assistant

- Operates through its own Asana and GitHub identities.
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

### Specialist agents

- Operate within narrow prompts and local-file capabilities.
- Receive bounded context packages rather than universal project access.
- Do not receive Asana, GitHub, email, calendar, publishing, or telemetry-administration credentials.
- Record their actual agent, session, provider, and contribution identities.

### GitHub

- Stores version-controlled prompts, formulas, schemas, policies, implementation code, documentation, and approved artifacts.
- Commits and pull requests should reference the originating Asana task where practical.
- Runtime-generated state is not committed as a substitute for Beads/Dolt or Asana history.

### OpenTelemetry and Grafana

- Own operational metrics, logs, infrastructure health, and service-level reporting.
- Remain separate from AI-specific trace and evaluation concerns.
- Must not become a workflow routing or approval dependency.

### Phoenix

Phoenix is the committed AI-specific observability and evaluation plane.

- Stores AI traces, annotations, datasets, experiments, and evaluations.
- Correlates workflow, Bead, session, agent, Asana, Git, provider, model, and artifact identifiers.
- Remains observational and outside the execution dependency chain.
- Does not own workflow routing, authorization, approval, or canonical provenance.
- Starts with metadata-only spans and excludes sensitive content by default.
- Uses distinct collector, viewer, and future MCP identities.

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
              └── optional Phoenix trace correlation
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
- telemetry collector
- telemetry viewer
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
- timestamps, status transitions, and error classes

Excluded by default:

- prompt bodies
- tool input or output bodies
- source-document bodies
- connected-system content
- credentials or secrets
- personal data

Telemetry failure must not stop, roll back, or invalidate workflow execution.

## Primary implementation references

- Matt City Asana project: https://app.asana.com/1/1204112251101459/project/1216444827581484
- Phoenix implementation task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216732585597325
- Gas City documentation: https://docs.gascity.com/
- Gas City repository: https://github.com/gastownhall/gascity/
- Phoenix repository: https://github.com/Arize-ai/phoenix
- Phoenix documentation: https://arize.com/docs/phoenix
