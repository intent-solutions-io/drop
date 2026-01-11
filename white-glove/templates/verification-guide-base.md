# intent solutions io
---

# Your Pre-Session Checklist
*Complete before our session on [DATE]*

Client: [CLIENT_NAME]
Stack: [STACK_SUMMARY]

---

## Overview

Before our phone session, we need to verify your tools are working.
This takes 10-15 minutes and saves us from debugging on the call.

---

## Step 1: Run the Verification Script (5 min)

Open Terminal and paste this command:

```bash
curl -sL https://raw.githubusercontent.com/jeremylongshore/white-glove/main/scripts/verify-prereqs.sh | bash
```

**Or download and run manually:**
1. Download: `verify-prereqs.sh`
2. Open Terminal
3. Navigate to Downloads: `cd ~/Downloads`
4. Run: `bash verify-prereqs.sh`

**Expected output:**
- All green checkmarks ✅
- "ALL CHECKS PASSED" message

**If you see red X marks:**
- Screenshot the output
- Send to jeremy@intentsolutions.io
- I'll send you fix instructions before our call

---

## Step 2: Add Me as GitHub Collaborator (2 min)

1. Go to your repository's Settings
2. Click **Collaborators** (left sidebar)
3. Click **Add people**
4. Search: `jeremylongshore`
5. Click **Add jeremylongshore to this repository**

I'll receive an email notification when you send the invite.

**Don't have a repo yet?** No problem - we'll create one together in Session 1.

---

## Step 3: Supabase Check (if applicable)

If you're using Supabase, please send me:

- [ ] Your project URL (e.g., `https://xxxx.supabase.co`)
- [ ] Screenshot of Settings > API page (blur the service_role key)

This confirms your project exists. We'll set up connections together.

**Not using Supabase?** Skip this step.

---

## What to Send Me

Before our session, email jeremy@intentsolutions.io with:

1. ✅ Screenshot of verification script output
2. ✅ Confirmation you added me as GitHub collaborator
3. ✅ Supabase URL (if applicable)

**That's it!** Once I confirm everything looks good, we're ready.

---

## Quick Fixes

### Node.js not found
```bash
# Mac with Homebrew
brew install node

# Or download from nodejs.org (choose LTS version)
```

### Claude Code not found
```bash
npm install -g @anthropic-ai/claude-code
```

Then close and reopen Terminal.

### GitHub CLI not found
```bash
# Mac with Homebrew
brew install gh

# Then authenticate
gh auth login
```

### Claude Code auth not working
Run `claude` in Terminal and follow the browser prompts to log in.

---

## Questions?

Reply to this email or text me. Happy to help before our call.

---
january 2026 · v.00.00.01
