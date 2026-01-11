# intent solutions io

---

# Your Pre-Session Checklist
*Complete before our session*

---

## Overview

Before our phone session, complete these steps (15-20 min total). This ensures we don't spend session time on setup.

**What you'll do:**
1. Install GitHub CLI
2. Create GitHub Personal Access Token
3. Run verification script
4. Add me as collaborator

---

## Step 1: Install GitHub CLI (5 min)

The `gh` command lets Claude Code work with GitHub from Terminal.

### Mac (with Homebrew)

Open Terminal and run:

```
brew install gh
```

**Don't have Homebrew?** Install it first:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Verify Installation

```
gh --version
```

Should show: `gh version 2.x.x`

---

## Step 2: Authenticate GitHub CLI (2 min)

Run this command:

```
gh auth login
```

When prompted, choose:
- **Account:** GitHub.com
- **Protocol:** HTTPS
- **Authenticate Git:** Yes
- **How to authenticate:** Login with a web browser

A browser opens → Sign in → Authorize → Done.

### Verify It Works

```
gh auth status
```

Should show: `Logged in to github.com as [your-username]`

---

## Step 3: Create GitHub Personal Access Token (5 min)

Claude Code needs a token for some operations.

### Steps:

1. Go to: **github.com** → Sign in
2. Click your **profile picture** (top right)
3. Click **Settings**
4. Scroll down left sidebar → Click **Developer settings**
5. Click **Personal access tokens** → **Tokens (classic)**
6. Click **Generate new token** → **Generate new token (classic)**

### Fill in the form:

- **Note:** `Claude Code Access`
- **Expiration:** 90 days (or longer)
- **Scopes:** Check these boxes:
  - [x] `repo` (full control of repositories)
  - [x] `workflow` (GitHub Actions)

7. Click **Generate token**
8. **COPY THE TOKEN NOW** - you won't see it again!

### Save your token

Create a private note with:
```
GITHUB_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxx
```

Keep this safe. You'll use it during our session.

---

## Step 4: Run Verification Script (2 min)

Download and run the attached `verify-prereqs.sh`:

```
cd ~/Downloads
bash verify-prereqs.sh
```

### Expected Output

You should see all green checkmarks:

```
[PASS]  Node.js installed
[PASS]  Node.js version 18+
[PASS]  npm installed
[PASS]  Claude Code installed
[PASS]  GitHub CLI (gh) installed
[PASS]  GitHub CLI authenticated
[PASS]  Claude config exists

ALL CHECKS PASSED - Ready for your session!
```

### If you see red X marks:

**Node.js missing:**
```
brew install node
```

**Claude Code missing:**
```
npm install -g @anthropic-ai/claude-code
```
Then close and reopen Terminal.

**GitHub CLI not authenticated:**
```
gh auth login
```

Run the script again after fixes.

---

## Step 5: Add Me as GitHub Collaborator (2 min)

1. Go to your repository on GitHub
2. Click **Settings** (tab at top)
3. Click **Collaborators** (left sidebar)
4. Click **Add people**
5. Search: `jeremylongshore`
6. Click **Add jeremylongshore to this repository**

I'll get an email when you send the invite.

**Don't have a repo yet?** No problem - we'll create one together.

---

## What to Send Me

Reply to my email with:

1. **Screenshot** of verification script output (all green)
2. **Confirmation** you added me as collaborator
3. **Your Supabase project URL** (if you have one, otherwise skip)

---

## Supabase Setup (If Applicable)

If you're using Supabase, gather these before our session:

1. Go to: **supabase.com** → Sign in
2. Select your project
3. Click **Settings** (gear icon)
4. Click **API**
5. Note these values (keep private):

```
Project URL: https://xxxx.supabase.co
anon/public key: eyJhbG...
service_role key: eyJhbG... (keep secret!)
```

**No Supabase project yet?** We'll create one together in our session.

---

## Quick Fixes Reference

| Problem | Solution |
|---------|----------|
| `brew: command not found` | Install Homebrew first (see Step 1) |
| `node: command not found` | `brew install node` |
| `claude: command not found` | `npm install -g @anthropic-ai/claude-code` |
| `gh: command not found` | `brew install gh` |
| Can't authenticate gh | Try `gh auth login` again, use browser option |
| Token not working | Generate a new one, make sure you copied it |

---

## Questions?

Reply to my email or text me. Happy to help before our call.

---

january 2026 · v.00.00.01
