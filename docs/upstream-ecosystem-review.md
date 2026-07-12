# Upstream Ecosystem Review

This review records the Phase 1 design implications of the wider `gastownhall` ecosystem. It is not a blanket endorsement or an instruction to import every component. Each repository is evaluated for what it contributes to Matt City and what remains outside scope.

## Repositories reviewed

- `gastownhall/gascity`
- `gastownhall/gascity-packs`
- `gastownhall/beads`
- `gastownhall/homebrew-beads`
- `gastownhall/homebrew-gascity`
- `gastownhall/wasteland`
- `gastownhall/gascity-project-dashboard`
- `gastownhall/gascity-dashboard`
- `gastownhall/dolt`
- `gastownhall/gascity-otel`

## Gas City core

Gas City establishes the authoritative formula v2 model:

- formulas are reusable methods;
- cooking materializes workflows into a Bead store;
- agents execute plain work Beads;
- the orchestrator executes control Beads;
- ready steps route independently;
- `gc.run_target` is the per-step configured execution target;
- work must be instantiated in the store read by its worker.

Matt City implication:

- retain the v2 formula;
- use `metadata."gc.run_target"` for specialist routing;
- stop using configured-agent names in `assignee`;
- stop treating manual cross-store sling as the normal execution model.

## Gas City packs

The packs repository provides the strongest operational precedent for Matt City. Its starter pattern separates:

- city-level workflow formulas and coordinator behavior;
- rig-level worker roles;
- one launch action against an originating Bead;
- orchestrator-driven routing of ready steps;
- artifact roots and continuation workflows.

Matt City implication:

- specialist agents remain rig-scoped;
- the research formula remains a reusable v2 graph;
- Phase 1 should use a verified coordinator or run-operator target;
- generated step Beads should not be manually slung one by one;
- a later content pack can add continuation entry points for research, outline, draft, review, and publication preparation.

Open gate:

- identify the exact coordinator target available in the installed Gas City 1.3.4 configuration before importing or declaring one for Matt City.

## Beads

Beads is the durable, dependency-aware work and memory layer. Current guidance describes embedded Dolt as the default and recommended storage mode for most users, while Dolt server mode supports concurrent writers.

Matt City implication:

- the file backend remains a temporary compatibility substitution;
- embedded Dolt is the likely next durable Phase 1 target;
- server mode should be considered later for multiple concurrent writers or multi-machine operation;
- migration should use supported backup and restore paths rather than deleting legacy stores;
- `.beads/issues.jsonl` is interchange data, not a complete restorable database backup.

The first migration attempt must preserve both legacy `.beads/dolt` and `.beads/embeddeddolt` directories until exports are reviewed and a target store is validated.

## Homebrew packaging

The Homebrew Gas City formula currently packages Gas City 1.3.4, matching the StickerBox installation.

The former `homebrew-beads` tap formula is now a deprecated migration shim that points users to the Homebrew core `beads` formula.

Matt City implication:

- the Gas City routing warning is not explained by being behind the supported Homebrew Gas City release;
- verify that the installed `bd` binary comes from Homebrew core `beads`, not an obsolete tap path;
- continue recording both the standalone Beads version and the Beads library version linked into `gc` because the runtime has already reported drift.

## Wasteland

Wasteland provides a federated work lifecycle over Dolt:

```text
open → claimed → in_review → completed
```

It also preserves completion evidence and supports a PR-mode history where claim and completion changes remain connected on one branch.

Matt City implication:

- do not import Wasteland into Phase 1;
- borrow its evidence-oriented lifecycle vocabulary;
- keep request, claim, execution evidence, review, and approval connected in provenance;
- distinguish work completion from human acceptance.

## Gas City dashboard

The standalone dashboard exposes agents, Beads, formula runs, node session transcripts, activity, health, and audit facts. Its identity design is especially relevant: an operator can read an agent's mail context, but sends remain attributed to the operator rather than impersonating that agent.

Matt City implication:

- evaluate the dashboard as a local inspection surface after the first successful workflow;
- do not make it a Phase 1 execution dependency;
- preserve loopback-only deployment unless an authenticated proxy is deliberately configured;
- maintain the same rule for connected systems: visibility into another principal's context does not grant authority to act as that principal.

## Gas City project dashboard

The project dashboard repository records versioned weekly JSONL snapshots and renders a human-readable report.

Matt City implication:

- this is a useful pattern for later operational reporting;
- raw snapshots and rendered summaries should remain separate;
- automated status collection must use a dedicated credential and identify which principal performed collection and publication;
- it does not solve live workflow routing.

## Gas City OpenTelemetry

The observability stack captures agent lifecycle, session activity, sling dispatches, storage health, retry behavior, lock waits, pool activity, and logs.

It also supports privacy-sensitive collection of prompts, tool output, and Beads command output.

Matt City implication:

- OpenTelemetry is valuable for proving workflow behavior after the execution path works;
- it must not be enabled with prompt or tool-content capture by default;
- source documents, personal data, secrets, and connected-system content must be excluded unless explicitly approved;
- telemetry is an observation layer, not the canonical provenance record.

## Dolt

Dolt supplies SQL storage with branch, merge, history, push, pull, and row-level attribution capabilities.

Matt City implication:

- Dolt remains the intended durable Beads foundation;
- its history can strengthen auditability and recovery;
- database identity and commit attribution must be configured separately from Git identity and Gas City agent identity;
- restoring Dolt does not replace Asana as the human work plane or GitHub as the versioned implementation plane.

## Revised Phase 1 architecture

```text
Matthew
  → creates and approves human work in Asana

Primary assistant
  → packages approved context and performs connected-system actions
     through its own authenticated principals

Verified Gas City coordinator / run operator
  → launches the v2 workflow from a rig-store work object

Gas City orchestrator
  → evaluates dependencies, retries, control Beads, and gc.run_target

Rig-scoped specialist sessions
  → claim and execute only their routed, ready work

Beads on temporary file backend
  → current machine work state

Embedded Dolt
  → intended next durable Beads backend after migration validation

GitHub
  → versioned formulas, prompts, policy, documentation, and approved artifacts
```

## Decisions for PR #7

Included now:

- replace configured-agent `assignee` values with `gc.run_target`;
- document the correct store-scope and launch model;
- preserve the failed workflow as evidence;
- prohibit manual forced cross-store routing for the replacement smoke test;
- record the wider upstream findings and open gates.

Deferred until validated locally:

- importing a specific upstream coordinator role;
- changing the active Beads backend;
- installing either dashboard;
- enabling OpenTelemetry;
- adding Wasteland federation;
- changing installed Gas City or Beads versions.