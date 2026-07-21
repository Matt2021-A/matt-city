# Production Editorial Request: Building Matt City

## Request identity

- Request ID: `building-matt-city-blog-001`
- Parent Asana task: `1216445335991016`
- Target Google Doc ID: `1A10eeY7sQoYazqNxw8SY0mve1hjqQ14UufLORkXrJXM`
- Repository: `Matt2021-A/matt-city`
- Working branch: `fix/restore-bd-provider`
- Requester and final approver: Matthew Romero
- Source-ingestion principal: Primary assistant using separately authorized connectors and public-web access
- Local editorial execution principal: Matt City specialist agents using only the prepared source package

## Purpose

Turn the real Asana assignment, relevant external sources, Matt City repository context, Smoke Test #3 substantive artifacts, and approved Matt writing samples into a useful TechThatMattRs article.

This is a production editorial request, not another infrastructure smoke test.

The first success criterion is useful editorial direction. The workflow must not proceed into a long drafting run until Matthew reviews the editorial brief and story map.

## Article objective

Write an operator-first architecture field note explaining why Matt City exists, what it is intended to solve, how it separates human-visible work from machine execution, and why identity, context, authority, credentials, attribution, and approval cannot be collapsed into the statement, "the AI did it."

The article must also explain what the first real workflow proved and what it did not prove. A technically passing workflow that produces editorially unhelpful output is part of the story, not something to conceal.

## Primary reader

IT, security, platform, identity, DevOps, technical marketing, and AI-infrastructure practitioners who understand automation and are now trying to make agent workflows durable, reviewable, and governable.

The article should remain understandable to a technical reader who has never used Gas City, Beads, Dolt, or Matt City.

## Core thesis

The hard part of multi-agent work is not getting agents to communicate. It is preserving the boundaries between human ownership, machine execution, context, credentials, evidence, and approval while turning recurring work into a durable workflow.

## Required editorial inputs

### Canonical assignment context

- Parent Asana blog task `1216445335991016`
- Related Matt City project `1216444827581484`
- Target Google Doc `1A10eeY7sQoYazqNxw8SY0mve1hjqQ14UufLORkXrJXM`

### Existing Matt City research artifacts

Use as technical and factual source material:

- `requests/phase-1-smoke-test-003/artifacts/research-findings.md`
- `requests/phase-1-smoke-test-003/artifacts/technical-analysis.md`
- `requests/phase-1-smoke-test-003/artifacts/identity-security-analysis.md`
- `requests/phase-1-smoke-test-003/artifacts/skeptical-review.md`

Use only for audit or fact checking, not as writing models:

- `requests/phase-1-smoke-test-003/artifacts/artifact-index.md`
- `requests/phase-1-smoke-test-003/artifacts/provenance.json`

### Matt City repository context

Relevant sources include:

- `README.md`
- `docs/architecture.md`
- `docs/identity-model.md`
- `docs/workflow-routing.md`
- `docs/phase-1-scope.md`
- `docs/runtime-validation.md`
- `docs/gas-city-alignment.md`
- `city/formulas/research-topic.toml`

### External sources

- Gas City official documentation
- Gas City GitHub repository
- Steve Yegge, "Welcome to Gas City"
- Additional primary Gas City documentation required to explain cities, rigs, agents, formulas, Beads, sessions, routing, and workflow state accurately

### Matt voice references

Use selected TechThatMattRs posts as voice and structural references, especially writing that:

- begins with a concrete operational failure mode
- distinguishes the real problem from the obvious surface explanation
- uses short declarative transitions without becoming choppy
- explains architecture through consequences for operators
- labels uncertainty and avoids pretending early evidence proves production readiness
- ends with a practical standard for what success or control should look like

Voice references include:

- "Agent Inventory and the Agent Register"
- "The Workflow Got Faster. The Record Got Fuzzier."
- "RAG Is Data Access: Retrieval Authorization Is the Control"
- "TechThatMattRs: Week Four – What Shipped, What Slipped, and What the Workflow Revealed"

## Source-use rules

- Distinguish observed behavior, versioned implementation, documented intent, external documentation, inference, and planned capability.
- Do not make every paragraph carry an evidence label. Preserve the distinction in the claim map and reviews, then write readable prose.
- Prefer primary sources for product and implementation claims.
- Treat the Smoke Test #3 artifacts as source material, not as the article structure.
- Treat operational provenance as background evidence, not default drafting context.
- Do not state that Matt City is production-ready, autonomous, externally integrated, enterprise-compliant, or a validated content-production system.
- Do state that Smoke Test #3 proved the core local orchestration lifecycle and exposed the missing editorial and source-ingestion layers.

## Editorial workflow

1. Ingest and normalize the approved assignment and sources.
2. Select only the source material relevant to this article.
3. Produce `artifacts/editorial-brief.md`.
4. Produce `artifacts/story-map.md`.
5. Stop for Matthew's review.
6. After explicit approval, produce `artifacts/outline.md` and a complete `artifacts/draft-v1.md`.
7. Run targeted technical, identity, skeptical, and Matt Voice reviews against that draft.
8. Produce `artifacts/draft-final.md`.
9. Stop for Matthew's publishing approval.

## First human checkpoint

The first checkpoint contains only:

- `request.md`
- `artifacts/editorial-brief.md`
- `artifacts/story-map.md`

Matthew must be able to recognize a real article direction before drafting begins.

## Drafting outputs after approval

- `artifacts/outline.md`
- `artifacts/draft-v1.md`
- `artifacts/technical-review.md`
- `artifacts/identity-review.md`
- `artifacts/skeptical-review.md`
- `artifacts/voice-review.md`
- `artifacts/draft-final.md`

## Acceptance criteria

The editorial stage succeeds only if:

1. The brief names a specific reader, problem, thesis, opening tension, evidence set, and intended ending.
2. The story map forms a narrative rather than mirroring the component architecture.
3. The article direction incorporates both the intended Matt City model and what happened during the actual build and smoke tests.
4. Existing research artifacts are reused rather than regenerated without cause.
5. External sources and repository sources are selected according to their editorial purpose.
6. The article can explain Gas City and Matt City without requiring the reader to know either system already.
7. Operational metadata stays behind the curtain unless it directly advances the story.
8. The first complete draft is something Matthew can edit, not reconstruct.
9. The final prose sounds like an operator explaining what happened, not a vendor promoting an agent platform.
10. No Google Doc write, Asana update, WordPress action, social post, or publication occurs without Matthew's explicit approval.

## Current authorization

Authorized now:

- Read the canonical Asana task and linked project context.
- Read the target Google Doc to determine whether prior draft content exists.
- Read public web sources linked by the task and additional directly relevant primary documentation.
- Read the named GitHub repository files and Smoke Test #3 artifacts.
- Read selected public TechThatMattRs writing samples for voice guidance.
- Create this request and the first-checkpoint Markdown artifacts in the existing working branch.

Not authorized now:

- Launch the Matt City production editorial workflow.
- Write to the Google Doc.
- Modify Asana.
- Merge the working branch.
- Publish or distribute the article.
- Add Phoenix or other telemetry work.
