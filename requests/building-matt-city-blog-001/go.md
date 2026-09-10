# Drafting checkpoint

Matthew approved continuing from the existing editorial brief and story map to the local outline and draft workflow on July 21, 2026.

That approval remains valid for request `building-matt-city-blog-001`.

## Current execution boundary

The historical `fix/restore-bd-provider` branch named by the original checkpoint has been merged through PRs #12 and #13 and pruned remotely. `main` is now the canonical repository base. Do not recreate the retired branch merely because older evidence names it.

The current recorded production workflow root is `mc-069`; the current recorded outline attempt is `mc-417`.

Before resuming the local `draft-technical-blog` workflow, perform the documented read-only post-reboot reconciliation of the local Git worktree and Debian WSL runtime. The runtime has not been directly revalidated since the unapproved August 23, 2026 Windows Update reboot.

After reconciliation, resume the existing durable workflow only if its state is safe and reconstructable. If a replacement execution attempt is required, preserve the existing request ID and failed/superseded run evidence and record the new workflow root separately.

Any repository change must start from current `main` on a new branch and follow branch -> pull request -> Matthew review -> merge.

## Drafting requirements

Before producing or revising prose, the editorial strategist, writer, and voice editor must read `context/matt-editorial-profile.md`. The request, approved editorial brief, story map, claimed Bead, and cited sources remain authoritative for article-specific facts and scope.

Before extending research or drafting an outline, review `context/prior-run-evidence.md` as required by the request.

Create local editorial artifacts only. Stop before any external write, publication, or merge.
