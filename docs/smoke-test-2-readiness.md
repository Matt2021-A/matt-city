# Smoke Test 2 Readiness and Execution Contract

This document defines the conditions for replacing failed diagnostic workflow `gc-465` with a clean Phase 1 execution attempt.

## Why a second smoke test is required

The first workflow proved that the formula compiled and produced a complete v2 graph, but it also exposed two routing mistakes:

1. configured Gas City agent names were written to `assignee` rather than reserved `gc.run_target` metadata;
2. the generated research Bead was manually forced across a store boundary after cooking.

The forced sling reported success, cleared the original assignee, created session Bead `gc-686`, and still left `gc hook matt-city/matt.researcher` empty. That run must remain preserved as evidence rather than repaired in place.

## Preserved failed-run evidence

- Workflow root: `gc-465`
- Research attempt: `gc-467`
- Session Bead: `gc-686`
- Request ID: `phase-1-smoke-test-001`
- Originating Asana project GID: `1213500168987836`
- Originating Asana task GID: `1216445335991016`

Do not delete, reuse, reassign, or force-route these objects.

## Entry conditions

Smoke Test 2 may begin only when all of the following are true:

- PR #7 is merged and pulled locally.
- `gc reload` completes.
- `gc config show` no longer emits the five configured-agent `assignee` warnings.
- `gc formula show research-topic --json` shows `gc.run_target` on every executable step.
- The exact coordinator or run-operator target available in the resolved local configuration has been verified.
- The new originating work object will be created in the store read by the worker.
- The request package contains the approved source list, boundaries, required outputs, Asana identifiers, and downstream Google Doc reference.
- No specialist agent has Asana, GitHub, Drive, mail, calendar, Slack, WordPress, or other connected-system credentials.

## Launch model

Preferred shape:

```text
originating rig-store Bead
  → verified coordinator / run-operator target
  → research-topic v2 workflow
  → orchestrator evaluates readiness and gc.run_target
  → rig-scoped specialist session claims its own work
```

Do not:

- cook the workflow and manually sling every generated step;
- use `--force` to bypass a cross-store routing guard;
- run `gc hook --claim` from Matthew's ordinary shell;
- manually assign configured agent names through the human `assignee` field;
- reuse workflow `gc-465`.

## Validation sequence

1. Pull merged repository state and reload Gas City.
2. Capture `gc version`, `bd version`, `dolt version`, and resolved package source.
3. Run `gc doctor` and preserve warnings.
4. Confirm the corrected formula metadata.
5. List configured agents and identify the concrete coordinator target.
6. Create a new rig-store originating Bead for request `phase-1-smoke-test-002`.
7. Launch `research-topic` through the verified coordinator target with the approved variables.
8. Confirm only the first ready research step is visible to `matt-city/matt.researcher`.
9. Allow the specialist session to claim its own Bead.
10. Capture workflow, step, control, session, event, provider, input, output, and approval identifiers.
11. Verify dependency-ordered progression through all five executable steps.
12. Verify local artifacts are created under the approved request directory.
13. Verify no external system was modified.
14. Return results to Asana only through the primary assistant's Asana identity after Matthew reviews the local output.

## Success criteria

Smoke Test 2 succeeds only if:

- the workflow starts without manual forced routing;
- each step is dispatched through `gc.run_target`;
- each session claims only eligible work;
- dependency and retry behavior match the formula;
- both Asana GIDs remain present in workflow and artifact provenance;
- outputs distinguish observed behavior, documented design, inference, and planned capability;
- the skeptical review identifies unsupported claims;
- the provenance record identifies requester, delegator, workflow, Beads, agents, sessions, provider, inputs, outputs, capabilities, and approval state;
- no specialist agent performs an external write.

## Failure handling

On failure:

- stop before adding manual routing workarounds;
- preserve all generated objects and relevant events;
- record the exact command, output, identity, store scope, and observed mutation;
- update the Matt City Asana task and repository documentation;
- create a new workflow for the next test rather than mutating the failed run into an apparently successful one.
