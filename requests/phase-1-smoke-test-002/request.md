# Matt City Phase 1 Smoke Test #2

## Request identity

- Request ID: phase-1-smoke-test-002
- Canonical Matt City project GID: 1216444827581484
- Canonical Smoke Test #2 task GID: 1216641220635093
- Originating blog project GID: 1213500168987836
- Originating blog task GID: 1216445335991016
- Google Doc destination ID: 1A10eeY7sQoYazqNxw8SY0mve1hjqQ14UufLORkXrJXM
- Requester: Matthew Romero
- Delegator: Primary assistant
- Local execution provider: Codex/OpenAI through builtin:codex
- Approval state: Local research and analysis only
- External write authorization: Denied

## Research topic

**Building Matt City: Designing a Multi-Agent AI Research Workflow with Gas City**

## Objective

Produce a technically accurate, evidence-based research package describing
the design, implementation, debugging, and validation of Matt City as a
practical identity-aware multi-agent research environment built on Gas City.

This workflow must validate the corrected runtime model, not merely produce
useful prose.

## Required coverage

1. What problem Matt City solves beyond running several AI agents.
2. The division of responsibility among Matthew, the primary assistant,
   Asana, GitHub, Gas City, Beads, Codex, specialist agents, and sessions.
3. Why requester, delegator, task owner, executor, credential holder,
   reviewer, and approver must remain separate.
4. The role of formulas, workflows, Beads, sessions, agents, rigs, orders,
   events, and provenance.
5. How the first smoke test failed and what that failure revealed.
6. The migration from legacy config-token assignees toward concrete
   run-target and session execution.
7. Why the file-backed Beads provider is temporary.
8. Why Dolt remains the intended durable backend.
9. The upstream Beads schema-migration blocker and its operational impact.
10. The failed upstream gascity/roles import and the local run-operator
    replacement.
11. Automatic systemd startup and cold WSL restart recovery.
12. Temporary suppression of backend-inapplicable gc bd and Dolt orders.
13. Current warnings, limitations, and unproven capabilities.
14. Lessons from maintaining Asana as the human-readable project timeline.
15. Claims that would be premature, exaggerated, or misleading.

## Source classification

Every material claim must be labeled as one of:

- Observed runtime behavior
- Versioned implementation
- Documented design
- Upstream documentation or source analysis
- Inference
- Planned capability
- Temporary workaround

## Approved local sources

The agents may read only the request package and these repository paths:

- README.md
- docs/architecture.md
- docs/identity-model.md
- docs/gas-city-alignment.md
- docs/phase-1-scope.md
- docs/runtime-validation.md
- docs/workflow-routing.md
- docs/upstream-alignment-plan.md
- docs/upstream-ecosystem-review.md
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
- requests/phase-1-smoke-test-002/asana-context.md

If an approved path does not exist, record it as unavailable. Do not silently
substitute a similarly named path.

## Supplemental upstream ecosystem

The research must account for the maintained review of:

- gastownhall/gascity-packs
- gastownhall/beads
- gastownhall/gascity
- gastownhall/homebrew-beads
- gastownhall/wasteland
- gastownhall/gascity-project-dashboard
- gastownhall/gascity-dashboard
- gastownhall/homebrew-gascity
- gastownhall/dolt
- gastownhall/gascity-otel

Local specialist agents must use the versioned summaries in:

- docs/upstream-ecosystem-review.md
- docs/upstream-alignment-plan.md

They must not browse or fetch those repositories during this test.

## Required outputs

Write all outputs under:

`requests/phase-1-smoke-test-002/artifacts/`

Required artifacts:

- research-findings.md
- technical-analysis.md
- identity-security-analysis.md
- skeptical-review.md
- artifact-index.md
- provenance.json

## Output requirements

Each Markdown artifact must include:

- contributing agent
- claimed Bead ID
- session identity, when available
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
- workflow root Bead
- step and attempt Beads
- run operator
- specialist agents
- concrete sessions
- provider
- approved inputs
- produced outputs
- retries and failures
- approval state
- external systems accessed
- external systems modified
- final workflow outcome

## Boundaries

- Read only approved local sources.
- Do not browse the web.
- Do not use GitHub credentials.
- Do not use Asana credentials.
- Do not open or modify the Google Doc.
- Do not access email, calendar, contacts, Slack, WordPress, or other
  connected systems.
- Do not commit, push, open pull requests, send messages, update Asana,
  or publish content.
- Do not use credentials belonging to Matthew or the primary assistant.
- Do not continue or repair Smoke Test #1.
- Do not use Beads gc-465 through gc-481 or session Bead gc-686 as the new
  workflow.
- Do not use --force routing.
- Do not manually sling individual downstream steps.
- Distinguish system configuration from actual runtime execution.
- Stop after producing local artifacts and final workflow evidence.

## Acceptance criteria

The test succeeds only if:

1. A fresh workflow root is created.
2. Both canonical Asana GIDs are retained.
3. The originating blog GIDs are retained in the request and provenance.
4. The workflow root routes through matt-city/matt.run-operator.
5. No --force routing is used.
6. Every executable attempt is claimed by a concrete session.
7. Each session corresponds to the intended qualified agent.
8. Dependency order is preserved.
9. Required artifacts are created locally.
10. Sources and evidence classifications are visible.
11. Inferences and planned capabilities are labeled.
12. Security analysis treats every actor as a separate principal.
13. Skeptical review identifies unsupported or premature claims.
14. Provenance reconstructs request, delegation, execution, review, and
    approval.
15. No external system is accessed or modified by local agents.
16. Failures and retries are retained as evidence.
