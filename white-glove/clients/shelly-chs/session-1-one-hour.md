# Session 1 — One Hour Format

**Client:** Shelly (CHS)
**Date:** Jan 11, 2026 @ 7pm
**Duration:** 60 minutes (hard stop)

---

## The Goal

**One deliverable:** Her Supabase schema deployed and working.
**One skill:** She can run Claude Code on her project independently.

---

## Minute-by-Minute Breakdown

### 0:00–0:05 — Check-In (5 min)

- "Show me your screen"
- Verify: Terminal open, Supabase dashboard accessible, Google Doc ready
- No small talk — she's prepared, respect that

---

### 0:05–0:15 — Project Setup (10 min)

**You do together:**

```bash
mkdir -p ~/Projects/creative-house-studios
cd ~/Projects/creative-house-studios
git init
```

**Create CLAUDE.md** (paste minimal version):

```markdown
# CLAUDE.md

CHS Credibility Spine — receipts-based verification infrastructure.

## Rules
- Never delete data (append-only)
- Ask before creating tables
- All changes via migrations

## Stack
- Supabase (Postgres + RLS)
- This folder is the source of truth
```

**First commit:**

```bash
git add -A && git commit -m "Initial project setup"
```

**Teaching moment:** "Git is your undo button. Every commit is a save point."

---

### 0:15–0:35 — Deploy Supabase Schema (20 min)

**The big win — this is why she's here.**

1. Open her Supabase dashboard → SQL Editor
2. She pastes her schema from Google Doc (Part 3)
3. Click "Run"
4. Watch tables appear in Table Editor

**If errors:** Fix together, explain what went wrong (she learns from the fix)

**Test insert:**

```sql
INSERT INTO subjects (type, name, slug, primary_domain)
VALUES ('org', 'Creative House Studios', 'creative-house-studios', 'credibility');

SELECT * FROM subjects;
```

**Teaching moment:** "The schema is the contract. Claude can't invent fields that don't exist."

---

### 0:35–0:50 — First Claude Code Run (15 min)

**In her project folder:**

```bash
claude
```

**Prompt to give Claude:**

> Read CLAUDE.md. I just deployed the Supabase schema for CHS Credibility Spine. Suggest 3 seed entries for the `domains` table that would make sense for this system.

**Together:**
- Review Claude's suggestion
- Decide yes/no
- If yes, run the INSERT in Supabase
- Verify in Table Editor

**Teaching moment:** "Claude needs context to help. CLAUDE.md is the context."

---

### 0:50–0:60 — Wrap & Next Steps (10 min)

**Confirm she can do independently:**
- [ ] Open Terminal, navigate to project
- [ ] Run `claude`
- [ ] Check Supabase dashboard

**Assign homework (before Session 2):**

1. Seed 3 more entries in any table (her choice)
2. Push repo to GitHub:
   ```bash
   gh repo create CHS-Labs/creative-house-studios --private --source=. --push
   ```
3. Add collaborator:
   ```bash
   gh repo add-collaborator jeremylongshore
   ```

**End on time.** Don't overrun.

---

## What You Skip (Save for Session 2)

- Folder structure conventions (she'll figure it out)
- RLS policies deep dive
- Stop conditions discussion
- Migration file organization

---

## If You're Running Behind

| At minute | Cut this |
|-----------|----------|
| 20 | Skip test INSERT, just verify tables exist |
| 35 | Skip Claude Code entirely, homework instead |
| 50 | Give homework verbally, no walkthrough |

---

## Success = Three Things

1. **Schema deployed** (tables visible in Supabase)
2. **First commit made** (git repo exists)
3. **She ran `claude` once** (knows the command works)

If all three happen, Session 1 is a win.

---

## Key Phrases to Use

- "You already did the hard part — the thinking"
- "Git is your undo button"
- "The schema is the contract"
- "Claude needs context to help"

---

## Key Phrases to Avoid

- "Let me just do this quickly" (she does it, you guide)
- "This is complicated" (it's not, for her level)
- "We'll cover that later" (say what it is, just not now)
