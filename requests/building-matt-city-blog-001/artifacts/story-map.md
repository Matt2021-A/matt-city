# Story Map: Building Matt City

## One-sentence story

Matthew built Matt City to turn valuable work trapped in chat into durable, identity-aware workflows, then discovered that a workflow can execute perfectly and still fail if it does not return something useful to the human who asked for it.

## Opening image

A week of work ends with a successful workflow, six committed artifacts, clean provenance, and a green terminal state.

Matthew opens the package expecting the start of a blog draft.

Instead, the first file is an artifact index describing Beads, sessions, hashes, and workflow status.

The system worked.

The work did not.

## Opening question

What does it mean for a multi-agent workflow to succeed?

Is success that every step ran, every dependency resolved, and every artifact can be traced back to a concrete session?

Or is success that the person who requested the work can actually use the result?

The article argues that both matter, and that agent systems fail when they optimize for one while ignoring the other.

## Act 1: The original problem

### What was happening

Useful work was accumulating in chat:

- research
- technical decisions
- content plans
- implementation history
- drafts and revisions
- approval context

The work was valuable, but its operating context was fragile. It could be difficult to resume after a long session, transfer into Asana, connect to implementation changes, or reconstruct later.

### What appeared to be the solution

Use multiple specialized agents and a durable workflow engine.

Let research, technical analysis, identity analysis, skeptical review, and packaging happen as separate stages.

### Why that answer was incomplete

More agents can create more output without creating durable ownership, clear authority, or useful handoffs.

The real problem was not agent count. It was the operating model around the agents.

## Act 2: The architecture takes shape

### Asana: human work and approval

Asana is where the human-visible work lives:

- assignment
- owner
- purpose
- linked context
- decisions
- status
- approval

An Asana task says what humans are trying to accomplish. It is not the machine execution graph.

### Gas City and Beads/Dolt: machine execution

Gas City decomposes the request into work that can be routed, claimed, retried, and finalized.

Beads/Dolt preserves the machine state after an individual session ends.

A Bead records a unit of work or workflow state. It is not the same thing as the human task, the agent, or the artifact.

### GitHub: versioned operating model

GitHub stores:

- formulas
- prompts
- agent definitions
- policies
- documentation
- implementation changes
- approved artifacts

It makes the operating model inspectable and changeable over time.

### The primary assistant: context and connected identities

The primary assistant interprets Matthew's request, retrieves connected context, packages bounded inputs, and later performs separately authorized external actions.

It is not the same principal as a local specialist agent.

### Local agents: bounded execution

A specialist may inherit a task and its approved context.

It does not inherit Matthew's identity, the primary assistant's Google or Asana access, unrelated conversation history, or publication authority.

## Act 3: Why identity becomes the center of the story

### Surface statement

"The AI wrote the article."

### What that statement hides

- Matthew requested the work.
- The primary assistant interpreted and delegated it.
- Asana held the canonical assignment and approval state.
- Gas City routed the workflow.
- A configured agent was the intended target.
- A concrete runtime session executed each attempt.
- Codex supplied model execution capacity.
- A connected identity would be required to read or write Google Docs.
- Matthew remained the approver.

### The rule

Assignment is not identity.

Delegating work does not delegate every credential, permission, connection, or approval right belonging to the requester or delegator.

### Why this matters beyond Matt City

Without these distinctions, teams cannot answer basic operational questions:

- Who actually acted?
- Under whose authority?
- Which identity touched the external system?
- What context was exposed?
- Who approved the consequential step?
- What can be reconstructed after the session disappears?

## Act 4: The system is tested

### Smoke Test #1

The first workflow created a graph but exposed a store and routing mismatch. Manual intervention could move records without proving the intended lifecycle.

Lesson: assigning or moving work is not the same as proving that the configured workflow can route and be claimed correctly.

### Smoke Test #2

The second test restored a fresh bd-backed graph and validated more of the launch path, but stopped before complete execution.

Lesson: materializing a workflow is not the same as completing it.

### Smoke Test #3

The third test successfully exercised:

`cook -> route -> claim -> execute -> package -> finalize`

Fresh workflow objects were created. Specialist sessions claimed the intended work. Dependencies were respected. Artifacts were written. Provenance was packaged. The workflow closed with a passing result.

Lesson: the local orchestration foundation works for the tested path.

## Act 5: The turn

### Matthew opens the result

The result is technically careful and operationally reconstructable.

It contains research findings, technical analysis, identity/security analysis, skeptical review, an artifact index, and provenance.

But it does not contain:

- an editorial brief
- a central story
- a usable outline
- a draft
- targeted revision against that draft

### The realization

The request shaped the outcome.

The workflow was asked to prove execution, provenance, and identity boundaries. It did exactly that.

It was not asked to solve the editorial job.

### The sharper product lesson

A workflow can pass its internal acceptance criteria and still fail the human usefulness test.

That is not merely a prompt issue. It is a workflow-design issue.

The system optimized for the wrong terminal artifact.

## Act 6: The missing layer

### Source ingestion

The local agents could not browse the web, read Asana, or access Google Drive because those identities were intentionally not delegated.

An authorized ingestion principal must retrieve:

- the Asana assignment
- linked Google Docs
- public web sources
- GitHub material
- selected prior artifacts
- approved writing samples

It then packages those inputs for local use.

### Artifact selection

The system must distinguish between artifacts that support the article and artifacts that merely prove the run.

Useful drafting context:

- research findings
- technical analysis
- identity analysis
- skeptical findings
- approved prior articles
- editorial guidance

Background operational evidence:

- artifact indexes
- provenance JSON
- session snapshots
- hashes
- dispatcher details

### Editorial strategy

Research does not become a story automatically.

The workflow needs an explicit stage that decides:

- reader
- problem
- tension
- thesis
- evidence
- narrative order
- intended ending
- exclusions

### Drafting and review

The next workflow should produce a complete draft, then run targeted reviews against that draft:

- technical accuracy
- identity and authority boundaries
- unsupported claims
- Matt voice

Reviewers should improve one article, not create four more detached reports.

### Human approval

The final draft returns to Matthew before any Google Doc write, publishing action, or distribution.

A closed machine workflow is not publication approval.

## Act 7: The revised workflow

```text
Asana assignment
Google Docs and external sources
selected prior artifacts
Matt voice references
        ↓
credentialed source ingestion
        ↓
bounded source package
        ↓
editorial brief
        ↓
story map
        ↓
human direction check
        ↓
outline
        ↓
complete draft
        ↓
targeted technical, identity, skeptical, and voice review
        ↓
final draft
        ↓
human approval
        ↓
separately authorized publication
```

The operational provenance remains, but it moves behind the editorial experience.

## Act 8: What success must mean next

### Minimum useful result

Matthew opens `draft-final.md` and sees a recognizable article.

The draft:

- uses the real assignment and external sources
- reuses the substantive artifacts already produced
- explains the system to a reader who does not know Matt City
- sounds like Matthew
- distinguishes observed behavior from intended design
- admits the sharp edges
- requires editing rather than reconstruction

### Go/no-go rule

If the revised workflow is slower and less useful than the previous ChatGPT-assisted process, it does not become the default drafting path.

Matt City may still be useful as orchestration and provenance infrastructure. It does not earn a place between Matthew and finished content merely because it is technically interesting.

## Closing movement

Return to the opening package.

The artifact index was not useless. It proved that the system could reconstruct the run.

It was simply the wrong thing to hand the human first.

The next version of Matt City has to preserve the receipts without making the receipt folder the product.

## Closing line candidates

### Option 1

Matt City has proven that the conveyor belt moves. The next test is whether anything worth using comes off the end.

### Option 2

A multi-agent workflow is not finished when every agent stops. It is finished when the human can pick up the result and keep moving.

### Option 3

The system needs receipts. The human still needs the work.

## Decisions for Matthew

1. Reveal the failed usefulness test in the opening, or use it as the midpoint turn?
2. Keep the title architecture-forward, or lead with the stronger human outcome?
3. Include the full three-smoke-test history, or compress Tests #1 and #2 into one paragraph?
4. Use the accidental Asana ownership issue as a second concrete example of identity lifecycle failure?
5. End with the go/no-go rule for Matt City as the default drafting workflow?
