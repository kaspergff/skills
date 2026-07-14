---
name: mendix-challenge
description: Interview the developer relentlessly to sharpen a Mendix plan, decision, or idea before any building starts. One question at a time, resolving decisions until a shared understanding is reached. Use when the user wants to stress-test their thinking about a Mendix feature, or uses any 'challenge'/'grill'/'doorvragen' trigger phrases. Planning only — never builds.
disable-model-invocation: true
---

# Challenge

Interview the developer relentlessly about every aspect of a Mendix idea, story, or decision until you reach a shared understanding. Walk down each branch of the decision tree, resolving dependencies between decisions one-by-one. For each question, give your recommended answer.

This is the **engine** the planning skill calls. It does not produce an artifact by itself — it produces clarity. `mendix-plan` invokes it to sharpen an idea or story before writing the plan.

## Rules of engagement

- **One question at a time.** Wait for the answer before the next question. Multiple questions at once is bewildering.
- **Always recommend.** Every question carries your recommended answer and a one-line why. The developer decides; you make deciding cheap.
- **Facts you look up, decisions you ask.** If a fact lives in the project — an entity's attributes, an existing microflow's logic, a module role, a published REST path, what a page already does — find it yourself (see [Look before you ask](#look-before-you-ask)). Never ask the developer something the model already answers. Decisions are theirs; put each one to them.
- **Plan, don't build.** The output of a challenge session is a decision or a shared understanding, never an implementation. The moment the pull is to open Studio Pro and build, you've reached the edge — stop and hand back.
- **Don't stop early.** Do not act on the conclusion until the developer confirms shared understanding is reached.

## Look before you ask

A Mendix decision usually hangs on facts already in the project. Before asking, read them. Use whatever is available, in this order of preference:

1. **`mendix-read`** skill — the mandatory reading layer for the current project's model (entities, associations, microflows, pages, security, published/consumed services). Read via this skill before making any claim about the project's contents.
2. **Mendix MCP** — if connected, for live model queries.
3. **mxcli** — for project/workspace facts from the command line.

If none is available and the fact matters, say so and ask the developer to supply it — but exhaust the tools first.

## What to grill on

Lean on your knowledge of Mendix. There is **no fixed checklist** — the sharp questions depend on the idea. But a Mendix plan tends to go fuzzy in predictable places, so probe wherever the idea touches them:

- **The domain model** — which entities, which associations and their multiplicity, generalisation, what's persistable vs non-persistable, where new attributes land.
- **Security** — module roles, entity access rules, XPath constraints, page/microflow access, whether the feature changes who-can-see-what.
- **Logic vs. pages** — what belongs in a microflow/nanoflow, what's page/widget behaviour, validation placement, error handling.
- **Integration** — published or consumed REST/OData/web services, message definitions, what's the contract, sync vs async, scheduled events.
- **Data & state** — volume, transactions, commit boundaries, events (before/after commit), consistency.
- **Delivery shape** — responsive/native/offline, multi-tenant, existing patterns and modules to reuse rather than reinvent.

Invent concrete scenarios to force precision. "A user with role X opens page Y while another user just deleted the object — what happens?" Edge cases surface the real decisions.

## Cross-check against the model

When the developer states how something works, check whether the model agrees. If it contradicts, surface it immediately: "You said a Customer can have many Orders, but the association in the model is one-to-one — which is right?" A contradiction between stated intent and the actual model is the most valuable thing a challenge session finds.

## Ending

When every open branch is resolved, summarise the shared understanding in a few lines and ask the developer to confirm. Only then is the session done. If invoked by `mendix-plan`, hand that understanding back to the caller — do not write the plan yourself.
