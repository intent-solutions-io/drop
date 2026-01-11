# intent solutions io
---

# Shelly Pre-Session Verification
*Complete before Session 1*

---

## Verification Status

| Check | Status | Notes |
|-------|--------|-------|
| Stack Discovery Form | ⏳ Pending | Send form link |
| verify-prereqs.sh | ⏳ Pending | Awaiting screenshot |
| GitHub collaborator | ⏳ Pending | Awaiting invite to jeremylongshore |
| Supabase URL | ⏳ Pending | Optional - can create in Session 3 |

**Last updated:** [DATE]

---

## What Shelly Needs to Send You

Ask Shelly to send:

1. **Screenshot of Terminal showing:**
   ```bash
   node --version
   claude --version
   ```

2. **GitHub username** (so you can confirm collaborator access)

3. **Supabase project URL** (optional - can create together in Session 3)

---

## Your Verification Checklist

### 1. Node.js ✓
- [ ] `node --version` returns v18+ or v20+
- [ ] If missing: Send `01-terminal-101.md` + nodejs.org link

### 2. Claude Code ✓
- [ ] `claude --version` returns version number
- [ ] If missing: Send `08-claude-code-install.md`
- [ ] If auth fails: Walk through browser auth on call

### 3. GitHub ✓
- [ ] Shelly has GitHub account
- [ ] You (`jeremylongshore`) are added as collaborator
- [ ] Verify: Check your GitHub notifications for invite

**To verify collaborator access:**
1. Go to github.com/[shelly-username]/[repo-name]
2. You should see the repo (not 404)
3. Settings tab visible = you have write access

### 4. Repository Ready ✓
- [ ] Repo exists: `chs-credibility-spine` (or similar)
- [ ] You can clone it locally
- [ ] Basic folder structure exists (or create in Session 1)

---

## Quick Fix Commands

If Shelly has issues, walk her through:

**Node.js missing:**
```bash
# Mac with Homebrew
brew install node

# Or download from nodejs.org (LTS version)
```

**Claude Code missing:**
```bash
npm install -g @anthropic-ai/claude-code
```

**Claude Code not found after install:**
```bash
# Close Terminal completely (Cmd+Q)
# Reopen Terminal
claude --version
```

**GitHub collaborator not working:**
1. Shelly goes to: github.com/[her-username]/[repo]/settings/access
2. Clicks "Add people"
3. Searches: `jeremylongshore`
4. Sends invite
5. You accept via email or github.com/notifications

---

## Pre-Session Email Template

```
Subject: Before Our Session - Quick Setup Check

Hi Shelly,

Before our first session, please send me:

1. A screenshot of Terminal showing these two commands:
   node --version
   claude --version

2. Your GitHub username

3. Confirm you've added me (jeremylongshore) as a collaborator
   to your repository

If any of those commands don't work, no worries -
we'll fix it together. Just let me know.

Talk soon,
Jeremy
```

---

## Session 1 Go/No-Go

**Go if:**
- Node.js working
- Claude Code working OR you can install on call
- GitHub account exists
- You have collaborator access OR can set up on call

**Delay if:**
- No Mac access (wrong device)
- Can't install anything (IT restrictions)
- No GitHub possible (company policy)

---
january 2026 · v.00.00.01
