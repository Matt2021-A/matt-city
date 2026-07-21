# Technical Analysis: Phase 1 Smoke Test #3

## Artifact Metadata

| Field | Value |
|---|---|
| Artifact | `technical-analysis.md` |
| Request ID | `phase-1-smoke-test-003` |
| Canonical Asana project GID | `1216444827581484` |
| Canonical Asana task GID | `1216740708489953` |
| Originating blog project GID | `1213500168987836` |
| Originating blog task GID | `1216445335991016` |
| Originating local request Bead | `mc-90t` |
| Workflow root Bead | `mc-5n9` |
| Logical step Bead | `mc-7bt` |
| Claimed Bead ID | `mc-exr` |
| Upstream research logical Bead | `mc-u4d` |
| Upstream research attempt Bead | `mc-3i8` |
| Formula | `research-topic` |
| Formula version | `1` |
| Step | `technical-analysis` |
| Attempt | `1` |
| Run target | `matt-city/matt.technical-analyst` |
| Contributing agent | `matt-city/matt.technical-analyst-1` |
| Concrete session ID | `mcr-wisp-pzsryk` |
| Concrete session name | `matt__technical-analyst-mcr-wisp-pzsryk` |
| Provider | `codex` |
| Runtime template | `matt-city/matt.technical-analyst` |
| Runtime city | `/home/matt/matt-city-runtime` |
| Rig root | `/home/matt/src/matt-city` |
| Git branch observed | `fix/restore-bd-provider` |
| Git commit observed | `8c0da8d3903bcc91b2f7f056a10ebb44579dd69a` |
| Gas City version observed | `1.3.5` |
| Beads version observed | `1.1.0 (8e4e59d39)` |
| Dolt version observed | `2.2.1` |
| Approval state | Local research, analysis, packaging, and provenance only |
| External systems accessed by this agent | None |
| External systems modified by this agent | None |
| Telemetry enabled state for this artifact | Disabled; no Phoenix, OpenTelemetry exporter, evaluation hook, or dashboard dependency was added or used |

## Source Classifications

Material claims use the request-defined classifications:

- `Observed runtime behavior`: facts from this session, claimed Beads, local command output, and local request-package snapshots.
- `Versioned implementation`: facts from committed or locally versioned configuration, formulas, prompts, scripts, and examples.
- `Documented design`: facts from approved repository documentation and the approved request package.
- `Upstream documentation or source analysis`: facts from approved local upstream-alignment summaries only.
- `Inference`: bounded conclusions drawn from the approved evidence.
- `Planned capability`: roadmap or ADR intent that is outside this baseline run.
- `Historical failure`: retained evidence from prior smoke tests.
- `Temporary workaround`: documented temporary state that is not the durable target model.

## Inputs Used

| Input | SHA-256 or identifier | Use |
|---|---|---|
| `requests/phase-1-smoke-test-003/request.md` | `fa24ad02163d29fba148f3656956ad39aefc1600b96fd36027409add6c4221a8` | Request identity, scope, required coverage, acceptance criteria, boundaries |
| `requests/phase-1-smoke-test-003/artifacts/research-findings.md` | `03b24acdaa8293cdd04ae284a673f6b6e954dcf020ec9dd4aba3846ec0c690d5` | Approved research findings, source inventory, normalized findings |
| `requests/phase-1-smoke-test-003/asana-context.md` | `7f3a219b29651e4d954790df61d9516795a4ab7751908bd584e4d92b623fcd77` | Asana-linked context, historical smoke-test evidence, runtime baseline, approval boundary |
| `requests/phase-1-smoke-test-003/originating-bead-id.txt` | `mc-90t` | Originating local request Bead identifier |
| `requests/phase-1-smoke-test-003/source-bead-after-launch.json` | request-package snapshot | Originating local request Bead details after launch |
| `requests/phase-1-smoke-test-003/workflow-root-after-launch.json` | request-package snapshot | Workflow root metadata after launch |
| `bd show "mc-exr" --json` | current local Bead read | Claimed attempt metadata and dependencies |
| `bd show "mc-7bt" --json` | current local Bead read | Logical retry-controller step metadata |
| `bd show "mc-u4d" --json` | current local Bead read | Upstream research retry-controller outcome |
| `bd show "mc-5n9" --json` | current local Bead read | Workflow root metadata |
| Approved repository docs and config | listed in `research-findings.md` source inventory | Architecture, formula, runtime, identity, and roadmap context |

No browsing, Asana connector, GitHub credential, Drive, email, calendar, Slack, WordPress, publishing, commit, push, or external write was used.

## Observed Facts

- `Observed runtime behavior`: This session claimed attempt Bead `mc-exr`, titled `Produce technical analysis for phase-1-smoke-test-003`, as session `matt__technical-analyst-mcr-wisp-pzsryk`.
- `Observed runtime behavior`: `mc-exr` records `gc.attempt=1`, `gc.logical_bead_id=mc-7bt`, `gc.root_bead_id=mc-5n9`, `gc.run_target=matt-city/matt.technical-analyst`, `gc.step_id=technical-analysis`, and request ID `phase-1-smoke-test-003`.
- `Observed runtime behavior`: The logical step Bead `mc-7bt` records retry metadata: `gc.kind=retry`, `gc.max_attempts=2`, `gc.on_exhausted=hard_fail`, and `gc.execution_routed_to=matt-city/matt.technical-analyst`.
- `Observed runtime behavior`: The upstream research logical Bead `mc-u4d` is closed with `gc.outcome=pass` and an attempt log showing attempt `1` passed.
- `Observed runtime behavior`: The workflow root `mc-5n9` is in progress and records `gc.formula_contract=graph.v2`, `gc.input_convoy_id=mc-aba`, `gc.routed_to=matt-city/matt.run-operator`, and request variables for request ID, request path, rig, and Asana GIDs.
- `Observed runtime behavior`: The originating local request Bead snapshot identifies `mc-90t`, external reference `asana-task:1216740708489953`, branch `fix/restore-bd-provider`, commit `8c0da8d3903bcc91b2f7f056a10ebb44579dd69a`, `external_write_authorized=false`, and `telemetry_enabled=false`.
- `Observed runtime behavior`: This shell initially lacked `gc` and `bd` on `PATH`; `/home/matt/go/bin` contained working `gc` and `bd` executables. The runtime-provided `GC_BIN` resolved to Gas City `1.3.5`.
- `Observed runtime behavior`: The observed local versions during this artifact were Gas City `1.3.5`, Beads `1.1.0`, and Dolt `2.2.1`.
- `Observed runtime behavior`: This technical-analysis agent made no external system access and performed no external write.

## Architecture Analysis

`Documented design`: Matt City is a governed workflow system whose machine execution sits beneath canonical human work. Asana remains the human work, decision, status, and approval plane; Gas City plus Beads/Dolt are the machine orchestration and durable workflow-state plane; GitHub is the versioned implementation and artifact plane; the primary assistant packages context and returns results through its separately authorized identities.

`Inference`: The architecture solves a different problem from simply running multiple AI agents. Its main technical purpose is to preserve who requested work, who delegated it, which workflow was materialized, which configured agent target was intended, which concrete session claimed each attempt, which artifacts were produced, and which systems were or were not authorized. Parallelism is a secondary property.

`Documented design`: The system deliberately keeps the following identities separate: requester, delegator, task owner, Gas City controller, configured agent, runtime session, provider entitlement holder, external-system authenticated principal, reviewer, approver, telemetry collector, and telemetry viewer.

`Inference`: This separation is technically important because each identity has a different failure mode. A session may crash without invalidating the workflow state. A primary assistant may be authorized to update Asana while a local specialist is not. A future telemetry collector may observe spans without becoming workflow authority. Collapsing these would make attribution, replay, and blast-radius analysis unreliable.

## Component Responsibilities

| Component | Classification | Technical responsibility |
|---|---|---|
| Matthew | `Documented design` | Human requester and approver. Approval for this run is limited to local execution and artifacts. |
| Primary assistant | `Documented design` | Delegates bounded work, creates the local request package, later may return results through its own authorized identities. |
| Asana | `Documented design` | Canonical human work object, roadmap, decisions, approval state, and final human-facing status. |
| GitHub / repository | `Documented design` | Versioned formulas, agents, prompts, schemas, docs, request packages, and approved artifacts. No remote GitHub access was used by this agent. |
| Gas City | `Documented design` and `Observed runtime behavior` | Formula V2 graph materialization, route metadata, hooks, sessions, dependency readiness, retries, finalization, and control-dispatcher routing. |
| Beads/Dolt | `Documented design` and `Observed runtime behavior` | Durable machine work store for root, logical step, retry-controller, attempt, dependency, and outcome state. |
| Run operator | `Versioned implementation` and `Observed runtime behavior` | Qualified target `matt-city/matt.run-operator`; root `mc-5n9` records that routing target. |
| Specialist agents | `Versioned implementation` | Rig-scoped Codex agents for research, technical analysis, identity-security analysis, and skeptical review. |
| Runtime sessions | `Observed runtime behavior` | Concrete, replaceable executors such as `mcr-wisp-pzsryk`; sessions claim attempts but are not the canonical workflow state. |
| Codex provider | `Versioned implementation` and `Observed runtime behavior` | Local execution provider for the configured agents. It supplies runtime entitlement, not external-system credentials. |
| Phoenix / OpenTelemetry | `Planned capability` | Future metadata-first observability and trace correlation. Explicitly excluded from this baseline run. |

## Formula And Workflow Behavior

`Versioned implementation`: `city/formulas/research-topic.toml` defines formula `research-topic`, version `1`, with Formula V2 compiler requirements and ordered steps: `research`, `technical-analysis`, `identity-security-analysis`, `skeptical-review`, and `package-artifacts`.

`Versioned implementation`: Each executable step declares `metadata.gc.run_target`; the technical-analysis and package-artifacts steps target `matt-city/matt.technical-analyst`, research targets `matt-city/matt.researcher`, identity-security targets `matt-city/matt.identity-security-analyst`, and skeptical review targets `matt-city/matt.skeptic`.

`Versioned implementation`: Each specialist step has `max_attempts=2` and `on_exhausted=hard_fail`. This makes retries explicit workflow state rather than implicit session behavior.

`Observed runtime behavior`: The technical-analysis attempt did not become available until research `mc-u4d` closed with pass. That is consistent with the formula's `needs = ["research"]` dependency for `technical-analysis`.

`Inference`: The runtime graph separates at least four concepts that are easy to conflate:

- Human assignment or ownership: who is responsible for the broader work.
- Run target: the configured agent target intended by the formula.
- Retry-controller step: the logical step that owns retry policy and aggregate outcome.
- Attempt Bead: the concrete unit a session claims and executes.

`Inference`: This separation is the reason manual downstream routing is prohibited as a normal advancement mechanism. If a human manually routes generated steps just to keep the graph moving, the test no longer proves dependency readiness, configured target resolution, retry orchestration, or claim behavior.

## Operational Behavior

`Documented design`: The target lifecycle for this smoke test is `cook -> route -> claim -> execute -> package -> finalize`.

`Observed runtime behavior`: The available evidence supports partial progress through that lifecycle:

- Cook/materialize: workflow root `mc-5n9` exists with `gc.formula_contract=graph.v2`.
- Route: root metadata routes to `matt-city/matt.run-operator`; logical technical-analysis metadata routes to `matt-city/matt.technical-analyst`.
- Claim: this concrete session `mcr-wisp-pzsryk` claimed attempt `mc-exr`.
- Execute: this artifact is the technical-analysis execution output for `mc-exr`.
- Package/finalize: not proven by this artifact; later package and finalize Beads must supply that evidence.

`Observed runtime behavior`: The root finalization Bead `mc-5wu` exists and is open in the current root dependency snapshot. This is evidence that finalization is represented in the graph, not evidence that finalization has completed.

`Documented design`: The runtime is Debian WSL2 with native Docker, systemd-managed Gas City and Matt City services, the managed bd/Dolt store, and Codex-backed local sessions.

`Observed runtime behavior`: Current environment values place this session in city `/home/matt/matt-city-runtime`, rig `/home/matt/src/matt-city`, provider `codex`, and template `matt-city/matt.technical-analyst`.

`Documented design`: Current operational warnings include session-snapshot latency and managed-store transaction or storage churn warnings. These are warnings, not proof of workflow success or corruption.

`Observed runtime behavior`: The initial PATH mismatch in this session is an operational sharp edge: the runtime environment exposed `GC_BIN`, but `gc` and `bd` were not initially on PATH. The successful claim used `/home/matt/go/bin` in PATH. This did not block the claimed work after correction, but it should be recorded for operator reproducibility.

## Technical Dependencies

`Versioned implementation`: The configured agents are rig-scoped, use provider `codex`, and have narrow role descriptions.

`Versioned implementation`: The Debian WSL example config sets the workspace provider to `codex`, maps it to `builtin:codex`, sets Beads provider `bd`, registers rig `matt-city`, and imports the local `city` pack.

`Versioned implementation`: The runtime-alignment doctor checks for required configured targets, Formula V2 compiler requirements, `gc.run_target` metadata, and the claim/outcome protocol in generated prime output.

`Documented design`: The active durable state dependency is managed bd/Dolt. The earlier file-backed provider was temporary and is not the active Phase 1 model.

`Inference`: The main runtime dependency chain is:

1. Debian WSL and systemd keep local services available.
2. Gas City resolves city and rig configuration.
3. The `bd` provider stores workflow and dependency state in Dolt.
4. Formula V2 materializes root, logical, attempt, retry, and finalization Beads.
5. The dispatcher exposes claimable attempts through `gc hook --claim --json`.
6. Codex sessions execute bounded role prompts and produce local artifacts.
7. Later packaging records hashes and provenance.

`Inference`: Any failure in this chain should be diagnosed by preserving exact Bead IDs, session IDs, command output, and artifact hashes rather than by deleting or manually advancing state.

## Design Tradeoffs

`Inference`: Strong provenance creates operational overhead. Matt City must track Asana GIDs, request IDs, Bead IDs, workflow roots, logical retry Beads, attempt Beads, sessions, providers, artifacts, and hashes. The benefit is reconstructability after sessions terminate or retries occur.

`Inference`: Keeping local specialist agents credentialless reduces blast radius and preserves principal boundaries. The tradeoff is that result return, Asana updates, GitHub publication, and other external actions require a separately authorized principal after local workflow completion.

`Inference`: Managed bd/Dolt gives durable, queryable machine state but introduces store-health and latency concerns that do not exist in a simpler file-only prototype. The file-backed provider was useful as a temporary workaround, but it could not be the durable baseline for Phase 1.

`Inference`: Excluding Phoenix and OpenTelemetry from this baseline keeps the execution test focused on the core lifecycle. The tradeoff is weaker trace-level visibility during the baseline; that is acceptable only because provenance and Beads/Dolt are the authoritative evidence for this phase.

`Inference`: Formula V2 routing through `gc.run_target` makes intended executor selection explicit. The tradeoff is that configuration mistakes are more visible and more blocking than ad hoc human assignment, which is appropriate for a lifecycle proof.

## Capability Status

| Capability or claim | Status classification | Technical assessment |
|---|---|---|
| Fresh originating local request Bead exists | `Observed runtime behavior` | Snapshot identifies `mc-90t` for `phase-1-smoke-test-003`. |
| Fresh Formula V2 workflow root exists | `Observed runtime behavior` | `mc-5n9` records `gc.formula_contract=graph.v2`. |
| Research step completed | `Observed runtime behavior` | `mc-u4d` is closed with `gc.outcome=pass`; research artifact exists. |
| Technical-analysis step claimed by intended agent | `Observed runtime behavior` | `mc-exr` was claimed by `matt__technical-analyst-mcr-wisp-pzsryk` and targets `matt-city/matt.technical-analyst`. |
| Technical-analysis artifact produced | `Observed runtime behavior` | This file is the required output for `mc-exr`. |
| Identity-security analysis completed | Still unproven in this artifact | It depends on research and technical analysis and must be proven by a later claimed Bead. |
| Skeptical review completed | Still unproven in this artifact | It depends on research, technical analysis, and identity-security analysis. |
| Packaging and provenance completed | Still unproven in this artifact | `artifact-index.md` and `provenance.json` are later required outputs. |
| Workflow finalization completed | Still unproven in this artifact | Finalization Bead `mc-5wu` was observed open. |
| Retry behavior fully demonstrated | Partially observed | Retry controller metadata exists and research attempt passed; no natural retry/failure path has been demonstrated here. |
| Durable state survives session replacement | Still unproven in this artifact | Documented as a remaining Phase 1 gate. |
| Phoenix/OpenTelemetry instrumentation active | Excluded, not observed | Request explicitly forbids adding telemetry instrumentation to this baseline. |
| External writes by this agent | `Observed runtime behavior` | None performed. |

## Technical Unknowns

- `Still unproven`: Whether identity-security, skeptical-review, package-artifacts, and finalization steps will all be claimed by intended concrete sessions without manual downstream routing.
- `Still unproven`: Whether package provenance will capture every required step, spec, retry-controller, attempt, finalization Bead, artifact path, hash, provider, session, retry, and failure.
- `Still unproven`: Whether durable Bead state survives session replacement in this workflow, as opposed to being only a documented design and remaining validation gate.
- `Still unproven`: Whether retry behavior will be exercised by an actual failed attempt in this run, or remain only configured retry policy plus a successful first-attempt path.
- `Observed runtime behavior`: PATH/version ambiguity exists between the runtime `GC_BIN` and initially missing shell commands. Operator documentation should normalize this without rewriting baseline evidence.
- `Documented design`: Session-snapshot and store-status latency warnings are known but not root-caused here. They remain operational risks for diagnosis after the baseline evidence is preserved.
- `Observed runtime behavior`: The exact provider model name was not exposed in the permitted local session metadata available to this agent.
- `Inference`: The observed root metadata's `gc.input_convoy_id=mc-aba` should be treated as workflow input context until the packaging step records the complete launch chain.

## Premature Or Misleading Claims To Avoid

- `Inference`: Do not claim Matt City is production-ready or enterprise-compliant. Phase 1 explicitly excludes those claims.
- `Inference`: Do not claim the complete lifecycle has passed until package and finalization evidence exists.
- `Inference`: Do not claim external Asana, GitHub, Google Drive, WordPress, Slack, email, or calendar updates occurred in this local agent run.
- `Inference`: Do not claim Phoenix or OpenTelemetry validated this run. They are excluded from this baseline.
- `Inference`: Do not claim session or store latency is solved. It is documented as a warning and not diagnosed here.
- `Inference`: Do not claim every specialist avoided external writes until each specialist and package artifact records its own boundary. This artifact can only state that this technical-analysis agent avoided external access and writes.

## Limitations

- This is the technical-analysis artifact only. It does not replace `identity-security-analysis.md`, `skeptical-review.md`, `artifact-index.md`, or `provenance.json`.
- Evidence is intentionally local. No external service state was verified because the request prohibited browsing and connected-system access.
- The analysis relies on the approved research artifact and approved local sources. It does not silently substitute unapproved sources.
- Current workflow terminal state is not established here; root `mc-5n9` was still in progress when this artifact was produced.
- This artifact records the PATH mismatch as an operational observation but does not modify shell profiles, runtime services, or supervisor configuration.

## Unresolved Questions

- Which later concrete sessions will claim identity-security analysis, skeptical review, package-artifacts, and finalization?
- Will package-artifacts record complete provenance for `mc-90t`, `mc-aba`, `mc-5n9`, `mc-u4d`, `mc-3i8`, `mc-7bt`, `mc-exr`, `mc-5wu`, and downstream specialist Beads?
- Will finalization close the root workflow successfully, or will the run end as a stable, fully evidenced failure?
- Will any retry be naturally exercised, or will retry behavior remain configured but not triggered?
- Can PATH and executable-version provenance be normalized for future sessions without changing this run's evidence?
- What, if any, follow-up diagnosis is needed for session-snapshot latency and managed-store churn after the baseline run is complete?
