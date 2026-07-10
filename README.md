# Matt City

Matt City is a personal, identity-aware multi-agent workflow lab built around durable work, bounded context, explicit permissions, and reconstructable attribution.

## Phase 1 goal

Prove one read-only research workflow that can:

1. Accept a topic, source URLs, and questions.
2. Route work across bounded specialist agents.
3. Produce structured research, technical analysis, identity analysis, and skeptical review.
4. Preserve provenance for every artifact.
5. Stop for Matthew before any external action.

## Phase 1 constraints

- No autonomous publishing.
- No email, calendar, Asana, or external write access.
- No inherited credentials between agents.
- No agent is treated as Matthew or as the primary ChatGPT assistant.
- Generated runtime data and secrets stay out of Git.

## Repository map

- `docs/` architecture, scope, and identity model
- `city/agents/` bounded agent definitions
- `city/formulas/` workflow definitions
- `schemas/` artifact and provenance contracts
- `policies/` capabilities and approval rules
- `examples/` safe test inputs

## Identity principle

Agents may inherit tasks. They do not inherit another principal's identity, authority, connections, or permissions.
