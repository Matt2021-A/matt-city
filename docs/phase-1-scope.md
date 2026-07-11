# Phase 1 Scope

## Objective

Build one trustworthy, Asana-linked research workflow in Ubuntu WSL using Gas City as the machine orchestration layer.

## In scope

- One canonical Asana project and originating task model
- One Gas City configuration
- One research rig
- Four bounded specialist agents
- One `research-topic` formula
- Structured Markdown, YAML, and JSON artifacts
- Explicit provenance for every output
- Results returned or linked to the originating Asana task
- Human review before any downstream use

## Out of scope

- Autonomous publishing or messaging
- Direct Asana, GitHub, email, calendar, or WordPress credentials for local agents
- Shared ambient credentials
- Impersonation of Matthew or the primary ChatGPT assistant
- Bulk ingestion of unrelated private work or conversation history
- Production availability or enterprise compliance claims

## Work boundary

Asana is in scope from the beginning, but local Gas City agents do not receive Asana access.

The boundary is:

```text
Asana task
  -> primary assistant creates structured request
  -> Gas City agents perform local bounded work
  -> primary assistant returns results to Asana using its own identity
```

## Success criteria

Given an Asana task containing a topic, approved source URLs, questions, and acceptance criteria, Matt City produces:

1. A bounded context package
2. A source and findings package
3. A technical analysis
4. An identity and security analysis
5. A skeptical review
6. A provenance record referencing the Asana project and task
7. A visible result or artifact link on the originating Asana task

The workflow must stop for Matthew after producing those artifacts.

## Authoritative implementation references

- Gas City official documentation: https://docs.gastownhall.ai/
- Gas City repository: https://github.com/gastownhall/gascity/
- Matt City Asana project: https://app.asana.com/1/1204112251101459/project/1216444827581484
