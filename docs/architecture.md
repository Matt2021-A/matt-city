# Phase 1 Architecture

```text
Matthew
   |
   v
Primary ChatGPT assistant
   |
   | structured request and reviewed artifact handoff
   v
Gas City control plane
   |
   +--> Research Agent
   +--> Technical Analyst
   +--> Identity and Security Analyst
   +--> Skeptic
   |
   v
Local research rig and artifact store
```

## Responsibilities

- Matthew sets intent and approves downstream use.
- The primary assistant remains an external collaborator and is not impersonated by local agents.
- Gas City manages durable work, dependencies, sessions, retries, and events.
- Specialist agents operate within narrow prompts and local-file capabilities.
- The research rig contains approved inputs and generated outputs.

## Initial workflow

1. Validate request
2. Collect and normalize source findings
3. Produce technical analysis
4. Produce identity and security analysis
5. Challenge claims and assumptions
6. Package outputs with provenance
7. Stop for human review
