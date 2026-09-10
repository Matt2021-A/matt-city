# Phase 1 Scope

## Objective

Establish a trustworthy, Asana-linked local execution baseline in Debian WSL2 using Gas City as the orchestration layer and Beads/Dolt as the durable machine-state layer, then prove that the same operating contracts hold for the first production editorial workflow.

## Current status

Smoke Test #3 completed the original research-workflow baseline for the tested path. It demonstrated a fresh bd-backed Formula V2 workflow through route, concrete claim, specialist execution, artifact packaging, provenance, and finalization.

Phase 1 remains active because the production editorial path, session-replacement behavior, regression coverage, operator documentation, and post-reboot runtime state are not yet complete.

The current gate is recovery of `building-matt-city-blog-001` under the production workflow stabilization task, beginning with read-only reconciliation of the local runtime after the unapproved August 23, 2026 Windows Update reboot.

## In scope

- one canonical Asana project and originating task model
- one Gas City city and registered Matt City rig
- local run-operator and bounded specialist agents
- `research-topic` Formula V2 baseline
- `draft-technical-blog` production acceptance path
- managed bd/Dolt workflow state
- structured Markdown, YAML, and JSON artifacts
- explicit provenance for every meaningful output
- results returned or linked to the originating Asana task by the separately authorized assistant identity
- human review before downstream use
- durable state across replaceable sessions
- regression and recovery evidence
- a documented non-blocking observability boundary for later Phoenix integration

## Out of scope

- autonomous publishing or messaging
- direct Asana, GitHub, email, calendar, or WordPress credentials for local agents
- shared ambient credentials
- impersonation of Matthew or the primary assistant
- bulk ingestion of unrelated private work or conversation history
- treating Phoenix as a workflow router, approval system, or provenance authority
- prompt, tool-output, source-body, credential, secret, or personal-data capture in the first telemetry schema
- production availability or enterprise compliance claims

## Work boundary

Asana is in scope from the beginning, but local Gas City agents do not receive Asana access.

```text
Asana task
  -> primary assistant creates a structured request and bounded context package
  -> Gas City materializes bd-backed work
  -> run operator and specialist agents claim and perform local work
  -> artifacts and provenance are packaged for Git
  -> primary assistant returns results to Asana using its own identity
  -> Matthew reviews and approves downstream use
```

Identity, authority, credentials, and connected-system access do not transfer through delegation.

## Baseline success criteria

The research baseline is demonstrated when an Asana-linked request produces:

1. a bounded context package
2. a source and findings package
3. a technical analysis
4. an identity and security analysis
5. a skeptical review
6. a packaged artifact set
7. a provenance record referencing the Asana project and task
8. durable Bead state across the workflow lifecycle
9. a visible result or artifact link returned through the authorized assistant identity

Smoke Test #3 satisfied the tested baseline lifecycle. Historical Smoke Tests #1 and #2 remain evidence and must not be substituted for the completed #3 result.

## Remaining Phase 1 acceptance

Phase 1 as a project phase exits only after the baseline is operationally repeatable and the production path is diagnosable and usable.

Remaining requirements include:

- fresh post-reboot runtime and local-Git reconciliation
- stable `draft-technical-blog` route/claim/session behavior for `building-matt-city-blog-001`
- terminal production workflow state or a stable, fully evidenced failure
- durable state across session replacement
- regression and acceptance coverage
- real workflow, Bead, event, agent, and session identifiers captured together
- production artifact paths and hashes
- production provenance linked to the originating Asana task and Git state
- operator documentation aligned to observed behavior
- no unauthorized local-agent external write

A healthy supervisor, passing doctor output, successful cook, routed Bead, or active session is not by itself proof of those outcomes.

## Post-reboot freshness rule

The Debian WSL runtime has not been directly revalidated since the August 23 reboot. Current service state, installed versions, session state, workflow/Bead state, claimability, and local worktree state are unknown until a fresh read-only capture is performed.

Do not launch a duplicate workflow, clean untracked state, force-route work, manually claim a Bead, or perform destructive store repair before that capture.

## Observability sequence

Phoenix is a committed follow-on component, not a competing Phase 1 track.

After the execution and production baseline is stable:

1. preserve the uninstrumented baseline
2. confirm the Phoenix architecture decision and privacy policy
3. define the metadata-first trace and correlation schema
4. instrument a fresh workflow
5. prove workflow execution continues when Phoenix is unavailable
6. add deterministic evaluations
7. document retention, access, health, and maintenance

## Authoritative implementation references

- Matt City Asana project: https://app.asana.com/1/1204112251101459/project/1216444827581484
- Matt City roadmap task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216740612789172
- current production workflow stabilization task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216777414350711
- completed Smoke Test #3 baseline task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216740708489953
- production article task: https://app.asana.com/1/1204112251101459/project/1213500168987836/task/1216445335991016
- Phoenix implementation task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216732585597325
- Gas City documentation: https://docs.gascity.com/
- Gas City repository: https://github.com/gastownhall/gascity/
