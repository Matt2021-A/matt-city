# Asana Context Snapshot for Smoke Test #2

## Canonical execution task

- Project: Matt City
- Project GID: 1216444827581484
- Task: Smoke Test #2: End-to-end research workflow validation
- Task GID: 1216641220635093

## Originating content task

- Project GID: 1213500168987836
- Task GID: 1216445335991016
- Article: Building Matt City: An Identity-Aware Multi-Agent Work System
- Destination Google Doc ID:
  1A10eeY7sQoYazqNxw8SY0mve1hjqQ14UufLORkXrJXM

## Proven implementation timeline

### Architecture and identity

- Asana was established as the canonical human work and context plane.
- GitHub was established as the versioned implementation surface.
- Gas City was established as the machine orchestration and execution layer.
- Matthew, the primary assistant, local agents, sessions, and external-system
  identities are separate principals.
- Delegating a task does not delegate credentials, connected systems, or
  approval authority.

### Runtime environment

- Debian 13 runs under WSL2 on StickerBox.
- Repository: /home/matt/src/matt-city
- Runtime: /home/matt/matt-city-runtime
- Gas City: 1.3.4
- Codex CLI: local execution provider through builtin:codex
- Current Beads provider: file
- Intended durable Beads provider: Dolt

### Dolt and Beads blocker

Clean Dolt-backed initialization repeatedly failed because of a Beads schema
migration deadlock associated with upstream issue gastownhall/beads#4566.

File mode was selected as a bounded Phase 1 workaround so agent, formula,
routing, startup, and provenance work could continue without deleting or
rewriting the retained legacy stores.

This is not the intended long-term architecture.

### Smoke Test #1

- Request ID: phase-1-smoke-test-001
- Workflow root: gc-465
- Research attempt: gc-467
- Diagnostic session Bead: gc-686

The formula cooked successfully into a 17-Bead graph, but work did not become
claimable through the intended agent path.

Forced sling reported routing success but did not solve claim visibility.

The test was stopped rather than obscuring the failure with manual downstream
routing.

The failed workflow remains preserved as evidence.

### Routing corrections

Subsequent pull requests:

- moved formula execution toward formula-v2 requirements
- added fully qualified run-target metadata
- defined bounded claim and outcome behavior
- reviewed the supplemental Gas City ecosystem repositories
- replaced a non-importable upstream gascity/roles path with a local
  matt.run-operator
- added runtime-alignment validation
- corrected the runtime-alignment executable mode

### Invalid upstream import

The attempted import of:

`gascity-packs/gascity/roles`

failed because that directory did not contain its own Pack v2 `pack.toml`.

Changing URL syntax did not solve the problem.

Matt City therefore added a local run operator based on the upstream lifecycle
contract rather than depending on a currently non-importable subdirectory.

### Automatic startup

A systemd user service now starts Matt City automatically after the Gas City
supervisor.

The first service run failed because systemd could not find the Linuxbrew
`gc` binary.

The startup script and service were corrected with an explicit PATH and
explicit `/home/linuxbrew/.linuxbrew/bin/gc` binding.

A cold WSL restart confirmed:

- gascity-supervisor.service active
- matt-city.service active
- controller restored
- runtime registered
- sessions restored
- no manual gc start required

### Backend-specific order policy

While the file backend is active, these orders are skipped because they require
gc bd or Dolt:

- gate-sweep
- dolt-health
- dolt-remotes-patrol
- mol-dog-backup
- mol-dog-compactor
- mol-dog-doctor
- mol-dog-phantom-db
- mol-dog-stale-db

They must be re-enabled and validated when Dolt is restored.

### Current pre-test health

Latest observed doctor state:

- 72 passed
- 6 warnings
- 0 failures
- scheduled orders current
- formula compiler requirements consistent
- runtime alignment passed
- imports installed
- automatic startup validated

Remaining warnings:

- local-only JSONL archive
- preserved legacy split store
- order-tracking retention advisory
- custom-type warning under file mode at city scope
- custom-type warning under file mode at rig scope
- four session-model findings from Smoke Test #1

The four session-model findings are:

- gc-470: matt-city/matt.technical-analyst, config-only, no session
- gc-473: matt-city/matt.identity-security-analyst, config-only, no session
- gc-476: matt-city/matt.skeptic, config-only, no session
- gc-479: matt-city/matt.technical-analyst, config-only, no session

They are classified as historical evidence. Smoke Test #2 must not continue
those Beads.

## Current approval boundary

Matthew has approved:

- local request creation
- local formula materialization
- local agent execution
- local artifact creation
- local provenance capture

Matthew has not approved:

- Google Docs writes
- Asana writes by local agents
- GitHub writes by local agents
- publication
- email or social messages
- use of connected-system credentials by local agents
