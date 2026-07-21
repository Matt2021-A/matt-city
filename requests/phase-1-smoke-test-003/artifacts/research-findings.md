# Research Findings: Phase 1 Smoke Test #3

## Artifact Metadata

| Field | Value |
|---|---|
| Artifact | `research-findings.md` |
| Request ID | `phase-1-smoke-test-003` |
| Canonical Asana project GID | `1216444827581484` |
| Canonical Asana task GID | `1216740708489953` |
| Originating blog project GID | `1213500168987836` |
| Originating blog task GID | `1216445335991016` |
| Formula | `research-topic` |
| Formula version | `1` |
| Contributing agent | `matt-city/matt.researcher-1` |
| Claimed Bead ID | `mc-3i8` |
| Logical Bead ID | `mc-u4d` |
| Workflow root Bead ID | `mc-5n9` |
| Step | `research` |
| Attempt | `1` |
| Run target | `matt-city/matt.researcher` |
| Concrete session ID | `mcr-wisp-xamxea` |
| Concrete session name | `matt__researcher-mcr-wisp-xamxea` |
| Provider | `codex` |
| Runtime template | `matt-city/matt.researcher` |
| Git branch observed | `fix/restore-bd-provider` |
| Git commit observed | `8c0da8d3903bcc91b2f7f056a10ebb44579dd69a` |
| Approval state | Local research, analysis, packaging, and provenance only |
| External systems accessed by this agent | None |
| External systems modified by this agent | None |
| Telemetry enabled state for this artifact | No Phoenix, OpenTelemetry exporter, evaluation hook, or dashboard dependency was added or used |

## Classification Legend

Material claims in this artifact use the request-defined source classes:

- `Observed runtime behavior`: facts observed during this claimed session or in current local command output.
- `Versioned implementation`: facts from repository configuration, formulas, prompts, scripts, or examples.
- `Documented design`: facts from repository design documentation and request-package requirements.
- `Upstream documentation or source analysis`: facts from approved versioned summaries of upstream repositories; no browsing was performed.
- `Inference`: bounded conclusions drawn from approved evidence.
- `Planned capability`: roadmap or ADR intent that is not part of this baseline execution.
- `Historical failure`: retained evidence from earlier smoke-test attempts.
- `Temporary workaround`: temporary implementation state documented as not the intended durable model.

## Inputs Used

This research step read the approved request package and approved repository paths listed in `requests/phase-1-smoke-test-003/request.md`. It also used local runtime evidence from the claimed Bead, current session identity environment, version commands, and Git branch/commit commands for artifact metadata.

No web browsing, Asana connector, GitHub credential, Google Drive, email, calendar, Slack, WordPress, publishing, commit, push, or external write was used.

## Source Inventory

All approved paths named by the request were present. Hashes are SHA-256 values observed before writing this artifact.

| Status | Path | Lines | SHA-256 | Primary classification |
|---|---:|---:|---|---|
| Available | `README.md` | 284 | `4383f8421e6ce5b569daa49ed273491f7ffae7e8d9d37ffa4d8a40338d4a5a38` | Documented design |
| Available | `docs/architecture.md` | 263 | `3daa9081ac371bec164ee21c6c19dd53ec0112cd7bf392e9d1033e2f480458d4` | Documented design |
| Available | `docs/roadmap.md` | 328 | `2682e3f71291f7a08bac22f92b22e8e6cfe5d4b5acb42874f6e9fd4077dd50a6` | Documented design |
| Available | `docs/identity-model.md` | 35 | `ebe6967c3081a552df0a5fe272274b1b580355b8d063a2cc59e53151ee936ef8` | Documented design |
| Available | `docs/gas-city-alignment.md` | 233 | `2ecad2f512346d894b3b0da80ff35e830cbde4503220249a4d80af464cf99bdc` | Documented design and upstream alignment summary |
| Available | `docs/phase-1-scope.md` | 102 | `a4b49265a3514860e3a5087ef35367f35a87865ea2c924b114266c91f07c7a8a` | Documented design |
| Available | `docs/runtime-validation.md` | 178 | `86a92bf0613f3f9122e77d139d1402a5784e85419b81729798cb29734ffee171` | Observed runtime behavior summary |
| Available | `docs/workflow-routing.md` | 113 | `eb7351a9ea328462e9d8f3712acbc0f99e8ff9a10be59dd7feb388da85a0ceae` | Historical failure and documented design |
| Available | `docs/upstream-alignment-plan.md` | 104 | `ae8717c93981ff9c3b8e9c997b78ceeb813a8eabd13a623722a311a353c9b7f2` | Upstream documentation or source analysis |
| Available | `docs/upstream-ecosystem-review.md` | 188 | `d1c7a64a4c412927a34ea6ac03b4ff476beea303fe31a15a760fd548ef13fc09` | Upstream documentation or source analysis |
| Available | `docs/decisions/ADR-0001-phoenix-observability.md` | 237 | `5f16efecc79fd6ea44ab2f68866b23835f8f1e4f3f823cfdd02fa787e5fedf2b` | Documented design and planned capability |
| Available | `docs/phoenix-trace-schema.md` | 278 | `79f83a78a74d4fa0b85e07d015998815d27d91e4eabba6e744870ff0bbfa178d` | Planned capability |
| Available | `city/pack.toml` | 20 | `dbe5998f07f68452493e2515b003eae6a0338c1a6a1ac16600967a2d6543e741` | Versioned implementation |
| Available | `city/formulas/research-topic.toml` | 76 | `483e741d859a766808643c9475159b0c8185167fc58e89c0e299a089df0bb312` | Versioned implementation |
| Available | `city/agents/run-operator/agent.toml` | 4 | `5e299682039537506cad8df5fec4bdbe3583ccbeedd5a2630e586ebb1ec982a9` | Versioned implementation |
| Available | `city/agents/run-operator/prompt.template.md` | 42 | `c6ca1402349164d9ffa1e23d770ec1b3a6a21158a784bb74632063050fb5a5b3` | Versioned implementation |
| Available | `city/agents/researcher/agent.toml` | 4 | `3ae10ba397466da5af23d4c6c994dc7f68d4e18f2be58ddcd161f2d56ea7e81f` | Versioned implementation |
| Available | `city/agents/researcher/prompt.template.md` | 37 | `d7c35d146cb74aff4cc0552b51abb5e3aa650de8d2f071e250cb01abef312f2e` | Versioned implementation |
| Available | `city/agents/technical-analyst/agent.toml` | 4 | `fd3d98677af1d6e9d9899f56df07d0c8440273bd7920be59365b8e4c028d0f74` | Versioned implementation |
| Available | `city/agents/technical-analyst/prompt.template.md` | 37 | `8d7007fc170f20a06a2d5430957ba3f2d7bc98f55cee75d28d82c3cae9bd8f64` | Versioned implementation |
| Available | `city/agents/identity-security-analyst/agent.toml` | 4 | `4c3f5cb7641feb464e2ade709bf8e48a0d5d04b99f7d62ccdb00683d33827282` | Versioned implementation |
| Available | `city/agents/identity-security-analyst/prompt.template.md` | 37 | `62af7a98d8980d7ad883330616ed38567f2ee9d68c854cc46ddd80282c729123` | Versioned implementation |
| Available | `city/agents/skeptic/agent.toml` | 4 | `6dfa92bbc94a3f1313a8138d889c4df542994d9bb99144b401276d1f51e372fe` | Versioned implementation |
| Available | `city/agents/skeptic/prompt.template.md` | 37 | `4430ccc8f109a8d0da2e7e8ef03fcaaae228bcadf23e3bc2d209eeb52f3ec67c` | Versioned implementation |
| Available | `city/doctor/runtime-alignment/doctor.toml` | 2 | `02732046b2e98029f0549e4f65aab1db60880fe0d6a9d125997def02e2fe3b9b` | Versioned implementation |
| Available | `city/doctor/runtime-alignment/run.sh` | 57 | `ecd06d574dcedcd2d4f5613e646420ce218767044c400bf536c5538925a2c0d9` | Versioned implementation |
| Available | `examples/debian-wsl/city.toml` | 19 | `54186062c10e2af875db24b22d415ee65f695ac24077900b5d2977af2954ba6e` | Versioned implementation |
| Available | `requests/phase-1-smoke-test-003/asana-context.md` | 150 | `7f3a219b29651e4d954790df61d9516795a4ab7751908bd584e4d92b623fcd77` | Documented design, historical failure, approval boundary |

## Observed Facts

- `Observed runtime behavior`: This session claimed Bead `mc-3i8`, titled `Collect and normalize sources for phase-1-smoke-test-003`, with status `in_progress`, assignee/session actor `matt__researcher-mcr-wisp-xamxea`, step `research`, attempt `1`, run target `matt-city/matt.researcher`, request ID `phase-1-smoke-test-003`, Asana project GID `1216444827581484`, and Asana task GID `1216740708489953`.
- `Observed runtime behavior`: The claimed Bead depends on workflow root Bead `mc-5n9`, whose observed metadata includes `gc.formula_contract=graph.v2`, `gc.kind=workflow`, `gc.routed_to=matt-city/matt.run-operator`, formula vars for request ID, request path, rig name, Asana project GID, and Asana task GID.
- `Observed runtime behavior`: The concrete session identity for this artifact is `mcr-wisp-xamxea` / `matt__researcher-mcr-wisp-xamxea`; the runtime agent is `matt-city/matt.researcher-1`; the provider environment value is `codex`.
- `Observed runtime behavior`: `$GC_BIN version` reports Gas City `1.3.5`; `bd version` reports Beads `1.1.0 (8e4e59d39)`; `dolt version` reports Dolt `2.2.1`.
- `Observed runtime behavior`: The Git branch observed during this step is `fix/restore-bd-provider` and the observed commit is `8c0da8d3903bcc91b2f7f056a10ebb44579dd69a`.
- `Observed runtime behavior`: A PATH-local `/home/matt/go/bin/gc` also exists and reports version `1.3.4`; the runtime-provided `GC_BIN` points at the Homebrew Gas City `1.3.5` binary. This is a version-provenance note, not evidence of workflow failure.
- `Observed runtime behavior`: No external connector or browser was used by this research agent, and no external system was modified.

## Evidence-Backed Findings

### 1. Matt City is a governed work system, not just several agents

- `Documented design`: The README defines Matt City as an identity-aware multi-agent operating environment and lists six principles: Asana as human-visible work, Gas City plus Beads/Dolt as durable machine execution state, GitHub as versioned implementation, separate principal boundaries, deliberately packaged context, and reconstructable attribution (`README.md:3`, `README.md:7`, `README.md:12`).
- `Documented design`: The architecture separates human work, machine execution, versioned implementation, telemetry transport, observability interfaces, and external actions into distinct planes (`docs/architecture.md:1`, `docs/architecture.md:52`).
- `Inference`: The core value beyond parallel agents is not agent count. It is durable lifecycle state, bounded context, attribution, and authority separation across Asana, Gas City, Beads/Dolt, GitHub, sessions, provider entitlements, and future telemetry.

### 2. Responsibility is divided across canonical systems and principals

- `Documented design`: Asana is canonical for human work, context, decisions, approvals, status, and history; results and blockers return to the originating task (`README.md:56`, `docs/architecture.md:54`, `docs/architecture.md:60`).
- `Documented design`: Gas City plus Beads/Dolt own machine orchestration, dependencies, routing, claims, sessions, retries, orders, events, and durable workflow state (`README.md:58`, `docs/architecture.md:73`, `docs/gas-city-alignment.md:126`).
- `Documented design`: GitHub owns versioned prompts, formulas, schemas, policies, implementation code, documentation, roadmap decisions, and approved artifacts (`README.md:59`, `docs/architecture.md:89`).
- `Documented design`: The primary assistant interprets Matthew's intent, retrieves bounded context, creates structured requests, delegates, synthesizes, and performs separately authorized external updates through its own connected identities (`docs/architecture.md:65`, `docs/architecture.md:71`).
- `Versioned implementation`: The Matt City pack declares rig-scoped researcher, technical analyst, identity-security analyst, and skeptic agents (`city/pack.toml:6`, `city/pack.toml:20`).
- `Versioned implementation`: The agent definitions use the `codex` provider and local rig scope for run-operator and specialist roles (`city/agents/run-operator/agent.toml:1`, `city/agents/researcher/agent.toml:1`, `city/agents/skeptic/agent.toml:1`).

### 3. Identity boundaries are first-class design constraints

- `Documented design`: Matt City explicitly distinguishes Matthew, the primary assistant, Gas City controller, specialized agents, runtime sessions, and external service or workload identities (`docs/identity-model.md:5`, `docs/identity-model.md:12`).
- `Documented design`: The governing rule is that agents may inherit work but do not inherit another principal's identity, authority, connections, credentials, permissions, or unrelated context (`README.md:164`, `docs/architecture.md:205`, `docs/identity-model.md:29`).
- `Documented design`: Phase 1 agents receive local file access only and no GitHub, Asana, email, calendar, WordPress, or other external credentials (`docs/identity-model.md:33`, `docs/phase-1-scope.md:21`, `requests/phase-1-smoke-test-003/asana-context.md:140`).
- `Inference`: Requester, delegator, owner, executor, credential holder, telemetry collector, reviewer, and approver remain separate because collapsing them would make attribution and authorization ambiguous. The design treats work delegation as transfer of bounded task context, not transfer of identity or credentials.

### 4. Formula V2, Beads, sessions, routing, and provenance form the execution model

- `Documented design`: The Phase 1 workflow is Asana task -> primary assistant context package -> Gas City materialized bd-backed work -> run operator and specialist claims -> local artifacts and provenance -> assistant return -> Matthew review (`docs/phase-1-scope.md:32`, `docs/phase-1-scope.md:44`).
- `Versioned implementation`: The `research-topic` formula has version `1`, requires formula compiler `>=2.0.0`, declares request variables, and defines ordered steps for research, technical analysis, identity-security analysis, skeptical review, and package-artifacts (`city/formulas/research-topic.toml:1`, `city/formulas/research-topic.toml:10`, `city/formulas/research-topic.toml:17`, `city/formulas/research-topic.toml:76`).
- `Versioned implementation`: Each executable formula step uses `metadata.gc.run_target` to target the run operator or a specialist agent, and dependencies are encoded with `needs` for later steps (`city/formulas/research-topic.toml:22`, `city/formulas/research-topic.toml:34`, `city/formulas/research-topic.toml:45`, `city/formulas/research-topic.toml:57`, `city/formulas/research-topic.toml:69`).
- `Observed runtime behavior`: This researcher session was a concrete claim for the research step, satisfying route-to-claim evidence for this one attempt. It does not by itself prove the later technical, identity-security, skeptical-review, package, or finalization steps.
- `Inference`: The current graph should be understood as a durable workflow under the originating Asana task, with live sessions as replaceable executors. A successful live session is not the source of truth; Beads/Dolt and provenance must reconstruct the execution after the session exits.

### 5. Smoke Test #1 and #2 are historical evidence, not success proof for this run

- `Historical failure`: Smoke Test #1 used request ID `phase-1-smoke-test-001`, workflow root `gc-465`, generated graph `gc-465` through `gc-481`, and diagnostic session Bead `gc-686`; it created a graph but did not prove intended route and concrete claim, and forced routing did not establish worker visibility (`requests/phase-1-smoke-test-003/asana-context.md:58`, `requests/phase-1-smoke-test-003/asana-context.md:67`).
- `Historical failure`: `docs/workflow-routing.md` records that the first live workflow `gc-465` failed because configured Gas City agents were placed in `assignee` rather than reserved runtime routing metadata, and generated Beads were manually routed one at a time instead of launched through an orchestrator pattern (`docs/workflow-routing.md:5`, `docs/workflow-routing.md:13`).
- `Historical failure`: Smoke Test #2 used request ID `phase-1-smoke-test-002`, workflow root `gc-38022`, and graph `gc-38022` through `gc-38039`; it materialized a fresh bd-backed graph but stopped at root inspection and supported launch path, without manual downstream routing (`requests/phase-1-smoke-test-003/asana-context.md:69`, `requests/phase-1-smoke-test-003/asana-context.md:77`).
- `Inference`: Earlier smoke tests are useful because they clarify the design boundary between assignment, routing, claim, execution, and approval. They must not be reused as proof of Smoke Test #3 completion.

### 6. The file-backed provider was a temporary workaround; the current target is managed bd/Dolt

- `Temporary workaround`: The alignment plan says the file backend remained temporary and that Dolt restoration required non-destructive validation, backup, export, and schema compatibility checks (`docs/upstream-alignment-plan.md:67`, `docs/upstream-alignment-plan.md:80`).
- `Temporary workaround`: The Gas City alignment doc says the earlier file-provider substitution allowed configuration work to continue during an initial schema-migration failure, but it is not the active durability model now (`docs/gas-city-alignment.md:142`).
- `Documented design`: Current runtime docs and the Asana context snapshot identify the active Beads provider as `bd`, with a city-managed Dolt service as durable store (`requests/phase-1-smoke-test-003/asana-context.md:43`, `requests/phase-1-smoke-test-003/asana-context.md:48`, `README.md:176`, `README.md:186`).
- `Observed runtime behavior`: The current session observed Beads `1.1.0` and Dolt `2.2.1`; the claimed Bead exists in the bd-backed workflow store visible to `bd show`.
- `Inference`: The recovery claim is supported for this baseline only as "managed bd/Dolt is active and accessible." It is premature to claim all recovery and migration concerns are closed because legacy store reconciliation and durable session-replacement proof remain separate gates.

### 7. Run-target metadata differs from human assignment

- `Documented design`: Workflow routing documentation separates human ownership, formula routing intent, session claim, provider execution, and external action identity (`docs/workflow-routing.md:14`, `docs/workflow-routing.md:25`).
- `Documented design`: For Formula V2 work steps, configured-agent routing uses reserved `metadata.gc.run_target`; the `assignee` field must not substitute for configured-agent dispatch (`docs/workflow-routing.md:26`, `docs/workflow-routing.md:35`).
- `Upstream documentation or source analysis`: The upstream review records Gas City core as establishing Formula V2, cooking into a Bead store, ready-step routing, `gc.run_target`, and the requirement that work be instantiated in the store read by its worker (`docs/upstream-ecosystem-review.md:22`, `docs/upstream-ecosystem-review.md:40`).
- `Versioned implementation`: The doctor script checks that required targets exist and that compiled Formula V2 metadata includes at least five `gc.run_target` entries (`city/doctor/runtime-alignment/run.sh:27`, `city/doctor/runtime-alignment/run.sh:44`).
- `Observed runtime behavior`: Bead `mc-3i8` has both an assignee/session actor and metadata fields for `gc.routed_to` / `gc.run_target`. The observed assignee identifies the concrete claimant; the run-target metadata identifies intended configured-agent routing.

### 8. Generated downstream workflow steps must not be manually routed merely to advance the workflow

- `Documented design`: The production launch pattern says to launch the Formula V2 workflow through a verified coordinator or run-operator target, let the orchestrator dispatch ready work using `gc.run_target`, and avoid manually slinging generated step Beads under normal operation (`docs/workflow-routing.md:51`, `docs/workflow-routing.md:63`).
- `Documented design`: Prohibited shortcuts include reusing old workflow `gc-465`, using `--force`, manually running claims from Matthew's ordinary shell, creating specialist sessions before routed work is visible, and treating a sling response as proof of claimable work (`docs/workflow-routing.md:79`, `docs/workflow-routing.md:88`).
- `Documented design`: The request package repeats that generated downstream attempts are not manually routed during normal execution and that current workflow identities must be new (`requests/phase-1-smoke-test-003/asana-context.md:89`, `requests/phase-1-smoke-test-003/asana-context.md:94`).
- `Inference`: Manual downstream routing would destroy the evidence that dependencies, retries, readiness, and target-specific claim behavior work as a Formula V2 lifecycle rather than as an operator repair sequence.

### 9. The Phase 1 runtime model is Debian WSL, native Docker, systemd, supervisor, Codex, Beads, and Dolt

- `Documented design`: The current runtime baseline is Debian GNU/Linux 13.5 under WSL2, repository path `/home/matt/src/matt-city`, runtime path `/home/matt/matt-city-runtime`, native Docker Engine inside Debian, Gas City supervisor and Matt City systemd services, Gas City `1.3.5`, Beads `1.1.0`, Dolt `2.2.1`, Beads provider `bd`, and local execution provider `builtin:codex` (`requests/phase-1-smoke-test-003/asana-context.md:38`, `requests/phase-1-smoke-test-003/asana-context.md:52`).
- `Documented design`: Runtime validation places Windows outside the service topology, with Debian WSL2 running systemd, Docker Engine, Gas City controller/API, managed Dolt SQL server, and Matt City rig (`docs/runtime-validation.md:28`, `docs/runtime-validation.md:44`).
- `Versioned implementation`: The Debian WSL example config sets provider `codex`, `base = "builtin:codex"`, `beads.provider = "bd"`, rig name `matt-city`, default branch `main`, and imports from `/home/matt/src/matt-city/city` (`examples/debian-wsl/city.toml:1`, `examples/debian-wsl/city.toml:19`).
- `Observed runtime behavior`: This session observed `GC_CITY=/home/matt/matt-city-runtime`, `GC_RIG_ROOT=/home/matt/src/matt-city`, `GC_PROVIDER=codex`, `GC_SESSION_ID=mcr-wisp-xamxea`, and `GC_TEMPLATE=matt-city/matt.researcher`.

### 10. Current runtime warnings are operational warnings, not completed diagnoses

- `Documented design`: Runtime validation records `gc status` session-snapshot timeouts and one isolated status run over 30 seconds; the supervisor API responded quickly, suggesting a slow session projection, store read, or maintenance path rather than general API failure (`docs/runtime-validation.md:106`, `docs/runtime-validation.md:116`).
- `Documented design`: Current health warnings include overdue scheduled orders, local-only JSONL archive, retained inactive legacy embedded-Dolt store, order-retention advisory, large events JSONL, and branch mismatch during recovery work (`docs/runtime-validation.md:87`, `docs/runtime-validation.md:104`).
- `Documented design`: Asana context warns about Gas City status/session snapshot latency and managed-store transaction/storage churn warnings; it prohibits destructive cleanup merely to make the smoke test appear cleaner (`requests/phase-1-smoke-test-003/asana-context.md:119`, `requests/phase-1-smoke-test-003/asana-context.md:126`).
- `Inference`: These warnings should be captured in provenance and operator notes, but they do not prove either successful end-to-end execution or a hard workflow failure.

### 11. Capability status must distinguish observed, versioned, documented, inferred, planned, failed, and unproven

| Capability or claim | Classification | Evidence |
|---|---|---|
| Matt City has hand-authored local agent definitions for run-operator, researcher, technical analyst, identity-security analyst, and skeptic | Versioned implementation | `README.md:188`, `city/agents/*/agent.toml` |
| `research-topic` Formula V2 defines ordered research, technical, identity-security, skeptical-review, and package-artifacts steps | Versioned implementation | `city/formulas/research-topic.toml:17`, `city/formulas/research-topic.toml:76` |
| Current claimed research step was routed and claimed by a concrete researcher session | Observed runtime behavior | `bd show "mc-3i8" --json`, session env |
| Managed bd/Dolt is the active intended machine-state plane | Documented design plus observed local tool versions | `README.md:176`, `requests/phase-1-smoke-test-003/asana-context.md:46`, local `bd version`, local `dolt version` |
| Full graph finalization has completed | Still unproven in this artifact | This step only claimed and wrote the research artifact |
| Session replacement preserves durable workflow state | Still unproven in this artifact | Listed as a remaining Phase 1 gate in `docs/runtime-validation.md:146` |
| Phoenix will be the primary AI-observability and evaluation interface | Planned capability | `docs/decisions/ADR-0001-phoenix-observability.md:20`, `docs/roadmap.md:102` |
| Phoenix or OpenTelemetry is enabled in Smoke Test #3 | Excluded, not observed | `requests/phase-1-smoke-test-003/asana-context.md:116`, `docs/roadmap.md:49` |
| Smoke Test #1 proved normal routing and claim | Historical failure, not proven | `docs/workflow-routing.md:5`, `docs/workflow-routing.md:114` |
| Smoke Test #2 proved full end-to-end execution | Historical partial result, not proven | `requests/phase-1-smoke-test-003/asana-context.md:69`, `requests/phase-1-smoke-test-003/asana-context.md:77` |

### 12. Phoenix and OpenTelemetry belong to Phase 2, not this baseline run

- `Documented design`: README states Phoenix is committed Phase 2, OpenTelemetry/OpenInference are neutral instrumentation and transport, and Grafana-class tooling is deferred until concrete operational requirements justify it (`README.md:32`, `README.md:35`).
- `Documented design`: ADR-0001 accepts Phoenix as the primary Phase 2 observability and evaluation interface for AI traces, workflow and agent span inspection, annotations, datasets, experiments, evaluations, and trace-derived signals (`docs/decisions/ADR-0001-phoenix-observability.md:20`, `docs/decisions/ADR-0001-phoenix-observability.md:34`).
- `Planned capability`: The Phoenix trace schema is draft metadata-only design and depends on a successful or stable-failure bd-backed workflow baseline (`docs/phoenix-trace-schema.md:1`, `docs/phoenix-trace-schema.md:5`).
- `Documented design`: Telemetry must be metadata-first, exclude prompt bodies, tool bodies, source documents, connected-system content, credentials, secrets, and personal data by default, and fail open with respect to workflow execution (`docs/phoenix-trace-schema.md:176`, `docs/phoenix-trace-schema.md:231`).
- `Inference`: Adding Phoenix, OpenTelemetry exporters, evaluation hooks, or dashboards during Smoke Test #3 would contaminate the baseline by adding new runtime components before the uninstrumented lifecycle is proven.

### 13. Premature or misleading claims to avoid

- `Inference`: Do not claim Matt City is production-ready or enterprise-compliant. Phase 1 scope explicitly excludes production availability and enterprise compliance claims (`docs/phase-1-scope.md:21`, `docs/phase-1-scope.md:30`).
- `Inference`: Do not claim every workflow step has completed until technical analysis, identity-security analysis, skeptical review, package-artifacts, and finalization reach terminal state with evidence.
- `Inference`: Do not claim external return to Asana, GitHub publication, Google Docs transfer, WordPress drafting, or outbound messaging occurred in this run. Those are outside this local agent's authority and were explicitly denied.
- `Inference`: Do not claim Phoenix is installed, collecting, or validating this baseline. The request excludes Phoenix and telemetry instrumentation from Smoke Test #3.
- `Inference`: Do not claim session-snapshot or store-status latency is solved. It is documented as a warning and not yet root-caused.
- `Inference`: Do not claim no external writes were performed by the entire workflow until every specialist and package step records that boundary. This artifact can only state that this researcher step used no external systems.

## Normalized Findings for Downstream Agents

1. `Observed runtime behavior`: Research step `mc-3i8` in request `phase-1-smoke-test-003` was claimed by concrete session `mcr-wisp-xamxea` for `matt-city/matt.researcher`.
2. `Observed runtime behavior`: Root workflow Bead `mc-5n9` is visible as a dependency of the claimed research step and records `graph.v2` metadata, run operator routing, request variables, Asana GIDs, and request path.
3. `Versioned implementation`: Formula `research-topic` version `1` defines five ordered steps with retry policies and `gc.run_target` metadata.
4. `Documented design`: Asana, Gas City plus Beads/Dolt, GitHub, OpenTelemetry/OpenInference, Phoenix, primary assistant, Matthew, local agents, and runtime sessions have distinct roles and authority boundaries.
5. `Historical failure`: Smoke Test #1 failed to prove normal worker visibility and claim because assignment, routing, and forced cross-store sling were conflated.
6. `Historical failure`: Smoke Test #2 materialized a fresh bd-backed graph but did not advance through full execution and was deliberately not manually routed.
7. `Temporary workaround`: The file-provider path was temporary and is no longer the documented active model for this baseline.
8. `Documented design`: Managed bd/Dolt is the active machine-state plane, while Asana remains the human work and approval plane.
9. `Planned capability`: Phoenix and OpenTelemetry are Phase 2 metadata-first observability work and are excluded from this baseline.
10. `Still unproven`: Full dependency ordering, retry behavior, package-artifacts, final workflow outcome, durable state across session replacement, artifact hashes for all outputs, and external no-write proof across all agents remain to be captured by later steps.

## Limitations

- This artifact is the research step output only. It is not `technical-analysis.md`, `identity-security-analysis.md`, `skeptical-review.md`, `artifact-index.md`, or `provenance.json`.
- This artifact proves only this step's local research execution and artifact creation once written. It does not prove downstream specialist completion or workflow finalization.
- No external source verification was performed because the request prohibited browsing and connected-system access.
- Asana task state, GitHub remote state, dashboard state, and Phoenix state were not queried.
- Runtime warnings were taken from approved versioned docs and request package summaries, plus limited current local command output; no destructive diagnosis or service cleanup was performed.
- The exact provider model name was not exposed in the permitted local session metadata available to this agent, so it remains `unknown` for this artifact.
- The originating request Bead is not independently established in this artifact. The observed root metadata includes `gc.input_convoy_id=mc-aba`, but this research step does not classify that value as the originating request Bead without the package/provenance step validating it.

## Unresolved Questions

- Which exact step, spec, retry-controller, attempt, and finalization Beads should be recorded in final provenance beyond the observed research step `mc-3i8`, logical Bead `mc-u4d`, and root Bead `mc-5n9`?
- Will the technical analyst, identity-security analyst, skeptic, and package-artifacts steps each be claimed by concrete intended sessions without manual downstream routing?
- Will retry and finalization behavior be demonstrated naturally by the workflow graph, or only remain versioned design?
- Will session replacement be tested without loss of durable Bead state during this smoke-test cycle?
- Which final artifact hashes will be recorded after all outputs exist?
- Will the final workflow outcome be successful completion or a stable, fully evidenced failure?
- Can the runtime PATH/version ambiguity between the session `GC_BIN` Gas City `1.3.5` binary and the separate `/home/matt/go/bin/gc` Gas City `1.3.4` binary be normalized in operator documentation without altering this baseline evidence?
