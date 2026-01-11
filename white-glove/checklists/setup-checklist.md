# Setup Call Checklist

*For the onboarding specialist during the call.*

---

## Before the Call

- [ ] Reviewed pre-call questionnaire
- [ ] Prepared custom CLAUDE.md draft
- [ ] Tested screen sharing setup
- [ ] Have troubleshooting guide ready

---

## During the Call

### 1. Intro (2 min)
- [ ] Confirm their name and role
- [ ] Quick overview of what we'll cover
- [ ] Ask if they have questions before starting

### 2. Installation (5-10 min)
- [ ] Have them share screen
- [ ] Open Terminal (Cmd + Space → Terminal)
- [ ] Check Node.js: `node --version`
  - [ ] If missing: Guide through nodejs.org install
- [ ] Install Claude Code: `npm install -g @anthropic-ai/claude-code`
- [ ] Wait for completion
- [ ] Run `claude` to authenticate
- [ ] Confirm browser opens and they sign in

### 3. First Run (5 min)
- [ ] Navigate to a project folder together
- [ ] Run `claude`
- [ ] Try first prompt: "What is this project?"
- [ ] Show them the output
- [ ] Celebrate first success! 🎉

### 4. CLAUDE.md Setup (5 min)
- [ ] Explain what CLAUDE.md does
- [ ] Create file together or paste template
- [ ] Customize key sections:
  - [ ] Project description
  - [ ] Tech stack
  - [ ] Preferences

### 5. Workflow Demo (5-10 min)
Based on their role, show relevant workflow:

**Developers:**
- [ ] "Fix this bug" demo
- [ ] "Explain this code" demo
- [ ] Show `/compact` command

**Writers:**
- [ ] "Help me outline" demo
- [ ] "Improve this paragraph" demo

**Analysts:**
- [ ] "Write a SQL query for" demo
- [ ] "Analyze this data" demo

### 6. Q&A (5 min)
- [ ] Answer their questions
- [ ] Show `/help` command
- [ ] Explain how to get support

---

## After the Call

- [ ] Send follow-up email (template below)
- [ ] Attach final CLAUDE.md
- [ ] Attach relevant guides
- [ ] Schedule follow-up call (Tier 3+)
- [ ] Add to support list

---

## Follow-Up Email Template

```
Subject: Your Claude Code Setup - Resources Inside

Hi [Name],

Great setting up Claude Code with you today!

Here's everything we covered:

**Your Custom CLAUDE.md** (attached)
Drop this in your project root folder.

**Quick Start Guide** (attached)
Reference for common commands and workflows.

**Your next steps:**
1. Use Claude Code for one task today
2. Customize your CLAUDE.md as you learn preferences
3. Reply to this email with any questions

[For Tier 3+]
Our follow-up call is scheduled for [date/time].

You've got this!

Jeremy
Intent Solutions
```
