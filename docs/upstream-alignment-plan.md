# Supplemental Gas City Ecosystem Alignment Plan

This document translates the supplemental `gastownhall` repository review into concrete Matt City decisions and validation steps. It is intentionally narrower than a general roadmap. Its purpose is to identify which upstream solutions should change Matt City now, which require local validation, and which remain deferred.

## Scope

Repositories reviewed:

- `gastownhall/gascity`
- `gastownhall/gascity-packs`
- `gastownhall/beads`
- `gastownhall/dolt`
- `gastownhall/homebrew-gascity`
- `gastownhall/homebrew-beads`
- `gastownhall/gascity-project-dashboard`
- `gastownhall/gascity-dashboard`
- `gastownhall/gascity-otel`
- `gastownhall/wasteland`

Each repository receives one disposition:

- **Adopt now**
- **Validate next**
- **Monitor upstream**
- **Defer**

## Alignment decisions

| Repository | Disposition | Matt City alignment |
|---|---|---|
| `gascity` | Adopt now | Treat formula v2, `gc.run_target`, store-aware work routing, session claim, and supervisor events as the execution contract. Do not use configured-agent names in the human `assignee` field. |
| `gascity-packs` | Validate next | Compare Matt City against the upstream coordinator/run-operator plus rig-worker pattern. Verify the exact local target before importing or declaring one. Replace manual per-step slinging with orchestrator-driven routing where supported. |
| `beads` | Validate next | Preserve dependency-aware durable work as the machine memory model. Verify `bd setup codex`, `bd ready`, atomic claim behavior, backup/restore, and the installed package source. |
| `dolt` | Validate next | Restore Dolt as the intended durable Beads backend after migration validation. Start with embedded mode unless concurrent writers require server mode. Preserve legacy stores until export and restore are proven. |
| `homebrew-gascity` | Monitor upstream | Continue recording the packaged Gas City version and compare release behavior with the installed binary. Current Homebrew packaging confirms `1.3.4` is the supported packaged release. |
| `homebrew-beads` | Adopt now as packaging guidance | Treat the old tap as deprecated. Verify that StickerBox uses the Homebrew core `beads` formula rather than the migration shim. |
| `gascity-project-dashboard` | Defer | Retain its versioned JSONL snapshot and rendered-report pattern for later operational reporting. It does not change Phase 1 execution. |
| `gascity-dashboard` | Defer | Evaluate only after a successful workflow exists. Preserve its identity pattern that read visibility does not grant send or mutation authority. |
| `gascity-otel` | Defer | Do not enable until a privacy-safe telemetry policy exists. Prompt, tool-output, and Beads-output collection remain disabled by default. |
| `wasteland` | Defer | Do not federate Phase 1. Reuse its claim, evidence, review, acceptance, and branch-history concepts in provenance and approval design. |

## Immediate repository changes

The following changes are justified now:

1. Use `metadata."gc.run_target"` for executable formula-step routing.
2. Keep specialist agents rig-scoped.
3. Separate human ownership, runtime target, concrete session claim, provider execution, and external-action identity.
4. Stop treating manual forced cross-store sling as a supported execution path.
5. Preserve failed workflow objects as evidence rather than rewriting history into apparent success.
6. Record the temporary file backend as a compatibility substitution, not the intended durable design.
7. Track standalone `bd` version, Gas City-linked Beads behavior, Dolt version, and package source separately.

## Required local validation before the next workflow

Before launching a replacement workflow, validate these upstream-derived assumptions locally:

1. Confirm PR #7 is present in `main` and `gc config show` no longer emits configured-agent `assignee` warnings.
2. Confirm every executable formula step contains `gc.run_target`.
3. Inspect available coordinator or run-operator targets in the resolved Gas City configuration.
4. Verify whether the upstream launch pattern is available in Gas City `1.3.4` without inventing a target name.
5. Verify which Bead store the coordinator and specialist agents read.
6. Verify the installed Beads package source and whether `bd setup codex` changes the expected local instructions or hooks.
7. Preserve workflow `gc-465`, Bead `gc-467`, and session Bead `gc-686` as failed-run evidence.
8. Do not use `--force`, manual per-step sling, or a claim from Matthew's ordinary shell as a bridge.

## Dolt recovery path

The file backend remains temporary.

The next durability investigation should:

1. back up both legacy `.beads/dolt` and `.beads/embeddeddolt` stores;
2. export and inspect recoverable Beads data;
3. verify the supported `bd backup` and restore path;
4. initialize a clean embedded-Dolt test store;
5. validate schema compatibility before importing any preserved state;
6. document the exact Gas City, Beads, Dolt, package, and migration versions used.

No legacy store should be deleted merely to make `gc doctor` quieter.

## Explicitly deferred

This alignment plan does not authorize:

- dashboard installation;
- OpenTelemetry deployment;
- Wasteland federation;
- remote dashboard exposure;
- package upgrades;
- active backend migration;
- importing an unverified coordinator role;
- changing identity or credential boundaries.

Those remain separate workstreams with their own approval and validation gates.

## Completion criteria

This alignment work is complete when:

- the repository documents a disposition for all ten supplemental repositories;
- the next execution plan uses verified upstream-supported routing rather than manual repair;
- package and store provenance are captured;
- Dolt restoration has a bounded, non-destructive validation path;
- deferred components remain clearly separated from Phase 1 execution.