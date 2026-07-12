# Matt City Operational Dashboard Workstream

The dashboard is a post-validation operational surface for Matt City. It is not a prerequisite for proving the Phase 1 workflow.

## Governing sequence

```text
successful end-to-end Matt City workflow
  → reconstructable provenance
  → confirmed external-write boundaries
  → dashboard evaluation and implementation
```

Requirements and upstream evaluation may begin earlier. Prototype implementation must wait until Smoke Test 2 succeeds.

## Purpose

The dashboard should help a single operator understand abnormal or actionable city state without replacing the underlying systems of record.

It should answer:

- What workflows are active, blocked, failed, or complete?
- Which agent and concrete session owns each executable step?
- Which Beads were routed, claimed, retried, closed, or abandoned?
- What request, Asana task, GitHub artifact, and provenance record does the work belong to?
- What runtime, store, supervisor, configuration, order, or event warning needs attention?
- Who requested, delegated, executed, reviewed, and approved the work?

## Upstream candidates

Evaluate rather than automatically install:

- `gastownhall/gascity-dashboard`
- `gastownhall/gascity-project-dashboard`
- Gas City's built-in `gc dashboard`
- Gas City supervisor API
- `gastownhall/gascity-otel`

## Required work areas

1. Define operator requirements and success criteria.
2. Compare upstream dashboards and built-in surfaces.
3. Define identity, authorization, and audit boundaries.
4. Design workflow, Bead, agent, and session views.
5. Design Asana, GitHub, and provenance linking.
6. Define runtime health and failure timelines.
7. Assess OpenTelemetry privacy and data minimization.
8. Implement a local prototype after workflow validation.
9. Validate the dashboard against a successful Matt City run.
10. Document deployment, recovery, and operator procedures.

## Identity and security model

- Bind locally to loopback by default.
- Do not expose the supervisor or dashboard remotely without an authenticated proxy and an explicit threat-model review.
- Reading an agent's context does not authorize acting as that agent.
- State-changing actions must record the actual operator and principal used.
- Do not provide a general-purpose shell execution endpoint.
- Use explicit command and API allowlists.
- Show degraded or unavailable state rather than a false healthy shell.
- Keep the dashboard non-canonical. Asana remains the human work plane, Gas City the execution plane, and GitHub the versioned implementation and approved-artifact plane.

## Telemetry policy

OpenTelemetry may later provide useful evidence for session lifecycle, sling dispatch, store health, retries, locks, and pool activity. It must not capture prompts, tool output, source documents, secrets, personal data, or connected-system content by default.

Telemetry is supporting operational evidence, not the canonical provenance record.

## Asana work objects

Parent task:

- `Implement Matt City operational dashboard`
- GID: `1216477412200438`

The parent contains ten subtasks corresponding to the required work areas above. Formal Asana dependencies were unavailable on the current plan, so the gating sequence is recorded explicitly in task notes and comments.

## Completion criteria

The dashboard workstream is complete only when:

- it renders a successful real workflow and its dependency graph;
- identity and session attribution are correct;
- Asana, GitHub, and provenance links resolve without granting ambient credentials;
- failure and degraded states are explicit;
- operator actions are audited under the actual principal;
- privacy-sensitive telemetry is disabled or governed;
- deployment and recovery procedures have been tested.
