# Matt City Phase 1 Smoke Test #3

## Request identity

- Request ID: phase-1-smoke-test-003
- Canonical Matt City project GID: 1216444827581484
- Canonical Smoke Test #3 task GID: 1216740708489953
- Originating blog project GID: 1213500168987836
- Originating blog task GID: 1216445335991016
- Requester: Matthew Romero
- Delegator: Primary assistant
- Local execution provider: Codex/OpenAI through builtin:codex
- Implementation branch: fix/restore-bd-provider
- Approval state: Local research, analysis, packaging, and provenance only
- External write authorization: Denied

## Research topic

**Building Matt City: Designing an Identity-Aware Multi-Agent Research Workflow with Gas City**

## Execution objective

Prove the complete Matt City Formula V2 lifecycle using the managed bd-backed
Dolt store:

`cook -> route -> claim -> execute -> package -> finalize`

The workflow must create a fresh graph, use concrete agent sessions, preserve
dependency and retry behavior, produce the required local artifacts, and leave
reconstructable provenance.

This is an execution-baseline test. It must not add Phoenix, OpenTelemetry
exporters, evaluation hooks, dashboard dependencies, or other new runtime
components.

## Research objective

Produce a technically accurate, evidence-based research package describing the
design, implementation, debugging, recovery, and current validation state of
Matt City as an identity-aware multi-agent work system built on Gas City.

Useful prose is not sufficient by itself. The workflow lifecycle must also be
demonstrated through observed execution evidence.

## Required coverage

1. What Matt City solves beyond running several AI agents.
2. The division of responsibility among Matthew, the primary assistant, Asana,
   GitHub, Gas City, Beads/Dolt, Codex, specialist agents, and sessions.
3. Why requester, delegator, task owner, executor, credential holder, telemetry
   collector, reviewer, and approver remain separate principals.
4. The role of formulas, workflows, Beads, sessions, agents, rigs, orders,
   events, artifacts, and provenance.
5. What Smoke Test #1 and Smoke Test #2 demonstrated and failed to demonstrate.
6. Why the file-backed provider was temporary.
7. How the managed bd/Dolt provider was restored.
8. How Formula V2 run-target metadata, routing, session claim, execution, and
   finalization differ from human assignment.
9. Why generated downstream steps must not be manually routed merely to advance
   the workflow.
10. The Debian WSL, native Docker, systemd, supervisor, Codex, Beads, and Dolt
    runtime model.
11. Current store and session-snapshot latency warnings.
12. Which capabilities are observed, versioned, documented, inferred, planned,
    failed, or still unproven.
13. The role of Phoenix and OpenTelemetry in the Phase 2 roadmap, while clearly
    stating that they are excluded from this baseline run.
14. Claims that would be premature, exaggerated, or misleading.

## Source classification

Every material claim must be labeled as one of:

- Observed runtime behavior
- Versioned implementation
- Documented design
- Upstream documentation or source analysis
- Inference
- Planned capability
- Historical failure
- Temporary workaround

## Approved local sources

The agents may read only this request package and the following repository
paths:

- README.md
- docs/architecture.md
- docs/roadmap.md
- docs/identity-model.md
- docs/gas-city-alignment.md
- docs/phase-1-scope.md
- docs/runtime-validation.md
- docs/workflow-routing.md
- docs/upstream-alignment-plan.md
- docs/upstream-ecosystem-review.md
- docs/decisions/ADR-0001-phoenix-observability.md
- docs/phoenix-trace-schema.md
- city/pack.toml
- city/formulas/research-topic.toml
- city/agents/run-operator/agent.toml
- city/agents/run-operator/prompt.template.md
- city/agents/researcher/agent.toml
- city/agents/researcher/prompt.template.md
- city/agents/technical-analyst/agent.toml
- city/agents/technical-analyst/prompt.template.md
- city/agents/identity-security-analyst/agent.toml
- city/agents/identity-security-analyst/prompt.template.md
- city/agents/skeptic/agent.toml
- city/agents/skeptic/prompt.template.md
- city/doctor/runtime-alignment/doctor.toml
- city/doctor/runtime-alignment/run.sh
- examples/debian-wsl/city.toml
- requests/phase-1-smoke-test-003/asana-context.md

If an approved path does not exist, record it as unavailable. Do not silently
substitute a similarly named path.

## External-source policy

Local specialist agents must not browse, fetch repositories, invoke connected
systems, or retrieve external content during this test.

Any upstream claims must come from the approved, versioned repository summaries.

## Required outputs

Write all outputs under:

`requests/phase-1-smoke-test-003/artifacts/`

Required artifacts:

- research-findings.md
- technical-analysis.md
- identity-security-analysis.md
- skeptical-review.md
- artifact-index.md
- provenance.json

## Artifact requirements

Each Markdown artifact must include:

- contributing agent
- claimed Bead ID
- concrete session identity
- provider
- inputs used
- source classifications
- observed facts
- inferences
- limitations
- unresolved questions

`provenance.json` must include:

- request ID
- Asana project and task GIDs
- originating blog project and task GIDs
- formula name and version
- originating request Bead
- workflow root Bead
- step, spec, retry-controller, attempt, and finalization Beads
- run operator
- specialist agents
- concrete sessions
- provider and model when available
- approved inputs
- produced outputs
- artifact paths and hashes
- retries and failures
- Git branch and commit
- approval state
- external systems accessed
- external systems modified
- final workflow outcome
- telemetry enabled state

## Execution boundaries

- Read only approved local sources.
- Do not browse the web.
- Do not use GitHub credentials.
- Do not use Asana credentials.
- Do not access Google Drive, email, calendar, contacts, Slack, WordPress, or
  other connected systems.
- Do not commit, push, open pull requests, send messages, update Asana, or
  publish content.
- Do not use credentials belonging to Matthew or the primary assistant.
- Do not reuse, continue, repair, close, or delete Smoke Test #1 or Smoke Test
  #2 workflow objects.
- Do not use `--force`.
- Do not manually route generated downstream workflow steps.
- Do not manually claim routed work from Matthew's ordinary shell.
- Do not create specialist sessions before work is routed to their targets.
- Do not treat a successful sling response as proof that a session claimed or
  executed work.
- Do not add Phoenix or other telemetry instrumentation to this baseline.
- Stop after local artifacts, provenance, and terminal workflow evidence exist.

## Acceptance criteria

The test succeeds only if:

1. A fresh originating request Bead is created.
2. A fresh Formula V2 workflow graph is created.
3. No prior root, step, attempt, or session ID is reused.
4. The workflow is launched through `matt-city/matt.run-operator`.
5. No `--force` routing is used.
6. Every executable attempt is claimed by a concrete session.
7. Each concrete session corresponds to the intended qualified agent.
8. Dependency order and retry behavior are preserved.
9. Required artifacts are created locally.
10. Artifact hashes are recorded.
11. Sources and evidence classifications are visible.
12. Inferences and planned capabilities are labeled.
13. Security analysis treats every actor as a separate principal.
14. Skeptical review identifies unsupported or premature claims.
15. Provenance reconstructs request, delegation, routing, claim, execution,
    review, packaging, finalization, and approval.
16. No external system is accessed or modified by local agents.
17. Failures and retries remain visible as evidence.
18. The workflow reaches successful terminal state or a stable, fully evidenced
    failure.
19. Telemetry remains disabled for the entire baseline run.

## Return boundary

Local agents stop after completing the local workflow.

The primary assistant may later return the evidence and result to the canonical
Asana task through its own Asana identity. That external update is not delegated
to the local agents.
