# Editorial Brief: Building Matt City

## Working title

**Building Matt City: The Hard Part of Multi-Agent Work Is Not the Agents**

Alternative working title:

**Building Matt City: An Identity-Aware Multi-Agent Work System**

## Reader

Technical operators, security and identity practitioners, platform engineers, DevOps leads, technical product marketers, and AI-infrastructure builders who are experimenting with agents but are already running into the harder questions:

- Where does the real work live?
- Who owns it?
- Which identity actually performed an action?
- What context was delegated?
- Which credentials were used?
- What evidence remains after the session ends?
- Who approved the result?

The reader does not need prior knowledge of Gas City, Beads, Dolt, or Matt City.

## Reader problem

Agent workflows are easy to demonstrate and difficult to operate.

A demo can show several agents exchanging tasks. A real work system has to preserve ownership, context, state, credentials, evidence, and approval across tools and sessions. Without that operating model, the output may be impressive while the record behind it remains vague.

The reader needs a practical way to think about multi-agent work that does not collapse every actor and system into the phrase, "the AI did it."

## Opening tension

The project began because valuable work was accumulating in chat faster than the surrounding system could preserve it.

Research, decisions, drafts, implementation details, and review context existed, but they were difficult to resume, delegate, audit, or reuse. The apparent solution was to build a multi-agent workflow.

Then the first real workflow passed.

It routed the work, created concrete sessions, produced artifacts, preserved provenance, and reached a successful terminal state. It also produced almost nothing that helped draft the article it was supposed to support.

That contradiction is the opening.

## Central thesis

The hard part of multi-agent work is not getting agents to communicate. It is preserving the boundaries between human ownership, machine execution, context, credentials, evidence, and approval while turning recurring work into a durable workflow.

A technically successful workflow is not useful merely because it completes. The result still has to help a human finish the work.

## What the article is really about

This is not primarily a tutorial for Gas City.

It is an architecture field note about building a work system around agents without allowing human task ownership, runtime execution, external credentials, and approval authority to blur together.

Matt City is the concrete case study.

## Why this story matters now

Most current agent conversations focus on capability, autonomy, tool use, and coordination. Those concerns matter, but they often skip the operating questions that appear as soon as agents touch real work:

- durable state
- bounded context
- attribution
- credential boundaries
- lifecycle ownership
- approval
- source reuse
- useful human-facing output

The Matt City build exposes those issues in a small, practical environment rather than as an abstract governance framework.

## Primary argument

Matt City separates the system into distinct planes:

- **Asana** holds human-visible work, ownership, context, decisions, status, and approval.
- **Gas City with Beads/Dolt** holds machine execution state, routing, dependencies, claims, retries, and finalization.
- **GitHub** holds the versioned implementation, formulas, prompts, documentation, and approved artifacts.
- **The primary assistant** packages bounded context and uses separately authorized identities for connected systems.
- **Local specialist agents** execute bounded work but do not inherit Matthew's or the primary assistant's credentials.
- **Matthew** remains the human requester and approver.

The systems are connected, but they are not interchangeable.

## The real-world proof point

Smoke Test #3 successfully demonstrated the local lifecycle:

`cook -> route -> claim -> execute -> package -> finalize`

The run produced fresh workflow state, concrete specialist sessions, ordered dependencies, substantive analysis artifacts, provenance, and a successful terminal result.

That is a meaningful orchestration result.

The same run also exposed the missing product layer. The requested outputs were designed as audit artifacts, so the workflow produced an evidence package instead of a story, outline, or draft. The system proved that it could move work correctly without proving that it could help Matthew complete the work.

That failure should be treated as product evidence, not embarrassment.

## Story promise

By the end of the article, the reader should understand:

1. Why agent coordination alone does not create a durable work system.
2. Why an Asana task, Gas City workflow, Bead, runtime session, and GitHub artifact represent different things.
3. Why assignment does not transfer identity, credentials, or approval authority.
4. What Matt City has actually proven so far.
5. Why a passing workflow can still fail the human usefulness test.
6. What source ingestion, artifact selection, editorial strategy, and approval must add next.
7. What success should look like for an identity-aware content workflow.

## Recommended narrative structure

### 1. The work was accumulating faster than the system around it

Begin with chat as a productive but fragile work surface. The problem was not a lack of ideas or output. It was that valuable work was difficult to resume, route, reconstruct, and reuse.

### 2. The goal was never an agent swarm

Explain that adding agents could increase output while making ownership and attribution worse. The goal became durable work with explicit boundaries.

### 3. Three systems, three responsibilities

Introduce Asana, Gas City/Beads/Dolt, and GitHub through what each is authoritative for. Avoid presenting the architecture as a product diagram. Explain the consequences of mixing them up.

### 4. Assignment is not identity

Use the strongest identity argument: an agent may inherit bounded work but does not inherit another principal's identity, connectors, credentials, permissions, or approval authority.

Explain the separate roles of requester, delegator, task owner, run target, concrete session, credential holder, reviewer, and approver.

### 5. What happened when the workflow ran for real

Tell the short history of the failed and partial smoke tests, then the successful third run. Use only enough implementation detail to establish that the workflow genuinely routed and executed through the intended lifecycle.

### 6. The workflow passed, but the content failed

This is the turn in the article.

The output contained useful facts and strong analysis, but the primary review artifact was an audit index. It did not identify the story, shape the argument, or produce a draft. The workflow optimized for reconstructability while neglecting the job the human was trying to finish.

### 7. The missing editorial layer

Explain the revised content workflow:

`assignment + external sources + prior artifacts + voice guidance -> editorial brief -> story map -> outline -> draft -> targeted review -> final draft -> human approval`

Clarify that provenance still matters, but it belongs behind the curtain unless it advances the article.

### 8. What Matt City still has to prove

State the next real test: use the existing research, connected sources, and Matt voice guidance to produce a draft that requires editing rather than reconstruction.

### 9. What success actually looks like

End on the human outcome. A green terminal state is not enough. The system succeeds when it reduces friction, preserves attribution, and returns useful work to the person who asked for it.

## Evidence and examples to include

- The distinction between Asana as canonical human work and Beads/Dolt as canonical machine execution state.
- The role of GitHub as the versioned build and artifact surface.
- The difference between a formula run target and a human assignee.
- The use of concrete specialist sessions for research, technical analysis, identity/security analysis, skeptical review, and packaging.
- The successful completion of Smoke Test #3.
- The fact that the Google Doc remained blank because local agents did not have authorization to write to it.
- The gap between operationally valid artifacts and useful editorial outputs.
- The revised plan to ingest external sources through an authorized principal and pass a bounded source package to local agents.

## Claims the article can make

- Matt City is a working local orchestration experiment built around explicit responsibility and identity boundaries.
- Smoke Test #3 demonstrated the complete local Formula V2 lifecycle for the tested workflow.
- The workflow used durable Beads/Dolt state and concrete specialist sessions.
- Local agents did not inherit connected-system credentials.
- The run produced technically useful research and provenance artifacts.
- The run did not produce a useful blog-drafting experience.
- The next required layer is source ingestion, artifact selection, editorial strategy, voice control, and human approval.

## Claims to avoid

- Matt City is production-ready.
- Matt City is an autonomous content system.
- The workflow has validated external integrations.
- The workflow has validated retry recovery under actual failure.
- Phoenix or OpenTelemetry validated the run.
- The system already writes, publishes, or manages content end to end.
- Multi-agent orchestration is inherently better or faster than the previous ChatGPT-assisted workflow.

## Voice guidance

The draft should sound like an experienced operator explaining what happened and why the distinction matters.

Use:

- concrete operational consequences before framework language
- direct admissions when something did not work
- short transitions that clarify the real issue
- architecture explained through ownership, access, failure, and recovery
- restrained technical detail that earns its place
- practical standards for what should happen next

Avoid:

- vendor-launch language
- "revolutionary" agent claims
- treating every implementation detail as equally important
- excessive Bead and session identifiers in the article body
- audit-report headings
- generic AI introductions
- writing that sounds defensive about the failed editorial result

## Intended ending

The article should land on a stricter definition of success:

A multi-agent workflow is not successful because every agent ran or every task closed. It succeeds when the system preserves ownership, context, authority, evidence, and approval while returning something genuinely useful to the human who started the work.

Matt City has now proven the conveyor belt moves. The next test is whether anything worth using comes off the end.

## Human review questions

Before drafting, Matthew should decide:

1. Is the central story the right one?
2. Should the article lead with the failed usefulness test, or reveal it after establishing the architecture?
3. How much of the week-long debugging history belongs in the article?
4. Should the accidental Asana ownership issue remain a separate example, or be folded into the broader identity argument?
5. Does the article need a compact diagram of the three system planes and identity boundaries?
