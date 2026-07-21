# Artifact Index: Phase 1 Smoke Test #3

## Package Metadata

| Field | Value |
|---|---|
| Artifact | `artifact-index.md` |
| Request ID | `phase-1-smoke-test-003` |
| Canonical Asana project GID | `1216444827581484` |
| Canonical Asana task GID | `1216740708489953` |
| Originating blog project GID | `1213500168987836` |
| Originating blog task GID | `1216445335991016` |
| Originating local request Bead | `mc-90t` |
| Workflow input convoy | `mc-aba` |
| Workflow root Bead | `mc-5n9` |
| Logical package Bead | `mc-2yp` |
| Claimed package attempt Bead | `mc-hmp` |
| Workflow finalization Bead | `mc-5wu` |
| Formula | `research-topic` |
| Formula version | `1` |
| Step | `package-artifacts` |
| Attempt | `1` |
| Run target | `matt-city/matt.technical-analyst` |
| Contributing agent | `matt-city/matt.technical-analyst-1` |
| Concrete session ID | `mcr-wisp-02ufc2` |
| Concrete session name | `matt__technical-analyst-mcr-wisp-02ufc2` |
| Provider | `codex` |
| Runtime template | `matt-city/matt.technical-analyst` |
| Runtime city | `/home/matt/matt-city-runtime` |
| Rig root | `/home/matt/src/matt-city` |
| Git branch observed | `fix/restore-bd-provider` |
| Git commit observed | `8c0da8d3903bcc91b2f7f056a10ebb44579dd69a` |
| Gas City version observed through `GC_BIN` | `1.3.5` |
| PATH-local Gas City version used for recovered shell commands | `1.3.4` |
| Beads version observed | `1.1.0 (8e4e59d39: HEAD@8e4e59d39f34)` |
| Dolt version observed | `2.2.1` |
| Approval state | Local research, analysis, packaging, and provenance only |
| External systems accessed by this agent | None |
| External systems modified by this agent | None |
| Telemetry enabled state | Disabled; no Phoenix, OpenTelemetry exporter, evaluation hook, or dashboard dependency was added or used |

## Required Artifacts

Non-package artifact hashes are SHA-256 values observed before writing this index. Package artifact hashes are post-write values where they can be embedded truthfully. This file cannot embed its own final hash without changing that hash, and `provenance.json` cannot embed its own final hash for the same reason.

| Required artifact | Status | SHA-256 | Producer / Bead evidence |
|---|---|---|---|
| `requests/phase-1-smoke-test-003/artifacts/research-findings.md` | Present | `4e0a55b77a4221e6537cccaa3c63c100920493376365c94072b6888ac5c7b8cb` | `matt-city/matt.researcher-1`; session `mcr-wisp-xamxea`; logical Bead `mc-u4d`; attempt Bead `mc-3i8`; `gc.outcome=pass` |
| `requests/phase-1-smoke-test-003/artifacts/technical-analysis.md` | Present | `0b06cb3787f95dcd6153123460e7348644ed9f1da65ef3c9a820ea026ca7855d` | `matt-city/matt.technical-analyst-1`; session `mcr-wisp-pzsryk`; logical Bead `mc-7bt`; attempt Bead `mc-exr`; `gc.outcome=pass` |
| `requests/phase-1-smoke-test-003/artifacts/identity-security-analysis.md` | Present | `3a5e4cc5eb00ea0826d8aa10429fc11b429bea458473e97fc571536dbbd9c869` | `matt-city/matt.identity-security-analyst-1`; session `mcr-wisp-vqufrx`; logical Bead `mc-i3f`; attempt Bead `mc-g0a`; `gc.outcome=pass` |
| `requests/phase-1-smoke-test-003/artifacts/skeptical-review.md` | Present | `3dfdd0e2e10849cad86f7dc56bc7e2b99827f644d45893a12b08b7934a95cf7b` | `matt-city/matt.skeptic-1`; session `mcr-wisp-dbouve`; logical Bead `mc-xxq`; attempt Bead `mc-3b9`; `gc.outcome=pass` |
| `requests/phase-1-smoke-test-003/artifacts/artifact-index.md` | Present | Final hash is recorded in `provenance.json` after this file write | `matt-city/matt.technical-analyst-1`; session `mcr-wisp-02ufc2`; logical Bead `mc-2yp`; attempt Bead `mc-hmp` |
| `requests/phase-1-smoke-test-003/artifacts/provenance.json` | Present | Self-hash is not embedded; final hash must be computed after the file is written | `matt-city/matt.technical-analyst-1`; session `mcr-wisp-02ufc2`; logical Bead `mc-2yp`; attempt Bead `mc-hmp` |

## Inputs Used

| Input | SHA-256 or identifier | Use |
|---|---|---|
| `requests/phase-1-smoke-test-003/request.md` | `fa24ad02163d29fba148f3656956ad39aefc1600b96fd36027409add6c4221a8` | Request identity, output requirements, approved sources, boundaries, acceptance criteria |
| `requests/phase-1-smoke-test-003/asana-context.md` | `7f3a219b29651e4d954790df61d9516795a4ab7751908bd584e4d92b623fcd77` | Asana-linked context snapshot, historical failures, runtime baseline, approval boundary |
| `requests/phase-1-smoke-test-003/launch-attempted.txt` | `request_id=phase-1-smoke-test-003`; `originating_bead=mc-90t`; `attempted_at=2026-07-20T21:00:01-07:00` | Launch attempt provenance |
| `requests/phase-1-smoke-test-003/launch-result.jsonl` | `workflow_id=mc-5n9`; `target=matt-city/matt.run-operator`; `success=true` | Formula launch result |
| `requests/phase-1-smoke-test-003/source-bead-after-launch.json` | `d8e15802a05123ca1c4d401f5640d09519e7dd1076ee51b01060505229291903` | Originating local request Bead snapshot |
| `requests/phase-1-smoke-test-003/workflow-root-after-launch.json` | `d75cf0c9398cd6afd2129ad355efb88d77af16cfbc6c3c4cdd422d09a9a2faf7` | Workflow root and finalization snapshot after launch |
| `requests/phase-1-smoke-test-003/workflow-root-current.json` | `494eb9fc6579146c993f789dc6b61347ac774d7fef246945ec9d319c4e1c2130` | Later workflow root snapshot retained in request package |
| `requests/phase-1-smoke-test-003/workflow-nodes-current.json` | `101337aed355c1516dae1ab057ec9beac80b0e3e6d3636126dd94aa6238cb252` | Local graph-node inventory snapshot; may lag current Bead state |
| `requests/phase-1-smoke-test-003/sessions-after-launch.json` | local request-package snapshot | Control-dispatcher and technical-analysis session evidence after launch |
| `requests/phase-1-smoke-test-003/sessions-next.json` | local request-package snapshot | Skeptic and control-dispatcher session evidence after downstream routing |
| `requests/phase-1-smoke-test-003/sessions-current.json` | `fca6d85d9cb5f636cf6cf8f30f13bb537adc68b9cac09d6a664f4662e7eb939e` | Identity-security, technical-analysis, and control-dispatcher session snapshot |
| `bd show "mc-hmp" --json` | current local Bead read | Claimed package-attempt metadata and current upstream logical dependency outcomes |
| `git branch --show-current` and `git rev-parse HEAD` | `fix/restore-bd-provider`; `8c0da8d3903bcc91b2f7f056a10ebb44579dd69a` | Versioned implementation provenance |
| Local version commands | Gas City `1.3.5` via `GC_BIN`; PATH-local Gas City `1.3.4`; Beads `1.1.0`; Dolt `2.2.1` | Runtime dependency provenance |

No browsing, Asana connector, GitHub credential, Google Drive, email, calendar, contacts, Slack, WordPress, publishing, commit, push, or external write was used.

## Workflow And Bead Inventory

| Role | Bead or session | Status at package creation | Notes |
|---|---|---|---|
| Originating local request | `mc-90t` | Open in launch snapshot | External reference `asana-task:1216740708489953`; `external_write_authorized=false`; `telemetry_enabled=false` |
| Workflow input convoy | `mc-aba` | Referenced by root metadata | `gc.input_convoy_id=mc-aba` |
| Workflow root | `mc-5n9` | Closed with `gc.outcome=pass` in post-close verification | Formula V2 root for `research-topic`; routed to `matt-city/matt.run-operator` |
| Research spec | `mc-d1q` | Open in local graph snapshot | Spec Bead for `research` |
| Technical-analysis spec | `mc-a63` | Open in local graph snapshot | Spec Bead for `technical-analysis` |
| Identity-security spec | `mc-qnt` | Open in local graph snapshot | Spec Bead for `identity-security-analysis` |
| Skeptical-review spec | `mc-l6n` | Open in local graph snapshot | Spec Bead for `skeptical-review` |
| Package-artifacts spec | `mc-yoi` | Open in local graph snapshot | Spec Bead for `package-artifacts` |
| Research retry-controller | `mc-u4d` | Closed; `gc.outcome=pass` | Attempt log records attempt `1` pass |
| Research attempt | `mc-3i8` | Closed; `gc.outcome=pass` | Claimed by `matt__researcher-mcr-wisp-xamxea` |
| Technical-analysis retry-controller | `mc-7bt` | Closed; `gc.outcome=pass` | Attempt log records attempt `1` pass |
| Technical-analysis attempt | `mc-exr` | Closed; `gc.outcome=pass` | Claimed by `matt__technical-analyst-mcr-wisp-pzsryk` |
| Identity-security retry-controller | `mc-i3f` | Closed; `gc.outcome=pass` | Current dependency of `mc-hmp`; attempt log records attempt `1` pass |
| Identity-security attempt | `mc-g0a` | Closed by upstream session per artifact metadata and current logical outcome | Claimed by `matt__identity-security-analyst-mcr-wisp-vqufrx` |
| Skeptical-review retry-controller | `mc-xxq` | Closed; `gc.outcome=pass` | Current dependency of `mc-hmp`; attempt log records attempt `1` pass |
| Skeptical-review attempt | `mc-3b9` | Closed by upstream session per artifact metadata and current logical outcome | Claimed by `matt__skeptic-mcr-wisp-dbouve` |
| Package-artifacts retry-controller | `mc-2yp` | Open before package attempt close; not directly re-read after close | Blocks workflow finalization until package attempt passes |
| Package-artifacts attempt | `mc-hmp` | Closed with `gc.outcome=pass` | Claimed by `matt__technical-analyst-mcr-wisp-02ufc2` |
| Workflow finalization | `mc-5wu` | Pending/open at package creation; not directly re-read after package close | Root `mc-5n9` was observed closed with `gc.outcome=pass` after package close |
| Control dispatcher session | `mcr-wisp-fstd3k` | Active in request-package session snapshots | Session name `core__control-dispatcher-mcr-wisp-fstd3k`; command follows `matt-city/core.control-dispatcher` |

## Agent And Session Inventory

| Agent or target | Concrete session | Provider / model evidence | Contribution |
|---|---|---|---|
| `matt-city/matt.run-operator` | Concrete run-operator session not captured in approved local snapshots | Target recorded in `launch-result.jsonl` and root metadata | Workflow launch/routing target for root `mc-5n9`; finalization target for `mc-5wu` |
| `matt-city/core.control-dispatcher` | `mcr-wisp-fstd3k` / `core__control-dispatcher-mcr-wisp-fstd3k` | Local session snapshot; provider not listed | Followed control-dispatcher target and routed ready work through Gas City control path |
| `matt-city/matt.researcher-1` | `mcr-wisp-xamxea` / `matt__researcher-mcr-wisp-xamxea` | `codex`; exact model not exposed in the research artifact metadata | Produced `research-findings.md` for attempt `mc-3i8` |
| `matt-city/matt.technical-analyst-1` | `mcr-wisp-pzsryk` / `matt__technical-analyst-mcr-wisp-pzsryk` | `codex`; session snapshots for comparable specialists show command `codex --model gpt-5.5`, but the artifact records model as not exposed in permitted metadata | Produced `technical-analysis.md` for attempt `mc-exr` |
| `matt-city/matt.identity-security-analyst-1` | `mcr-wisp-vqufrx` / `matt__identity-security-analyst-mcr-wisp-vqufrx` | `codex`; session snapshot command includes `--model gpt-5.5`; artifact records exact model as not exposed in permitted metadata | Produced `identity-security-analysis.md` for attempt `mc-g0a` |
| `matt-city/matt.skeptic-1` | `mcr-wisp-dbouve` / `matt__skeptic-mcr-wisp-dbouve` | `codex`; session snapshot command includes `--model gpt-5.5`; artifact records exact model as not exposed in permitted metadata | Produced `skeptical-review.md` for attempt `mc-3b9` |
| `matt-city/matt.technical-analyst-1` | `mcr-wisp-02ufc2` / `matt__technical-analyst-mcr-wisp-02ufc2` | `codex`; exact model not exposed in current permitted session metadata | Produced `artifact-index.md` and `provenance.json` for attempt `mc-hmp` |

## Capability And Approval State

| Surface | State |
|---|---|
| Local filesystem reads | Used for the approved request package, approved local artifacts, retained workflow snapshots, and approved versioned repository files already named in the request package |
| Local filesystem writes | Used only for `artifact-index.md` and `provenance.json` under `requests/phase-1-smoke-test-003/artifacts/` |
| Gas City / Beads | Used to claim the routed package attempt and read/update/close only the explicit claimed Bead `mc-hmp` |
| Git | Read-only branch and commit inspection; no commit, push, pull, PR, or remote access |
| External systems accessed | None by this package agent; upstream artifacts report the same local-only boundary for their own sessions |
| External systems modified | None |
| External identities used | None |
| Telemetry | Disabled for this baseline; no Phoenix, OpenTelemetry exporter, evaluation hook, or dashboard dependency added |
| Human approval | Matthew approved local research, analysis, packaging, provenance, and read-only diagnostic inspection only |

## Source Classifications

- `Observed runtime behavior`: Current `mc-hmp` claim data, current `bd show "mc-hmp" --json` dependency state, local environment metadata, local version commands, Git branch and commit, and artifact existence/hashes.
- `Versioned implementation`: `city/formulas/research-topic.toml`, `city/pack.toml`, and approved local agent definitions referenced by upstream artifacts.
- `Documented design`: `request.md`, `asana-context.md`, and approved local architecture, identity, runtime, and routing documentation summarized in upstream artifacts.
- `Observed runtime behavior`: After `mc-hmp` closed with `gc.outcome=pass`, a current read of the claimed Bead showed tracked workflow root `mc-5n9` closed with `gc.outcome=pass`.
- `Inference`: The finalization path completed sufficiently for the workflow root to close with pass; finalization Bead `mc-5wu` was not directly re-read after package close because this agent kept later Beads CLI reads scoped to the explicit claimed Bead.
- `Planned capability`: Phoenix and OpenTelemetry remain Phase 2 and are excluded from this baseline run.
- `Historical failure`: Smoke Test #1 and Smoke Test #2 are preserved as prior evidence and are not reused as proof for this run.

## Limitations And Unknowns

- Final workflow outcome was pending at initial package artifact creation because finalization Bead `mc-5wu` depends on package logical Bead `mc-2yp`, which depends on the claimed package attempt `mc-hmp`; post-close verification observed workflow root `mc-5n9` closed with `gc.outcome=pass`.
- No natural retry was exercised in the observed successful path. Retry policy is represented by retry-controller metadata and first-attempt pass logs, not by a failed-then-retried attempt.
- The strongest no-external-access claim is per-agent local evidence and self-report in artifacts, not an independent host-wide network or credential audit.
- The shell initially lacked `gc`, `bd`, and `jq` on `PATH`; commands succeeded after `/home/matt/go/bin` was prepended. `GC_BIN` identifies Gas City `1.3.5`, while PATH-local `gc` reports `1.3.4`.
- The final SHA-256 for `provenance.json` must be computed after the file is written. Self-hashes are not embedded to avoid false self-referential values.
