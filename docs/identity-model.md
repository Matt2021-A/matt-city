# Identity and Attribution Model

## Principals

Matt City recognizes separate principals:

- Matthew, the human owner and approver
- The primary ChatGPT assistant, a separate external collaborator
- The Gas City controller
- Each specialized agent
- Each runtime session
- Each external service or workload identity

No principal is treated as another principal merely because work was delegated.

## Required attribution

Every artifact or external action should record:

- Resource owner
- Work initiator
- Delegating principal
- Performing agent
- Runtime session
- Executing target-system identity
- Permission or capability used
- Human approval, when required

## Governing rule

Agents may inherit tasks. They do not inherit another principal's identity, authority, connections, or permissions.

## Phase 1 enforcement

Phase 1 agents receive local file access only. They receive no credentials for GitHub, Asana, email, calendar, WordPress, or other external systems.
