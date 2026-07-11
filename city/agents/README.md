# Agent Definitions

Gas City discovers custom agents from directories under `agents/<name>/`.

Each Phase 1 agent now has:

- `agent.toml` for provider and runtime configuration
- `prompt.template.md` for the executable agent prompt

The older top-level Markdown files in this directory are design notes retained for review history. They are not loaded by Gas City and must not be treated as runnable agent configuration.

Current native Phase 1 agents:

- `researcher/`
- `technical-analyst/`
- `identity-security-analyst/`
- `skeptic/`

The current configs use the `claude` provider alias. The installed city must register that provider in `city.toml`, and the provider may be changed after runtime validation.

Official reference: https://docs.gascity.com/tutorials/02-agents
