# Phase 1 Scope

## Objective

Build one trustworthy, read-only research workflow in Ubuntu WSL using Gas City as the orchestration layer.

## In scope

- One city configuration
- One research rig
- Four bounded specialist agents
- One `research-topic` formula
- Structured Markdown, YAML, and JSON artifacts
- Explicit provenance for every output
- Human review before any downstream use

## Out of scope

- Autonomous publishing or messaging
- GitHub, Asana, email, calendar, or WordPress writes
- Shared ambient credentials
- Impersonation of Matthew or the primary ChatGPT assistant
- Bulk ingestion of private conversation history
- Production availability or enterprise compliance claims

## Success criteria

Given a topic, approved source URLs, and a question set, Matt City produces:

1. A source and findings package
2. A technical analysis
3. An identity and security analysis
4. A skeptical review
5. A provenance record

The workflow must stop for Matthew after producing those artifacts.
