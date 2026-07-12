# Generated Gas City Skills

Gas City projects standard operational skills into `.agents/skills/` when a repository is registered as a rig.

The projected skills observed during the first live runtime registration included:

- `core.gc-agents`
- `core.gc-city`
- `core.gc-dashboard`
- `core.gc-dispatch`
- `core.gc-mail`
- `core.gc-rigs`
- `core.gc-work`

These files are generated from the installed Gas City pack version. They are intentionally ignored rather than vendored because their contents can change with the installed runtime and are not the hand-authored Matt City agent contract.

Matt City source-controlled agent definitions remain under `city/agents/`. After cloning the repository and registering it as a rig, Gas City recreates the projected skills locally.

See `docs/runtime-validation.md` for the tested runtime, generated artifacts, and current compatibility warnings.
