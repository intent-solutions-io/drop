# Session 1 Prep - Jeremy's Guide

**Client:** Shelly (CHS)
**Date:** Jan 11, 2026 @ 7pm
**Duration:** ~2 hours

---

## Pre-Session: What Shelly Already Has

She's done 90% of the thinking. From her Google Doc:

| Asset | Status | Location |
|-------|--------|----------|
| CHS Credibility Spine doctrine | Complete | Google Doc |
| Supabase SQL schema | Ready to paste | Google Doc (Part 3) |
| RLS policies | Defined | Google Doc |
| Domain + Context seed data | Written | Google Doc |
| SOW boundaries (Part 0→1→2) | Documented | Google Doc |
| Claude.md template | Drafted | Google Doc |
| Stop conditions | Listed | Google Doc |

**Key insight:** She wrote the playbook. Session 1 is about executing it together.

---

## Session 1 Agenda

### Phase 1: Grounding (15 min)

**What you teach:**
- How Claude Code sees projects (context window, CLAUDE.md, folder structure)
- Why structure before code matters
- The difference between "AI as generator" vs "AI as thinking partner"

**What you do:**
- Open Terminal, navigate to her Projects folder
- Show her `claude` command basics
- Explain how you're going to work together

### Phase 2: Project Setup (30 min)

**What you teach:**
- Why git matters for AI work (rollback is the superpower)
- CLAUDE.md as the "brain" of the project
- Folder structure conventions

**What you do together:**
1. Create the `creative-house-studios` folder (if not exists)
2. Initialize git: `git init`
3. Create initial CLAUDE.md from her doctrine
4. Create folder structure:
   ```
   creative-house-studios/
   ├── CLAUDE.md
   ├── docs/
   │   └── credibility-spine-doctrine.md
   ├── supabase/
   │   └── migrations/
   └── .env.example
   ```
5. First commit: `git commit -m "Initial CHS Credibility Spine project"`

### Phase 3: Supabase Deployment (45 min)

**What you teach:**
- How to read SQL (she doesn't need to write it)
- What migrations are and why they matter
- How RLS policies protect data

**What you do together:**
1. Open her Supabase dashboard
2. Go to SQL Editor
3. Paste her schema from Google Doc (Part 3)
4. Run it together
5. Watch tables appear
6. Test with sample insert:
   ```sql
   INSERT INTO subjects (type, name, slug, primary_domain)
   VALUES ('org', 'Creative House Studios', 'creative-house-studios', 'credibility infrastructure');
   ```
7. Show her the Table Editor view

### Phase 4: First Claude Code Session (30 min)

**What you teach:**
- How to prompt Claude Code for database work
- The "read first, then act" pattern
- Stop conditions (when Claude should ask permission)

**What you do together:**
1. In her project folder, run `claude`
2. Paste her doctrine summary into Claude
3. Ask Claude to suggest seed data for `domains` table
4. Review together, then execute
5. Show her how to verify in Supabase

### Phase 5: Wrap & Next Steps (15 min)

**What you confirm:**
- She understands the project structure
- She can open Claude Code independently
- She knows how to check Supabase dashboard
- She has a clear next action

**What you assign for Session 2:**
- Seed 3-5 research_items for Water Justice vertical
- Push the repo to GitHub (you walk through this if needed)
- Add `jeremylongshore` as collaborator

---

## Key Teaching Moments

### 1. "Claude needs context to help"
Show her: without CLAUDE.md, Claude guesses. With it, Claude knows the rules.

### 2. "Git is your undo button"
When AI makes a mistake (it will), `git diff` shows what changed, `git checkout` reverts it.

### 3. "The schema is the contract"
Her Supabase schema IS the data model. Claude can't invent fields that don't exist.

### 4. "Stop conditions are the safety net"
Point to her own stop-conditions in the doc. These prevent Claude from going rogue.

---

## What NOT To Do

- Don't build for her (she builds, you guide)
- Don't touch Part 2 (distribution) - that's out of scope
- Don't over-explain (she's smart, keep it moving)
- Don't skip the git setup (it's foundational)

---

## Her Public Repos (Reference)

If she wants to show you existing work:

| Repo | What | URL |
|------|------|-----|
| the-simple-plan-new | Sobriety tracker (her main app) | github.com/CHS-Labs/the-simple-plan-new |
| shellyfrankwebsite | Personal site (StackBlitz) | github.com/CHS-Labs/shellyfrankwebsite |
| waterx-north-v1 | Water project | github.com/CHS-Labs/waterx-north-v1 |

Note: `the-simple-plan-new` has Supabase in package.json but uses localStorage. Phase 2 of Simple Plan will integrate Supabase - separate project from Credibility Spine.

---

## Her Stack (Verified)

| Tool | Status |
|------|--------|
| Claude Code | v2.1.3 |
| Node.js | v22.19.0 |
| GitHub | @CHS-Labs |
| Supabase | Connected |
| n8n Cloud | 18 workflows |
| Plausible | 3 sites |
| Resend | 2 domains |

---

## Success Criteria for Session 1

- [ ] CLAUDE.md exists and is correct
- [ ] Git repo initialized with first commit
- [ ] Supabase schema deployed (tables visible)
- [ ] At least 1 subject inserted (CHS)
- [ ] Shelly ran `claude` independently at least once
- [ ] Next steps are clear (seed data + GitHub push)
