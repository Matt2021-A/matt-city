# Prior Matt City Run Evidence

## Scope

This evidence package applies only to request `building-matt-city-blog-001`.

The article is about the design, construction, testing, and operation of Matt City. Previous runs, including failed and superseded attempts, are therefore relevant source material.

Other Matt City requests must not inherit prior-run artifacts unless their request explicitly opts into them.

## Required research behavior

The research agent must review prior Matt City runs before extending the article research.

Use the material to identify:

- implemented architecture and operating boundaries
- observed agent and workflow behavior
- technical decisions and tradeoffs
- failed assumptions and failure modes
- differences between intended design and observed execution
- changes made after smoke tests and failed runs
- useful technical, identity-security, and skeptical-review findings

Do not treat all prior artifacts as equally authoritative.

Preserve distinctions among:

- observed runtime behavior
- versioned implementation
- documented design
- intended or planned behavior
- inference
- temporary workaround
- failed-run evidence
- superseded historical state

## Reading order

### 1. Existing article direction

- `../artifacts/story-map.md`
- `../artifacts/editorial-brief.md`
- `../request.md`

### 2. Prior narrative and analysis artifacts

Review all relevant packages matching:

- `requests/phase-1-smoke-test*`

Begin with the substantial artifacts from Smoke Test 003:

- `requests/phase-1-smoke-test-003/artifacts/research-findings.md`
- `requests/phase-1-smoke-test-003/artifacts/technical-analysis.md`
- `requests/phase-1-smoke-test-003/artifacts/identity-security-analysis.md`
- `requests/phase-1-smoke-test-003/artifacts/skeptical-review.md`
- `requests/phase-1-smoke-test-003/artifacts/artifact-index.md`
- `requests/phase-1-smoke-test-003/artifacts/provenance.json`
- `requests/phase-1-smoke-test-003/asana-context.md`

### 3. Current failed or stalled article run

- `failure-summary-mc-m0q.md`
- `mc-m0q-root.json`
- `../launch-result.jsonl`

### 4. Raw diagnostics

Workflow-node, root, session, routing, and launch snapshots may be used to verify chronology or implementation details.

Do not feed every raw JSON file into the article narrative. Extract only findings that materially improve accuracy, technical depth, or the explanation of a failure.

## Output expectation

The research agent should produce a concise prior-run synthesis that states:

1. what was attempted
2. what worked
3. what failed
4. what was learned
5. which findings should alter the article
6. which findings are historical and must not be described as current behavior
