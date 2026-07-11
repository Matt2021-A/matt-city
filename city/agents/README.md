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

The Phase 1 configs use the `codex` provider alias, Gas City's built-in OpenAI Codex CLI harness. The runtime city must register it in `city.toml`:

```toml
[providers.codex]
base = "builtin:codex"
```

The installed Codex CLI must authenticate as the principal intended to execute the local agent sessions. This provider selection does not grant the specialist agents Matthew's or the primary assistant's external connections.

Official reference: https://docs.gascity.com/tutorials/02-agents
