# Phase 1 Scope

## Objective

Build one trustworthy, Asana-linked research workflow in Debian 13 WSL2 using Gas City as the orchestration layer and Beads/Dolt as the durable machine-state layer.

## In scope

- one canonical Asana project and originating task model
- one Gas City city and one registered Matt City rig
- one local run operator
- four bounded specialist agents
- one `research-topic` Formula V2 workflow
- managed bd/Dolt workflow state
- structured Markdown, YAML, and JSON artifacts
- explicit provenance for every meaningful output
- results returned or linked to the originating Asana task
- human review before downstream use
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

## Success criteria

Given an Asana task containing a topic, approved sources, questions, constraints, and acceptance criteria, Matt City produces:

1. a bounded context package
2. a source and findings package
3. a technical analysis
4. an identity and security analysis
5. a skeptical review
6. a packaged artifact set
7. a provenance record referencing the Asana project and task
8. durable Bead state across the workflow lifecycle
9. a visible result or artifact link on the originating Asana task

The workflow must stop for Matthew before consequential downstream use.

## Runtime acceptance

Phase 1 is complete only after a fresh workflow demonstrates:

- a unique request ID and workflow root
- Formula V2 materialization
- correct route and run target
- a concrete session claim
- dependency-respecting specialist execution
- terminal step and workflow state
- durable state that survives session replacement
- real workflow, Bead, event, agent, and session identifiers
- artifact paths and hashes
- provenance linked to the originating Asana task and Git commit
- no unauthorized external write
- result return through the separately authorized assistant identity

A healthy supervisor, passing doctor output, or successfully cooked formula is necessary but not sufficient.

## Observability sequence

Phoenix is a committed follow-on component, not a competing Phase 1 track.

After the bd-backed baseline:

1. record the Phoenix architecture decision and privacy policy
2. define the metadata-first trace and correlation schema
3. instrument a fresh workflow
4. prove workflow execution continues when Phoenix is unavailable
5. add deterministic evaluations
6. document retention, access, health, and maintenance

## Authoritative implementation references

- Matt City Asana project: https://app.asana.com/1/1204112251101459/project/1216444827581484
- current smoke-test task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216641220635093
- Phoenix implementation task: https://app.asana.com/1/1204112251101459/project/1216444827581484/task/1216732585597325
- Gas City documentation: https://docs.gascity.com/
- Gas City repository: https://github.com/gastownhall/gascity/
