---
name: mendix-plan
description: Turn a Mendix input — a vague idea, a rough story, a bug, a feature request — into a concrete development plan of one or more stories, written to markdown. Sharpens the input via the challenge skill first, then writes stories with acceptance criteria, affected model parts, and a build approach per part. Use when the user wants a Mendix feature or change planned out into actionable work. Planning only — the actual building stays with the developer (Studio Pro, Maia, Mendix MCP, mxcli).
---

# Plan

Take a Mendix input at any fidelity — a one-line idea, a half-formed story, a bug report, "we need to let managers export this" — and **plan the course to it**: a development plan of one or more stories, written to markdown, ready for the developer to build.

The size of the input does not matter here. A one-line idea and a big feature both enter the same way; the plan just grows more stories, with a stated order and dependencies between them. When the work is large, slice it into several stories and make the sequencing explicit (see [Larger work](#larger-work)) rather than forcing it into one.

## Plan, don't build

This skill stops at a plan. It never opens Studio Pro, never writes microflows, never touches the model to change it. Building is the developer's job, done however they prefer — Studio Pro by hand, Maia, the Mendix MCP, or mxcli. The plan says *what* and *why* and *where in the model*; the developer owns the *how it gets typed in*. Naming the right tool per piece of work is in scope; doing the work is not.

## Process

1. **Read the project.** Before making any claim about the model, read it via the `mendix-read` skill (or Mendix MCP / mxcli if that's what's available). A plan that contradicts the actual entities and security is worse than no plan.
2. **Sharpen via `mendix-challenge`.** Run a `mendix-challenge` session on the input — one question at a time, decisions to the developer, facts looked up. Do not skip this even when the input looks clear; clear-looking inputs hide the sharpest questions. Stop when shared understanding is confirmed.
3. **Slice into stories.** One story per independently valuable, independently buildable slice. A tiny change is one story; don't inflate it. A feature that touches model + logic + page + security is often still one story if it's one deployable unit — split only when slices deliver value on their own or must be built/tested separately.
4. **Write the plan** to markdown (see [Output](#output)). Save it where the developer works — default `docs/plans/<slug>.md`, ask if unsure.
5. **Confirm.** Show the developer where it landed. Don't start building.

## Output

A markdown file: a short intro (the goal in one or two lines, and the confirmed understanding from the challenge session), then one section per story.

Each story:

```markdown
## <Story title>

**Goal.** <One or two lines: what this delivers and why it matters.>

**Acceptance criteria.**
- Given <context>, when <action>, then <observable result>.
- <testable, observable — no implementation language>

**Affected model.** <Only what's actually touched.>
- Entities / attributes: <new or changed>
- Associations: <new or changed, with multiplicity>
- Microflows / nanoflows: <what logic, roughly>
- Pages / widgets: <what UI>
- Security: <module roles, access rules, XPath constraints affected>
- Integration: <published/consumed services, message definitions, scheduled events>

**Approach & tools.** <How to build each piece, and with which tool. Be specific about the tool split:>
- <piece> — Studio Pro by hand / Maia / Mendix MCP / mxcli
- <e.g. "New entity + access rules — Studio Pro; boilerplate CRUD microflows — Maia; smoke-check runtime — mxcli">

**Dependencies.** <Which stories or facts must land first. Omit if none.>

**Out of scope.** <What this story deliberately does not cover — always includes the actual building, which the developer owns.>
```

Keep every section honest to the input. Omit a subsection when nothing is touched — an empty "Integration:" line is noise. Only surface what the challenge session actually established; do not invent model parts to fill the template.

## When one story is enough

Most inputs are one story. Don't manufacture a multi-story plan for a single change — write one section and stop. The multi-story shape earns its place only when the work genuinely splits into independently valuable, separately buildable slices.

## Larger work

When the input is big, the plan grows to several stories — but it stays one plan file. Two things make a multi-story plan hold together:

- **Order.** List the stories in the sequence they should be built, and lean on each story's **Dependencies** line to say what must land first. If two stories are independent, say so — that's what lets them be picked up in parallel.
- **A one-paragraph overview** at the top, above the stories: the whole effort at low resolution, so the developer sees the shape before the detail.

If the work is so large that the decisions themselves are still fogged — you can't yet state the stories because too much is undecided — that's the signal to stop planning stories and grill the open decisions first via `mendix-challenge`, resolving them one at a time until the stories become writable. Don't invent stories on top of unresolved decisions.

