# Skeptical Review: Phase 1 Smoke Test #3

## Artifact Metadata

| Field | Value |
|---|---|
| Artifact | `skeptical-review.md` |
| Request ID | `phase-1-smoke-test-003` |
| Canonical Asana project GID | `1216444827581484` |
| Canonical Asana task GID | `1216740708489953` |
| Originating blog project GID | `1213500168987836` |
| Originating blog task GID | `1216445335991016` |
| Originating local request Bead | `mc-90t` |
| Workflow input convoy | `mc-aba` |
| Workflow root Bead | `mc-5n9` |
| Logical step Bead | `mc-xxq` |
| Claimed Bead ID | `mc-3b9` |
| Upstream research logical Bead | `mc-u4d` |
| Upstream technical-analysis logical Bead | `mc-7bt` |
| Upstream identity-security logical Bead | `mc-i3f` |
| Formula | `research-topic` |
| Formula version | `1` |
| Step | `skeptical-review` |
| Attempt | `1` |
| Run target | `matt-city/matt.skeptic` |
| Contributing agent | `matt-city/matt.skeptic-1` |
| Concrete session ID | `mcr-wisp-dbouve` |
| Concrete session name | `matt__skeptic-mcr-wisp-dbouve` |
| Provider | `codex` |
| Runtime template | `matt-city/matt.skeptic` |
| Runtime city | `/home/matt/matt-city-runtime` |
| Rig root | `/home/matt/src/matt-city` |
| Git branch observed | `fix/restore-bd-provider` |
| Git commit observed | `8c0da8d3903bcc91b2f7f056a10ebb44579dd69a` |
| Gas City version observed through `GC_BIN` | `1.3.5` |
| PATH-local Gas City version used for recovered hook commands | `1.3.4` |
| Beads version observed | `1.1.0 (8e4e59d39)` |
| Dolt version observed | `2.2.1` |
| Approval state | Local research, analysis, packaging, and provenance only |
| External systems accessed by this agent | None |
| External systems modified by this agent | None |
| Telemetry enabled state for this artifact | Disabled; no Phoenix, OpenTelemetry exporter, evaluation hook, or dashboard dependency was added or used |

## Source Classifications

Material claims use the request-defined classifications:

- `Observed runtime behavior`: facts from this session, the claimed Bead, local command output, local environment, and local request-package snapshots.
- `Versioned implementation`: facts from repository formulas, agent definitions, prompts, scripts, and examples.
- `Documented design`: facts from approved repository documentation and the approved request package.
- `Upstream documentation or source analysis`: facts from approved local upstream-alignment summaries only.
- `Inference`: bounded conclusions drawn from approved evidence.
- `Planned capability`: roadmap or ADR intent outside this baseline run.
- `Historical failure`: retained evidence from prior smoke tests.
- `Temporary workaround`: documented temporary state that is not the durable target model.

## Inputs Used

| Input | SHA-256 or identifier | Use |
|---|---|---|
| `requests/phase-1-smoke-test-003/request.md` | `fa24ad02163d29fba148f3656956ad39aefc1600b96fd36027409add6c4221a8` | Request identity, boundaries, required outputs, acceptance criteria |
| `requests/phase-1-smoke-test-003/asana-context.md` | `7f3a219b29651e4d954790df61d9516795a4ab7751908bd584e4d92b623fcd77` | Context snapshot, historical failures, runtime baseline, approval boundary |
| `requests/phase-1-smoke-test-003/artifacts/research-findings.md` | `03b24acdaa8293cdd04ae284a673f6b6e954dcf020ec9dd4aba3846ec0c690d5` | Upstream source inventory and normalized findings |
| `requests/phase-1-smoke-test-003/artifacts/technical-analysis.md` | `0b06cb3787f95dcd6153123460e7348644ed9f1da65ef3c9a820ea026ca7855d` | Upstream architecture, workflow, and operational analysis |
| `requests/phase-1-smoke-test-003/artifacts/identity-security-analysis.md` | `3a5e4cc5eb00ea0826d8aa10429fc11b429bea458473e97fc571536dbbd9c869` | Upstream identity, authorization, provenance, and blast-radius analysis |
| `requests/phase-1-smoke-test-003/originating-bead-id.txt` | `mc-90t` | Originating local request Bead identifier |
| `requests/phase-1-smoke-test-003/source-bead-after-launch.json` | request-package snapshot | Originating local request Bead metadata |
| `requests/phase-1-smoke-test-003/workflow-root-after-launch.json` | request-package snapshot | Workflow root and finalization snapshot after launch |
| `city/formulas/research-topic.toml` | `483e741d859a766808643c9475159b0c8185167fc58e89c0e299a089df0bb312` | Formula steps, dependencies, retry policy, run targets |
| `city/agents/skeptic/agent.toml` | `6dfa92bbc94a3f1313a8138d889c4df542994d9bb99144b401276d1f51e372fe` | Skeptic agent scope and provider |
| `city/agents/skeptic/prompt.template.md` | `4430ccc8f109a8d0da2e7e8ef03fcaaae228bcadf23e3bc2d209eeb52f3ec67c` | Claim, artifact, and close contract |
| `bd show "mc-3b9" --json` | current local Bead read | Claimed skeptical-review attempt metadata and dependencies |
| Local environment and version commands | current local command output | Session identity, provider, runtime paths, executable versions, Git branch and commit |

No web browsing, Asana connector, GitHub credential, Drive, email, calendar, contacts, Slack, WordPress, publishing, commit, push, or external write was used.

## Observed Facts

- `Observed runtime behavior`: The claimed skeptical-review attempt is `mc-3b9`, assigned to concrete session `matt__skeptic-mcr-wisp-dbouve`, with `gc.attempt=1`, `gc.logical_bead_id=mc-xxq`, `gc.root_bead_id=mc-5n9`, `gc.run_target=matt-city/matt.skeptic`, and request ID `phase-1-smoke-test-003`.
- `Observed runtime behavior`: This session has `GC_SESSION_ID=mcr-wisp-dbouve`, `GC_AGENT=matt-city/matt.skeptic-1`, `GC_TEMPLATE=matt-city/matt.skeptic`, `GC_PROVIDER=codex`, `GC_BEADS=bd`, `GC_CITY=/home/matt/matt-city-runtime`, and `GC_RIG_ROOT=/home/matt/src/matt-city`.
- `Observed runtime behavior`: The claimed Bead dependency snapshot shows research `mc-u4d`, technical-analysis `mc-7bt`, and identity-security `mc-i3f` closed with `gc.outcome=pass` before this attempt was claimed.
- `Observed runtime behavior`: The claimed Bead dependency snapshot shows workflow root `mc-5n9` still `in_progress` during skeptical review. Therefore this artifact cannot itself prove package-artifacts or workflow finalization.
- `Observed runtime behavior`: The mandatory initial claim command failed once because `gc` was not on this shell's initial `PATH`. The session then ran `gc prime` and retried with `/home/matt/go/bin` prepended to `PATH`.
- `Observed runtime behavior`: `GC_BIN` points to Gas City `1.3.5`, while the PATH-local `gc` used for recovered hook commands reports `1.3.4`; `bd` reports `1.1.0`, Dolt reports `2.2.1`, and Git reports branch `fix/restore-bd-provider` at commit `8c0da8d3903bcc91b2f7f056a10ebb44579dd69a`.

## Skeptical Findings

### 1. Complete lifecycle success remains unproven at this step

- `Observed runtime behavior`: The upstream artifacts correctly avoid claiming final package or workflow completion. The root is still in progress from this step's claimed dependency snapshot.
- `Inference`: Any final result that says Smoke Test #3 has proven `cook -> route -> claim -> execute -> package -> finalize` before `artifact-index.md`, `provenance.json`, the package attempt, the finalization Bead, and the root outcome are recorded would be premature.
- `Required verification`: The package step must record terminal evidence for package-artifacts and workflow finalization, not merely the existence of the first four Markdown artifacts.

### 2. Retry behavior is configured, not naturally exercised

- `Versioned implementation`: The formula gives each specialist step `max_attempts=2` and `on_exhausted=hard_fail`.
- `Observed runtime behavior`: The upstream logical Beads visible to this attempt closed with `gc.outcome=pass` on attempt `1`.
- `Inference`: The run supports the weaker claim "retry policy is represented and successful first attempts were aggregated." It does not support "retry execution was validated" unless a failed attempt and subsequent retry are later recorded.
- `Required verification`: Provenance should explicitly say whether any retry actually occurred. If none occurred, that absence should be preserved as successful no-retry execution, not converted into proof of the retry path.

### 3. No-manual-routing evidence is still mostly indirect

- `Documented design`: The request prohibits `--force`, manual downstream routing, manual claims from Matthew's ordinary shell, and pre-created specialist sessions.
- `Observed runtime behavior`: The artifacts show intended run targets and concrete claimed sessions for research, technical-analysis, identity-security, and skeptical-review.
- `Inference`: Those observations are consistent with normal Formula V2 dispatch, but they are not by themselves a complete audit that no human manually advanced a downstream Bead.
- `Required verification`: The final provenance should preserve launch output, operator evidence, attempt claim evidence, and any available route/control-dispatcher evidence that supports the no-`--force` and no-manual-downstream-routing claim. If the package step cannot prove this fully, it should label the claim as bounded by available local evidence.

### 4. Freshness claims need exact ID inventories

- `Observed runtime behavior`: This run uses current IDs `mc-90t`, `mc-aba`, `mc-5n9`, `mc-u4d`, `mc-3i8`, `mc-7bt`, `mc-exr`, `mc-i3f`, `mc-g0a`, `mc-xxq`, and `mc-3b9`, while the request context lists prior smoke-test roots `gc-465` and `gc-38022`.
- `Inference`: The evidence supports freshness against the named prior smoke-test roots and known historical IDs. It is not an exhaustive proof that no other old session or step identity was reused unless the final package enumerates every root, step, retry-controller, attempt, package, finalization, and session ID used in this run.
- `Required verification`: `provenance.json` must include a complete ID inventory and distinguish originating request Bead, input convoy, workflow root, logical retry-controller Beads, concrete attempts, finalization Bead, and concrete sessions.

### 5. Executable-version provenance is not clean

- `Observed runtime behavior`: This session's first mandatory claim attempt failed because `gc` was not on the initial `PATH`. Recovery used PATH-local `gc` `1.3.4`, while `GC_BIN` reports Gas City `1.3.5`.
- `Inference`: This does not show workflow corruption or unauthorized access, but it weakens any simple statement that "Gas City 1.3.5 executed every observed command." Different sessions may have used different command-resolution paths.
- `Required verification`: The package step should record both `GC_BIN` and `PATH` command versions, and should avoid attributing all `gc` command output to a single binary unless the exact binary used for each command is known.

### 6. External no-access and no-write claims are session-scoped

- `Observed runtime behavior`: This skeptic session did not browse or invoke connected-system tools, and the upstream artifacts report the same boundary for their own sessions.
- `Inference`: The strongest supported claim is per-agent self-report plus local execution constraints. It is weaker than an independent network, credential, shell-history, or audit-log proof that no external access occurred anywhere on the host.
- `Required verification`: The final package should preserve per-agent external-access declarations and classify the overall no-external-access claim as bounded by local-agent evidence unless stronger audit evidence is explicitly included.

### 7. Root-level session metadata is not sufficient attribution

- `Observed runtime behavior`: The root metadata observed by upstream artifacts and this session can reflect whichever session most recently advanced or inspected the workflow. It is not a reliable single executor identity for all work.
- `Inference`: The attempt Beads and artifacts, not the root's `gc.session_name`, are the right attribution source for each specialist output.
- `Required verification`: Final provenance must not collapse all execution onto the root session name. It must preserve attempt-level assignees and concrete session IDs.

### 8. Managed bd/Dolt is active, but durability claims must remain bounded

- `Observed runtime behavior`: The claimed Bead and upstream dependencies are readable through the `bd` provider, and the observed Dolt version is `2.2.1`.
- `Inference`: This supports "managed bd/Dolt is active and usable for this workflow." It does not prove all migration concerns are closed, all store-health warnings are solved, or durable state survives arbitrary session replacement.
- `Required verification`: The final result should preserve known session-snapshot latency, managed-store churn warnings, and any PATH/version ambiguity rather than treating a passing run as operational cleanup.

### 9. Artifact hashes must be recomputed after final writes

- `Observed runtime behavior`: The current identity-security artifact hash is `3a5e4cc5eb00ea0826d8aa10429fc11b429bea458473e97fc571536dbbd9c869`, and this skeptical-review artifact did not exist before this step.
- `Inference`: Upstream input hashes are useful for local provenance, but the final package cannot rely on stale pre-package hash inventories.
- `Required verification`: `artifact-index.md` and `provenance.json` must compute final SHA-256 hashes after all required artifacts exist, including this file and the package artifacts themselves where applicable.

## Alternative Interpretations

- `Inference`: The observed sequence may reflect correct Formula V2 dependency readiness, or it may only reflect that upstream logical Beads were already closed when each later session claimed work. The final package needs route and claim evidence to support the stronger lifecycle interpretation.
- `Inference`: The PATH and `GC_BIN` split may be harmless local shell drift, but it could also make runtime reproduction difficult. Treat it as provenance ambiguity, not as success proof or failure proof.
- `Inference`: Session-snapshot and managed-store latency warnings may explain delayed or changing status observations. They should not be used alone to infer corruption, completion, or failed finalization.
- `Inference`: The absence of Phoenix/OpenTelemetry evidence is intended for Phase 1. It is not a monitoring gap to fix during this baseline, and it cannot be used as validation evidence.

## Security Blind Spots

- `Inference`: Local agents may run in a host that contains unrelated credentials or tools. The security boundary here is delegated authority and tool behavior, not a proof that such credentials are absent from the machine.
- `Inference`: A broad filesystem or Bead search would risk context overexposure. This session used request-scoped artifact reads, the claimed Bead read, and limited executable-path recovery after `gc` was initially unavailable; those path-recovery commands should not be treated as substantive evidence about the request.
- `Inference`: Closing a local Bead with `gc.outcome=pass` advances machine workflow state. It is not human approval, publication authorization, Asana update authorization, or proof that an external principal reviewed the output.
- `Inference`: Future telemetry must remain metadata-first. Capturing prompt bodies, tool bodies, source bodies, credentials, secrets, or connected-system content would violate the current boundary even if technically useful.

## Limitations

- This artifact challenges the already-produced research, technical, and identity-security outputs. It does not replace the package-artifacts step, `artifact-index.md`, `provenance.json`, or workflow finalization.
- No external source verification was performed because browsing and connected systems are explicitly prohibited.
- This review did not inspect broad Bead lists, unrelated sessions, mail, external services, or remote repositories.
- This review cannot independently prove no manual routing occurred; it can only identify the evidence the final package must preserve.
- The exact provider model name was not exposed in permitted local metadata.
- Runtime path recovery was required because the initial shell lacked `gc` on `PATH`; this is an operational provenance issue that should remain visible.

## Unresolved Questions

- Will package-artifacts be claimed by the intended concrete `matt-city/matt.technical-analyst` session without manual downstream routing?
- Will `artifact-index.md` and `provenance.json` preserve every required root, step, spec, retry-controller, attempt, finalization, agent, and session identifier?
- Will the finalization Bead close workflow root `mc-5n9` successfully, or will the run end as a stable, fully evidenced failure?
- Will final provenance record that no natural retry was exercised if all attempts pass on attempt `1`?
- Will package provenance distinguish `GC_BIN` Gas City `1.3.5` from PATH-local Gas City `1.3.4`?
- Will the final return boundary remain local, with no Asana, GitHub, Drive, mail, calendar, Slack, WordPress, publishing, or telemetry writes by local agents?
