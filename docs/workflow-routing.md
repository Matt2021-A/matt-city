# Workflow Routing and Launch Contract

This document records the Phase 1 routing model validated against Gas City 1.3.4 and the current Gas City v2 formula guidance.

## Status

The first live workflow, `gc-465`, is a failed diagnostic run. It must remain available as evidence and must not be repaired or reused as the production smoke test.

The failure established that Matt City had two separate problems:

1. Configured Gas City agents were placed in the formula `assignee` field instead of reserved runtime routing metadata.
2. The workflow was cooked and then manually routed one generated Bead at a time, rather than launched through the orchestrator pattern used by current Gas City packs.

## Ownership is not execution routing

Matt City keeps these concepts separate:

| Concept | Meaning |
|---|---|
| Human ownership | Who is accountable for the work in the human work system |
| Formula routing intent | Which configured Gas City target should execute a ready step |
| Session claim | Which concrete runtime session atomically accepts the routed work |
| Provider execution | Which model runtime performs the work inside that session |
| External action | Which separately authenticated principal modifies Asana, GitHub, Drive, or another connected system |

For formula v2 work steps, configured-agent routing uses reserved metadata:

```toml
metadata = {
  "gc.run_target" = "matt-city/matt.researcher"
}
```

The `assignee` field must not be used as a substitute for configured-agent dispatch. It may represent ownership where appropriate, but it is not the runtime target.

## Store-scope rule

Cook or launch work in the store read by the worker.

Matt City has both a city scope and a rig scope. A workflow intended for rig-scoped agents must be instantiated from the rig context or with an explicitly verified rig-scoped launch path.

Cross-store `--force` is not an acceptable normal routing mechanism. In the first smoke test it:

- reported `routed=true`;
- cleared the formula-generated assignee on `gc-467`;
- created session Bead `gc-686`;
- did not make the work visible to `gc hook matt-city/matt.researcher`.

This behavior is retained as evidence that suppressing a namespace guard does not bridge store visibility or create a valid execution chain.

## Production launch pattern

`gc formula cook` is an inspection and graph-construction tool. It creates Beads but does not route work.

The preferred Phase 1 launch pattern is:

1. Create or identify one originating work Bead in the rig store.
2. Launch the v2 formula through a verified coordinator or run-operator target.
3. Let the orchestrator dispatch each ready work step using `gc.run_target`.
4. Let the target session claim work through the standard hook protocol.
5. Preserve dependency order and retry behavior in the workflow graph.
6. Do not manually sling generated step Beads under normal operation.

The exact Matt City coordinator target is not yet declared. It must be selected only after validating the current Gas City pack role definitions and imported target names in the installed configuration.

A representative launch shape is:

```bash
gc sling <verified-run-operator-target> <originating-bead-id> \
  --on research-topic \
  --var request_id=<request-id> \
  --var asana_project_gid=<project-gid> \
  --var asana_task_gid=<task-gid> \
  --var request_path=<approved-request-path>
```

Do not copy a coordinator target name from upstream documentation without confirming it exists in the resolved Matt City configuration.

## Prohibited shortcuts

The following are prohibited for the next smoke test:

- reusing workflow `gc-465`;
- manually restoring the cleared assignee on `gc-467`;
- using `--force` to cross the city/rig store boundary;
- manually running `gc hook --claim` from Matthew's ordinary shell;
- creating specialist sessions before routed work is visible to their hooks;
- treating a successful sling response as proof that a worker can see or claim the Bead.

## Post-merge validation

After the routing formula change is merged:

1. Pull and reload the runtime.
2. Run `gc config show` and confirm the five configured-agent `assignee` warnings are gone.
3. Inspect `gc formula show research-topic --json` and verify `gc.run_target` on every executable attempt.
4. Confirm the coordinator or run-operator target exists in `gc agent list` or the resolved configuration.
5. Create a new originating Bead in the rig store.
6. Launch a new workflow through the verified operator target.
7. Confirm the research step is Ready-visible and routed without manual sling.
8. Confirm `gc hook matt-city/matt.researcher` sees the work before any session is created.
9. Start or allow the target session to start and claim the work itself.
10. Record workflow, Bead, event, target, session, provider, input, output, and approval identifiers in provenance.

## Evidence from the first diagnostic run

- Formula: `research-topic`
- Workflow root: `gc-465`
- Research attempt: `gc-467`
- Forced-route session Bead: `gc-686`
- Runtime result: no claimable work for `matt-city/matt.researcher`
- Configuration warning: configured agent names in `assignee` require a concrete session target through `metadata.gc.run_target`

The failed run is not discarded. It is part of the implementation history and supports the public explanation of why assignment, routing, claim, execution, and approval must remain distinct.