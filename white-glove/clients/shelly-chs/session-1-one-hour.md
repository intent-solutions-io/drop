# Session 1 — One Hour Format (Teach + Copy-Paste)

**Client:** Shelly (CHS)
**Date:** Jan 11, 2026 @ 7pm
**Duration:** 60 minutes

**Format:** You explain → She copies and pastes → You verify together

---

## Pre-Session Setup

Send Shelly this message before the call:

```
Hey Shelly — for our session tonight, have these ready:

1. Terminal open (Cmd+Space, type "Terminal")
2. Your Supabase dashboard open in browser
3. Your Google Doc "2026 Possibilities" open (we'll copy from Part 3)
4. A text file or Notes app to copy prompts I'll give you

See you at 7pm!
```

---

## PHASE 1: Check-In (0:00–0:05)

### You Say:

> "Share your screen. I want to see Terminal, Supabase, and your Google Doc. We're going to work through this together — I'll explain what we're doing, then give you exact commands to copy and paste. You don't need to memorize anything."

### Verify:
- [ ] Terminal visible
- [ ] Supabase dashboard accessible
- [ ] Google Doc ready

---

## PHASE 2: Project Setup (0:05–0:20)

### Step 1: Create the Project Folder

**YOU EXPLAIN:**

> "First, we need a home for your project. Every project lives in a folder. This folder will contain your code, your documentation, and your rules for Claude. Think of it as the single source of truth for CHS Credibility Spine."

**SHELLY COPIES AND PASTES:**

```bash
mkdir -p ~/Projects/creative-house-studios && cd ~/Projects/creative-house-studios
```

**YOU VERIFY:**

> "You should see your Terminal prompt change to show you're in that folder. What does it say?"

---

### Step 2: Initialize Git

**YOU EXPLAIN:**

> "Now we turn this folder into a git repository. Git is your undo button. Every time you save your work with git, it's like taking a snapshot. If something breaks tomorrow, you can go back to today's snapshot. This is the single most important safety net when working with AI — you can always undo."

**SHELLY COPIES AND PASTES:**

```bash
git init
```

**YOU VERIFY:**

> "You should see 'Initialized empty Git repository'. That means git is now watching this folder."

---

### Step 3: Create CLAUDE.md

**YOU EXPLAIN:**

> "This is the most important file in your project. CLAUDE.md is Claude's brain. When you run Claude Code, it reads this file FIRST, before you say anything. This is where you put your rules, your constraints, your project context. Claude will follow what's in this file. Your doctrine — all that work you did — this is where it lives in code form."

**SHELLY COPIES AND PASTES:**

```bash
cat > CLAUDE.md << 'EOF'
# CLAUDE.md

CHS Credibility Spine — receipts-based verification infrastructure.

## What This Project Is

A system for tracking claims, evidence, and verification. Every claim must be backed by a receipt. No silent rewrites. Append-only history.

## Rules for Claude

- Never delete data — append only
- Ask before creating new tables
- All database changes via SQL (not direct edits)
- When unsure, ask — don't guess

## Stack

- Database: Supabase (Postgres + Row Level Security)
- This folder is the source of truth

## Key Tables

- subjects: People, orgs, or entities being tracked
- domains: Areas of credibility (water, sobriety, etc.)
- research_items: Evidence and source material
- receipts: Verified claims with provenance

EOF
```

**YOU VERIFY:**

> "Let's make sure it worked. Copy and paste this to see the file:"

**SHELLY COPIES AND PASTES:**

```bash
cat CLAUDE.md
```

> "You should see everything we just wrote. This is Claude's instructions. Every time you run Claude in this folder, it reads this first."

---

### Step 4: First Commit (Save Point)

**YOU EXPLAIN:**

> "Now we take our first snapshot. In git, this is called a 'commit'. Think of it as saving your game. Right now, your project is clean — just the folder and CLAUDE.md. Let's save this state so we can always come back to it."

**SHELLY COPIES AND PASTES:**

```bash
git add -A && git commit -m "Initial project setup with CLAUDE.md"
```

**YOU VERIFY:**

> "You should see something like '1 file changed, X insertions'. That's your first save point. If anything breaks from here on, we can always come back to this moment."

---

## PHASE 3: Deploy Supabase Schema (0:20–0:40)

### Step 1: Open SQL Editor

**YOU EXPLAIN:**

> "Now the main event. Your Google Doc has a complete database schema — all those tables you designed. We're going to paste that into Supabase and make it real. Your schema is the contract. Once these tables exist, Claude can't invent fields that don't exist. The database enforces your rules."

**SHELLY DOES:**

> "In your Supabase dashboard, click 'SQL Editor' in the left sidebar."

---

### Step 2: Paste Your Schema

**YOU EXPLAIN:**

> "Go to your Google Doc, Part 3, where you have all the CREATE TABLE statements. Select everything — all the SQL. Copy it."

**SHELLY DOES:**

1. Go to Google Doc
2. Find Part 3 (SQL schema)
3. Copy all CREATE TABLE statements

**YOU SAY:**

> "Now paste that into the SQL Editor in Supabase. Don't run it yet — let me see it first."

**YOU VERIFY:**

> "I should see CREATE TABLE statements for subjects, domains, research_items, receipts, and any other tables you defined. Does it look complete?"

---

### Step 3: Run the Schema

**YOU EXPLAIN:**

> "When you click Run, Supabase will create all these tables. They'll be real. Empty, but real. This is the moment your architecture becomes infrastructure."

**SHELLY DOES:**

> "Click the green 'Run' button."

**IF ERROR — YOU EXPLAIN:**

> "Errors are normal. Read the message — it usually tells you exactly what's wrong. Most common: a typo, a missing semicolon, or a table that already exists. Let's fix it together."

**YOU VERIFY:**

> "Now click 'Table Editor' in the left sidebar. You should see your tables listed. How many do you see?"

---

### Step 4: Test Insert

**YOU EXPLAIN:**

> "Let's prove it works. We'll insert one real record — Creative House Studios as a subject. This is real data in your real database."

**SHELLY COPIES AND PASTES (in SQL Editor):**

```sql
INSERT INTO subjects (type, name, slug, primary_domain)
VALUES ('org', 'Creative House Studios', 'creative-house-studios', 'credibility');
```

**THEN:**

```sql
SELECT * FROM subjects;
```

**YOU VERIFY:**

> "You should see one row — Creative House Studios. That's real data. Your schema is deployed and working."

---

## PHASE 4: First Claude Code Run (0:40–0:55)

### Step 1: Open Claude Code

**YOU EXPLAIN:**

> "Now let's connect Claude to your project. Claude Code reads your CLAUDE.md first, so it already knows your rules before you say anything. This is the difference between Claude guessing and Claude knowing."

**SHELLY COPIES AND PASTES:**

```bash
cd ~/Projects/creative-house-studios && claude
```

**YOU VERIFY:**

> "You should see Claude Code start up. It might take a few seconds. Once you see the prompt, you're ready."

---

### Step 2: First Prompt

**YOU EXPLAIN:**

> "Now you're going to give Claude its first task. Notice how specific this prompt is — we're telling Claude what just happened and asking for something concrete. The more context you give, the better Claude performs."

**SHELLY COPIES AND PASTES (into Claude Code):**

```
I just deployed the Supabase schema for CHS Credibility Spine. The tables are live.

Read my CLAUDE.md to understand the project.

Then suggest 3 seed entries for the "domains" table that would make sense for this system. Give me the INSERT statements I can run in Supabase.
```

**YOU WATCH TOGETHER:**

Claude will generate suggestions.

**YOU EXPLAIN:**

> "Now look at what Claude suggested. Does this make sense for your system? You're the decision maker. Claude is the copilot, you're the pilot. If you like it, we'll run it. If not, tell Claude what to change."

---

### Step 3: Execute or Refine

**IF SHE APPROVES:**

> "Copy Claude's INSERT statement, go to Supabase SQL Editor, and run it. Then verify in Table Editor."

**IF SHE WANTS CHANGES:**

> "Tell Claude what's wrong. Be specific. 'I want domains focused on X instead' or 'Change Y to Z'. Claude will adjust."

---

### Step 4: Save the Session

**YOU EXPLAIN:**

> "Let's save your progress. We'll commit again so this work is captured."

**SHELLY COPIES AND PASTES (back in Terminal, after exiting Claude with Ctrl+C or /exit):**

```bash
git add -A && git commit -m "Add initial seed data for domains"
```

---

## PHASE 5: Wrap & Homework (0:55–1:00)

### Confirm Independence

**YOU SAY:**

> "Before we wrap, show me you can do this independently. Open a new Terminal tab, navigate to your project, and run Claude."

**SHELLY COPIES AND PASTES:**

```bash
cd ~/Projects/creative-house-studios && claude
```

**IF SHE CAN — SUCCESS.**

---

### Homework Prompts

**YOU EXPLAIN:**

> "Before our next session, I want you to do three things. I'm going to give you exact prompts for each one."

---

**HOMEWORK 1: Seed More Data**

> "Use Claude to add 3 more entries to any table you want. Here's a prompt you can copy:"

```
Look at my current Supabase schema. I want to add 3 seed entries to the [TABLE_NAME] table.

Suggest entries that would make sense for CHS Credibility Spine. Give me the INSERT statements.
```

> "Replace [TABLE_NAME] with whatever table you want to seed — research_items, receipts, whatever interests you. Run the INSERT in Supabase yourself."

---

**HOMEWORK 2: Push to GitHub**

> "This backs up your project to the cloud and lets me see your progress. Copy and paste this:"

```bash
gh repo create CHS-Labs/creative-house-studios --private --source=. --push
```

> "If it asks you to authenticate, follow the prompts. Once done, your code is backed up on GitHub."

---

**HOMEWORK 3: Add Me as Collaborator**

> "This lets me review your work before Session 2:"

```bash
gh repo add-collaborator jeremylongshore
```

---

### End the Call

> "You did great. Your schema is deployed, git is tracking your work, and you ran Claude on your project. That's a real foundation. See you next session."

**END ON TIME.**

---

## Quick Reference: All Copy-Paste Commands

For Shelly to have in one place:

```bash
# Create project folder
mkdir -p ~/Projects/creative-house-studios && cd ~/Projects/creative-house-studios

# Initialize git
git init

# Create CLAUDE.md (copy the full cat command from Step 3 above)

# View CLAUDE.md
cat CLAUDE.md

# First commit
git add -A && git commit -m "Initial project setup with CLAUDE.md"

# Test insert (in Supabase SQL Editor)
INSERT INTO subjects (type, name, slug, primary_domain)
VALUES ('org', 'Creative House Studios', 'creative-house-studios', 'credibility');

SELECT * FROM subjects;

# Start Claude Code
cd ~/Projects/creative-house-studios && claude

# Save progress
git add -A && git commit -m "Add initial seed data"

# Push to GitHub
gh repo create CHS-Labs/creative-house-studios --private --source=. --push

# Add Jeremy as collaborator
gh repo add-collaborator jeremylongshore
```

---

## Success Criteria

At the end of 60 minutes:

- [ ] CLAUDE.md exists (she understands why)
- [ ] Git repo with at least 1 commit (she understands undo)
- [ ] Supabase tables deployed (she sees them)
- [ ] At least 1 record inserted (she proved it works)
- [ ] She ran Claude Code independently (she knows the command)
- [ ] Homework prompts are clear (she has copy-paste ready)
