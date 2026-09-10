# Workflow Routing and Launch Contract

This document records the routing model used by Matt City and the evidence boundary between historical diagnostic failures, the completed Smoke Test #3 baseline, and the still-incomplete production editorial workflow.

## Current status

The first live workflow, `gc-465`, remains failed diagnostic evidence and must not be repaired or reused as proof of current behavior.

Later work corrected the two original design errors it exposed:

1. Configured Gas City agents were moved out of the formula `assignee` field and into reserved runtime routing metadata.
2. Workflow execution moved away from manually routing generated Beads and toward orchestrator/run-operator-driven dispatch.

Smoke Test #3 subsequently demonstrated the tested local bd-backed lifecycle through route, concrete claim, specialist execution, artifact packaging, provenance, and finalization.

The current gate is not the original routing defect. It is recovery of production request `building-matt-city-blog-001` after read-only post-reboot runtime reconciliation. The last durable workflow pointer is `mc-069`; the last recorded outline attempt is `mc-417`.

The Debian WSL runtime has not been directly revalidated since the unapproved August 23, 2026 Windows Update reboot. Therefore current routing/session/claim behavior is unknown until fresh local observation.

## Ownership is not execution routing

Matt City keeps these concepts separate:

| Concept | Meaning |
|---|---|
| Human ownership | Who is accountable for the work in the human work system |
| Formula routing intent | Which configured Gas City target should execute a ready step |
| Session claim | Which concrete runtime session atomically accepts the routed work |
| Provider execution | Which model runtime performs the work inside that session |
| External action | Which separately authenticated principal modifies Asana, GitHub, Drive, or another connected system |

For formula v2 work steps, configured-agent routing uses reserved metadata such as:

```toml
metadata = {
  "gc.run_target" = "matt-city/matt.researcher"
}
```

The `assignee` field must not be used as a substitute for configured-agent dispatch. Human ownership, configured run target, concrete session, and external authenticated principal remain separate objects.

## Store-scope rule

Cook or launch work in the store read by the worker.

Matt City historically exposed both city and rig scope behavior. Cross-store `--force` is not an acceptable normal routing mechanism. In the first diagnostic run it reported a routing action without producing a valid worker-visible claim chain.

That history remains evidence that suppressing a namespace guard is not proof of a valid execution path.

Smoke Test #3 later demonstrated a working bd-backed path for the tested research workflow. Do not use the first-run failure to describe the validated research baseline as still broken.

## Production launch pattern

`gc formula cook` constructs or inspects workflow structure. It is not, by itself, proof that work was routed, claimed, or executed.

The Matt City production pattern is:

1. Start from one authorized request tied to a canonical Asana task.
2. Materialize the Formula V2 workflow in the intended durable store.
3. Route ready work through the configured run-operator/orchestration path using `gc.run_target` metadata.
4. Let the target session claim work through the supported hook protocol.
5. Preserve dependency order and retry behavior in the workflow graph.
6. Record concrete session, Bead, workflow, provider, artifact, and approval identities.
7. Do not manually sling generated downstream Beads merely to make the graph advance.

A representative launch shape remains:

```bash
gc sling <verified-run-operator-target> <originating-bead-id> \
  --on <formula-name> \
  --var request_id=<request-id> \
  --var asana_project_gid=<project-gid> \
  --var asana_task_gid=<task-gid> \
  --var request_path=<approved-request-path>
```

Use the resolved current Matt City configuration rather than copying a target name from old documentation.

## Claim contract

Inside a routed target session, the worker claims its own work through the standard hook path.

An active session does not prove assignment. A routed Bead does not prove a claim. A workflow root does not prove execution.

For the production editorial workflow, preserved August evidence established an important split:

- `mc-417` materialized and carried expected `matt-city/matt.editorial-strategist` target metadata
- targetless hook discovery could see `mc-417` under captured strategist variables
- `hook --claim` still returned `drain/no_work`
- disposable Beads claim tests succeeded locally and against the same Dolt server
- a fresh strategist session reproduced `drain/no_work`
- wait-idle, immediate, and queue nudge attempts stalled before delivery or queue persistence

The best preserved isolation was therefore the local strategist/session nudge submission/input path before mode-specific delivery or queue persistence, not a generic claim that Gas City routing was globally defective.

## PATH/session startup boundary

Repository review later found that the editorial-strategist startup prompt invoked a bare `gc` command while the environment contained both a compatibility path and the Homebrew toolchain.

PR #13 changed the strategist startup claim command to use the known compatibility path with Homebrew available on `PATH`.

Prompt-template changes apply reliably to newly created sessions. A running session keeps the startup context with which it was created, and `gc reload` does not retrofit an old conversation with a new startup prompt.

PR #13 is therefore a versioned remediation. It is not proof that the production claim path is fixed until a fresh post-reboot strategist session is observed.

## Prohibited shortcuts

Do not:

- reuse historical workflow IDs as proof of a fresh run
- use `--force` as normal cross-store routing
- manually claim a Bead from Matthew's ordinary shell merely to advance the workflow
- manually route downstream generated work to make the graph progress
- repeatedly nudge a session that returned `no_work`
- treat a successful sling/cook/route response as proof that a concrete worker claimed or completed work
- delete failed-run evidence to make status appear cleaner
- launch a duplicate production workflow before current durable state is inspected

## Current recovery sequence

Before any new production routing action:

1. Capture local Git branch, worktree, HEAD, and remote state without cleanup.
2. Verify the current `gc` resolution, both known paths, and versions.
3. Verify `gascity-supervisor.service` and `matt-city.service`.
4. Run bounded `gc doctor` inspection.
5. Inspect `mc-069` and `mc-417` directly.
6. Inspect current editorial-strategist and control/dispatcher sessions.
7. Verify whether `outline.md` exists.
8. Verify current claimability through the supported path.
9. Preserve the evidence before changing or replacing anything.
10. Resume the existing durable workflow only if safe and reconstructable; otherwise record why a replacement execution attempt is required.

## Evidence from the first diagnostic run

- Formula: `research-topic`
- Workflow root: `gc-465`
- Research attempt: `gc-467`
- Forced-route session Bead: `gc-686`
- Runtime result: no claimable work for `matt-city/matt.researcher`

The failed run remains part of the implementation history and supports the public explanation of why assignment, routing, claim, execution, and approval must remain distinct.

## Evidence from the completed baseline

Smoke Test #3 is the completed research-path baseline. It proved that the local bd-backed orchestration lifecycle could route, claim, execute, package, record provenance, and finalize for the tested workflow.

The production `draft-technical-blog` workflow remains a separate acceptance case and must not inherit that success by assertion.
