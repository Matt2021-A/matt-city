# Phase 1 Architecture

```text
Matthew
   |
   v
Asana task
   | objective, sources, questions, decisions, acceptance criteria
   v
Primary ChatGPT assistant
   | retrieves bounded context and creates a structured request
   v
Gas City control plane
   |
   +--> Research Agent
   +--> Technical Analyst
   +--> Identity and Security Analyst
   +--> Skeptic
   |
   v
Local research rig and artifact store
   |
   v
Primary assistant
   | links outputs, provenance, blockers, and decisions
   v
Originating Asana task
   |
   v
Matthew review and approval
```

## System responsibilities

### Asana

Asana is the canonical human work and context plane.

- Every workflow begins with an Asana task.
- The task contains or links the objective, sources, questions, prior work, decisions, constraints, and acceptance criteria.
- Results, blockers, artifacts, approval requests, and final status return to the task.
- The Asana task remains the durable parent work object even when machine sessions terminate.

### Primary assistant

- Operates through its own Asana and GitHub identities.
- Interprets Matthew's intent and retrieves relevant shared context.
- Creates a structured machine request referencing the Asana task.
- Delegates work without transferring its identity or credentials.
- Synthesizes outputs and updates the Asana task.

### Gas City

- Manages formulas, Beads, dependencies, sessions, retries, and events.
- Creates machine execution work beneath the originating Asana task.
- Does not replace Asana as the project and context system of record.

### Specialist agents

- Operate within narrow prompts and local-file capabilities.
- Receive bounded context packages rather than universal project access.
- Do not receive Asana, GitHub, email, calendar, or publishing credentials.

### GitHub

- Stores version-controlled prompts, formulas, schemas, policies, implementation code, and approved artifacts.
- Commits and pull requests should reference the originating Asana task where practical.

## Work-object relationship

```text
Asana project
  └── Asana task: canonical human work object
        └── Gas City workflow: machine execution instance
              ├── Bead: source research
              ├── Bead: technical analysis
              ├── Bead: identity analysis
              └── Bead: skeptical review
                    └── artifacts and provenance
                          └── linked back to Asana task
```

## Initial workflow

1. Validate the originating Asana task and required fields.
2. Build a bounded context package from the task, related work, and approved links.
3. Create a Gas City workflow referencing the Asana task ID and URL.
4. Collect and normalize source findings.
5. Produce technical analysis.
6. Produce identity and security analysis.
7. Challenge claims and assumptions.
8. Package outputs with provenance.
9. Return or link outputs to the Asana task.
10. Stop for Matthew's review.

## Primary implementation references

- Gas City documentation: https://docs.gastownhall.ai/
- Gas City repository: https://github.com/gastownhall/gascity/
- Matt City Asana project: https://app.asana.com/1/1204112251101459/project/1216444827581484
