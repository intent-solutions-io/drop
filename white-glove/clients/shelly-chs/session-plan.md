# intent solutions io
---

# Shelly × Jeremy: Session Plan
*Learn with Jeremy — First Client Pilot*

## Client Profile

**Name:** Shelly (Creative House Studios)
**Technical Level:** Non-technical, C-level exec mindset
**Project:** CHS Credibility Spine (Supabase infrastructure)
**Status:** Claude Code installed, ready for guided sessions

## The Project

Build foundational infrastructure for the **CHS Credibility Spine** — a system for logging verifiable "receipts" (proof of work) that precedes and constrains all future distribution.

**Not building:** Marketing automation, campaigns, SEO tactics, distribution engines.

---

## Pre-Session Requirements

Shelly must complete before Session 1:

- [ ] Homebrew installed on Mac
- [ ] Node.js installed (`node --version` returns v18+)
- [ ] Claude Code installed (`claude --version` works)
- [ ] Supabase account created
- [ ] GitHub account created
- [ ] Jeremy added as GitHub collaborator

**Materials to send Shelly:**
- `01-terminal-101.md`
- `07-github-101.md`
- `08-claude-code-install.md`

---

## Session 1: Orientation + Project Grounding
*"From Vision to a Workable Shape"*

**Duration:** 45-60 min
**Goal:** Translate Shelly's high-level Credibility Spine vision into a Claude-ready project structure.

### Jeremy Teaches

1. **Claude Code mental model**
   - Agent ≠ assistant
   - Claude reads files, proposes changes, you approve
   - Claude.md shapes behavior

2. **Project structure discipline**
   - `/claude` folder pattern
   - Why docs before code
   - What Claude should/shouldn't do

3. **Scoping for AI**
   - Breaking big ideas into tractable domains
   - Writing constraints that stick

### Shelly Builds (With Guidance)

1. Create project folder: `chs-credibility-spine`
2. Initialize Claude Code in the folder
3. Write `project-brief.md` in plain language:
   - What is the Credibility Spine?
   - What outcome do I want?
   - What is NOT in scope?
4. Write first `claude.md`:
   - Purpose of this project
   - Core constraints (human-in-the-loop, no automation)
   - Vocabulary definitions (credibility, receipts, curation)

### Session 1 Outputs

- [ ] Working Claude Code project Shelly understands
- [ ] `project-brief.md` written by Shelly
- [ ] `claude.md` with operational constraints
- [ ] Clear next questions (not vague overwhelm)

### Hard Stops

- No Supabase tables yet
- No schema implementation
- No automation

---

## Session 2: Structuring the Credibility Spine
*"From Ideas to a Coherent System"*

**Duration:** 45-60 min
**Goal:** Translate doctrine into structured system without turning it into bureaucracy.

### Jeremy Teaches

1. **System decomposition**
   - Entities, relationships, flows (conceptual)
   - Load-bearing vs supporting layers
   - Avoiding Goodhart's Law in design

2. **Using Claude Code for structure**
   - Testing logic through conversation
   - Spotting when structure distorts reality

3. **The four spine layers**
   - Receipts (proof)
   - Vertical research (domain intelligence)
   - Curation (what CHS points to)
   - Stewardship constraints (ethics)

### Shelly Builds (With Guidance)

1. Clarify Credibility Spine layer model
2. Draft what MUST be captured
3. Draft what MAY be captured
4. Draft what should NEVER be required
5. Write `constraints.md`
6. Draft `schema.md` (conceptual, not SQL)

### Session 2 Outputs

- [ ] Refined Credibility Spine model Shelly can explain clearly
- [ ] `constraints.md` with explicit boundaries
- [ ] `schema.md` draft (entities, fields, relationships)
- [ ] Early warning signs (failure conditions) embedded

### Hard Stops

- No Supabase deployment yet
- No production data
- No distribution logic

---

## Session 3: Building the Spine in Supabase
*"Water Justice as a Living Test Case"*

**Duration:** 60-90 min
**Goal:** Apply the Credibility Spine to one real vertical (Water Justice/IDLW) in Supabase.

### Jeremy Teaches

1. **Stress-testing against reality**
   - Does the schema hold up?
   - Keeping systems flexible without becoming vague

2. **Claude Code for implementation**
   - Generating SQL safely
   - Reviewing generated code
   - Debugging and iteration patterns

3. **Vertical intelligence**
   - Contextual authority
   - Curated reference ecosystems
   - Geographic considerations

### Shelly Builds (With Guidance)

1. Create Supabase project
2. Run core schema SQL (subjects, receipts, artifacts, etc.)
3. Insert test subjects:
   - `creative-house-studios`
   - `i-drink-living-water`
4. Add stewardship policies
5. Create Water Justice vertical outline:
   - Research domains (science, health, infrastructure, justice)
   - Types of curated references
   - Geographic considerations
6. Test RLS (anon vs authenticated reads)

### Session 3 Outputs

- [ ] Working Supabase tables
- [ ] Test data inserted
- [ ] Water Justice vertical example
- [ ] Repeatable pattern for future verticals
- [ ] Shelly can continue independently

---

## Post-Session Support

- Async email/text support for 2 weeks
- Access to troubleshooting guide
- Access to power user guide
- One 15-min check-in call (optional)

---

## Success Criteria

The pilot succeeds if:

1. Shelly has a working Supabase Credibility Spine
2. Shelly understands how to use Claude Code for future work
3. Shelly can explain the system to Glen
4. "Learn with Jeremy" has a proven, repeatable shape
5. Jeremy has clear scope, protected energy, and a playbook

---

## What This Does NOT Do

- No automation delivery
- No ongoing support commitment
- No marketing/distribution systems
- No SEO tactics
- No Jeremy taking ownership of execution

---

## Scheduling Notes

Available times from Shelly's email:
- Tomorrow 9am-11am
- Tomorrow 4pm (1 hour)
- Tomorrow 7pm (1 hour)
- Sunday/Monday evening

Recommend: 2-hour block for Session 1+2 combined if Shelly is ready.

---
january 2026 · v.00.00.01
