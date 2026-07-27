# Matt City Operator Cheat Sheet

This document contains durable operating facts and safe command patterns for Matt City.

Do not store temporary workflow IDs, session IDs, incident state, or branch-specific findings here. Put those in request artifacts, Asana, or handoff notes.

## Source-of-truth paths

| Purpose | Path |
|---|---|
| Working repository and rig | `/home/matt/src/matt-city` |
| Local Matt City pack | `/home/matt/src/matt-city/city` |
| Gas City runtime | `/home/matt/matt-city-runtime` |
| Gas City CLI | `/home/matt/go/bin/gc` |
| Request packages | `/home/matt/src/matt-city/requests` |
| Editorial profile | `/home/matt/src/matt-city/context/matt-editorial-profile.md` |

The runtime imports the Matt City pack directly from the working repository:

    [rigs.imports.matt]
    source = "/home/matt/src/matt-city/city"

There is no separate Matt City pack clone to synchronize.

## Service checks

    systemctl --user is-active gascity-supervisor.service
    systemctl --user is-active matt-city.service

Both should normally report `active`.

## Health check

Run from the repository:

    cd ~/src/matt-city
    /home/matt/go/bin/gc doctor

Doctor warnings are findings to review, not automatic instructions.

An advisory that the rig is not on `main` does not override an intentionally selected working branch.

Do not run `gc doctor --fix` without reviewing the proposed changes.

## Standard repository change flow

    cd ~/src/matt-city
    git branch --show-current
    git status --short
    git diff --check
    git add -- <intentional-files>
    git diff --cached --check
    git diff --cached
    git commit -m "<bounded change>"
    git push
    git status -sb
    git log -1 --oneline --decorate

Never use broad `git add .` in this repository.

Runtime state, Beads data, Codex state, Gas City state, and diagnostic evidence may appear as untracked files.

## Reload behavior

Normal reload:

    /home/matt/go/bin/gc reload --json --timeout 2m

Use normal reload rather than `--soft` when agent configuration has changed.

`--soft` accepts current drift and may make an old session appear current even though it began with an older startup prompt.

## Prompt-template changes

Prompt-template changes are reliably available to newly created sessions.

A running session keeps the startup context with which it was created. `gc reload` does not retrofit a running conversation with a new startup prompt.

`gc reload` may return `outcome: no_change` after prompt-template edits. This does not mean the local source was ignored. It means the controller did not detect a reloadable effective-configuration change.

For prompt changes:

1. Validate the source.
2. Commit and push it.
3. Preserve evidence from obsolete sessions.
4. Start a fresh session.

## Session inspection

List sessions:

    /home/matt/go/bin/gc session list

Inspect output:

    /home/matt/go/bin/gc session peek <session-id>

Inspect logs:

    /home/matt/go/bin/gc session logs <session-id>

Suspend a session only when it may be resumed later.

Close an obsolete session permanently only after relevant evidence has been captured.

Do not use `gc session kill` as normal cleanup. The reconciler may restart a force-killed managed session.

A session being `active` proves only that the session exists. It does not prove that work was assigned, claimed, or completed.

## Claim behavior

Inside a routed agent session, the first work action is:

    gc hook --claim --json

A response such as:

    {"action":"drain","reason":"no_work"}

means the agent did not receive claimable work.

Do not repeatedly nudge a session that returned `no_work`. Inspect workflow expansion, routing, and claim state instead.

## Requests and workflow runs

A request package defines:

- assignment
- authority
- approved sources
- boundaries
- expected outputs
- publication or external-write restrictions

A workflow run is one execution attempt against that request.

When execution fails but the assignment has not changed:

- preserve the existing request ID
- preserve failed-run evidence
- record the failed or superseded workflow root
- close obsolete worker sessions
- start a new workflow run
- record the new workflow root separately

Create a new request ID only when scope, authority, source material, or intended output materially changes.

## Workflow inspection

Inspect a workflow graph:

    /home/matt/go/bin/gc graph <workflow-root>

Inspect the root Bead:

    bd show <workflow-root> --json | jq .

Inspect sessions separately:

    /home/matt/go/bin/gc session list

A workflow root existing does not prove that child work was claimed.

A routed Bead does not prove that an agent received or completed it.

Compact graph output may omit detail that remains visible in the full Bead record.

## Editorial context

Prose-shaping agents must read:

    context/matt-editorial-profile.md

Authority order:

1. Claimed Bead and current request
2. Approved editorial brief and story map
3. Approved sources and cited evidence
4. Editorial profile
5. Technical and factual accuracy

The editorial profile is a starting calibration artifact. Update it from observed drafts and reviews rather than treating it as a finished model of Matthew's voice.

## Prior-run evidence

Prior-run artifacts are not default context for every request.

A request may explicitly opt into previous runs when those runs materially improve:

- technical accuracy
- historical context
- failure analysis
- architecture explanation
- provenance
- lessons learned

The Matt City article request is one such exception because the article documents Matt City itself.

Review narrative artifacts before raw diagnostic JSON. Use raw state snapshots to verify chronology and implementation details, not as undifferentiated writing context.

## Evidence labels

Preserve distinctions among:

- observed runtime behavior
- versioned implementation
- documented design
- intended or planned behavior
- inference
- temporary workaround
- failed-run evidence
- superseded historical state

Do not convert a running session, routed task, passing smoke test, intended design, or successful launch command into proof of useful production output.

## Commands to avoid casually

Do not run these without a specific reviewed reason:

- `gc stop`
- `gc restart`
- `gc doctor --fix`
- `gc reload --soft`
- `git reset --hard`
- `git clean`
- `git checkout main`
- `git push --force`
- `bd import`
- Dolt cleanup or migration commands
- event-log truncation
- broad service restarts

Avoid routine `gc status` during focused troubleshooting. It has previously caused unnecessary storage and process churn.

Do not delete `.beads/`, `.codex/`, `.gc/`, launch results, workflow snapshots, or diagnostic artifacts merely because Git reports them as untracked.

## Safe troubleshooting order

1. Confirm branch and Git status.
2. Confirm services.
3. Run `gc doctor`.
4. Inspect the exact workflow root.
5. Inspect the exact session.
6. Verify whether child Beads materialized.
7. Verify routing metadata.
8. Verify whether the agent received claimable work.
9. Preserve evidence before stopping or replacing a run.
10. Make one bounded change at a time.

## Current-state records

Store temporary state in:

- the applicable request directory
- Asana project or task notes
- diagnostic JSON or JSONL artifacts
- explicit handoff notes

Do not put temporary IDs or current incident state in this cheat sheet.
