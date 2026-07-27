# Failed Run Summary: mc-m0q

## Identification

- Request: `building-matt-city-blog-001`
- Workflow root: `mc-m0q`
- Formula: `draft-technical-blog`
- Routed operator: `matt-city/matt.run-operator`
- Editorial strategist session: `mcr-wisp-oymm4h`

## Observed state

- The workflow root remains `in_progress`.
- The root record reports 25 dependents.
- The editorial strategist session remains active but stale.
- The strategist previously received `drain` with reason `no_work` when attempting to claim work.
- The existing article package contains an editorial brief and story map.
- No outline, first draft, review package, or final draft was produced by this run.

## Interpretation boundary

The observed evidence establishes that useful drafting work did not begin in the strategist session.

It does not yet establish the exact orchestration defect. Possible routing, expansion, lifecycle, or claim-state causes must remain hypotheses until verified from the workflow and session evidence.

## Research value

Because the article concerns Matt City itself, this failed run may be used to explain:

- the difference between a running session and assigned work
- why workflow state and agent state must be inspected separately
- how failure evidence informed later design changes
- why provenance and explicit state labels matter
- why a successful launch command is not proof of useful output

This failed run must not be represented as current behavior after the relevant defect is corrected.

## Captured session evidence

The preserved session evidence is stored under `context/mc-m0q-session/`:

- `strategist-peek.txt`
- `strategist-logs.txt`
- `sessions-before-close.txt`
- `strategist-close.jsonl`
- `sessions-after-close.txt`

These files preserve the strategist's final visible state and the explicit closure of the obsolete session.
