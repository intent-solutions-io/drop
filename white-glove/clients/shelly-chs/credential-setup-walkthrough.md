# intent solutions io
---

# Credential Setup Walkthrough
*Get your keys and tokens ready before our session*

---

## Why You Need This

Claude Code connects to your tools through **API keys** and **tokens**. These are like passwords that let Claude work with GitHub, Supabase, and other services on your behalf.

We'll set these up together, but gathering them beforehand saves time.

**You keep all credentials. I never see them. You type them yourself.**

---

## Your Stack Discovery

Before we start, list everything you use. Check what applies:

### Code & Deployment
- [ ] GitHub (you have this)
- [ ] Bolt.new
- [ ] Vercel
- [ ] Netlify
- [ ] Railway
- [ ] Other: _______________

### Database & Backend
- [ ] Supabase
- [ ] Firebase
- [ ] Airtable
- [ ] Other: _______________

### Analytics & Monitoring
- [ ] Plausible
- [ ] Google Analytics
- [ ] PostHog
- [ ] Other: _______________

### AI & Automation
- [ ] Claude (browser sign-in ✓)
- [ ] OpenAI / ChatGPT
- [ ] n8n
- [ ] Zapier / Make
- [ ] Other: _______________

### Communication
- [ ] Slack
- [ ] Discord
- [ ] Email service (Resend, Sendgrid, etc.)
- [ ] Other: _______________

### Other Tools
- _______________
- _______________
- _______________

---

## What You'll Need

| Service | What to Get | Priority |
|---------|-------------|----------|
| GitHub CLI | Install `gh` + authenticate | **Required** |
| Supabase | Project URL + API Keys | Required for Spine |
| Bolt.new | API key (if available) | If you use it |
| Plausible | API key + Site ID | For analytics |

**Claude Code:** You use browser sign-in - no API key needed.

---

## 1. GitHub CLI (gh) - REQUIRED

The `gh` command lets Claude Code work with GitHub directly from Terminal.

### Install GitHub CLI

Open Terminal and run:

```bash
# Mac with Homebrew
brew install gh

# Verify it installed
gh --version
```

### Authenticate

```bash
gh auth login
```

You'll see prompts:

```
? What account do you want to log into?
> GitHub.com

? What is your preferred protocol for Git operations?
> HTTPS

? Authenticate Git with your GitHub credentials?
> Yes

? How would you like to authenticate GitHub CLI?
> Login with a web browser
```

A browser opens. Sign in. Authorize. Done.

### Verify It Works

```bash
gh auth status
```

Should show: `Logged in to github.com as [your-username]`

---

## 2. GitHub Personal Access Token

Even with `gh` CLI, Claude Code needs a token for some operations.

### Steps:

1. Go to: **github.com** → Sign in
2. Click your **profile picture** (top right)
3. Click **Settings**
4. Scroll down left sidebar → Click **Developer settings**
5. Click **Personal access tokens** → **Tokens (classic)**
6. Click **Generate new token** → **Generate new token (classic)**
7. Fill in:
   - **Note:** `Claude Code Access`
   - **Expiration:** 90 days (or longer)
   - **Scopes:** Check these boxes:
     - [x] `repo` (full control of repositories)
     - [x] `workflow` (GitHub Actions)
     - [x] `read:org` (if you use organizations)
8. Click **Generate token**
9. **COPY THE TOKEN NOW** - you won't see it again

### Save It:

```
GITHUB_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxx
```

---

## 3. Supabase Credentials

For the Credibility Spine database.

### Steps:

1. Go to: **supabase.com** → Sign in
2. Select your project (or we'll create one together)
3. Click **Settings** (gear icon, left sidebar)
4. Click **API** (under Configuration)
5. Copy these values:

### What to Copy:

```
SUPABASE_URL=https://xxxxxxxxxxxx.supabase.co
SUPABASE_ANON_KEY=eyJhbG...
SUPABASE_SERVICE_ROLE_KEY=eyJhbG...
```

**Note:** If you don't have a Supabase project yet, we'll create one in Session 3. Skip this for now.

---

## 4. Bolt.new (If You Use It)

Bolt is for AI-generated code deployments.

### Check If You Need This:

- Do you use Bolt.new to generate/deploy code?
- Do you want Claude Code to work with Bolt projects?

### Get API Access:

1. Go to: **bolt.new**
2. Sign in
3. Look for: Settings → API or Developer
4. If available, generate an API key

```
BOLT_API_KEY=
```

**Note:** Bolt may not have API access yet. We can work around this.

---

## 5. Plausible Analytics

For privacy-friendly analytics.

### Steps:

1. Go to: **plausible.io** → Sign in
2. Click your **site**
3. Click **Settings** (gear icon)
4. Click **Visibility** → **Shared Links** (for embeds)
   - Or: **API Keys** (for full access)
5. Create/copy your key

### What to Copy:

```
PLAUSIBLE_API_KEY=
PLAUSIBLE_SITE_ID=your-domain.com
```

---

## 6. Other Tools

For each tool in your stack, look for:
- Settings → API
- Settings → Developer
- Settings → Integrations
- Account → API Keys

### Template for Each:

```
[TOOL_NAME]_API_KEY=
[TOOL_NAME]_URL=
```

---

## Your Credential Sheet

Fill this in as you gather credentials. **Keep this private.**

```
# Shelly's Credentials
# Created: [date]
# DO NOT SHARE THIS FILE

# ================================
# REQUIRED
# ================================

# GitHub (after gh auth login)
GITHUB_TOKEN=

# ================================
# FOR CREDIBILITY SPINE
# ================================

# Supabase
SUPABASE_URL=
SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# ================================
# YOUR OTHER TOOLS
# ================================

# Bolt.new
BOLT_API_KEY=

# Plausible
PLAUSIBLE_API_KEY=
PLAUSIBLE_SITE_ID=

# [Add others as needed]


# ================================
# NOTES
# ================================
# - Delete this file after we set up .env together
# - Never commit credentials to GitHub
# - Never send credentials over email
```

---

## Claude Code Authentication

**You use browser sign-in - this is already set up.**

If you ever need to re-authenticate:

```bash
claude
# It will open a browser if needed
```

No API key required for your setup.

---

## Connecting Everything

Once you have credentials, here's how we'll connect them:

### On Our Call Together:

1. Open Terminal
2. Navigate to your project:
   ```bash
   cd ~/your-project-folder
   ```

3. Create environment file:
   ```bash
   touch .env
   ```

4. Add your credentials:
   ```bash
   open .env
   ```

   Paste your credentials (you type, I guide)

5. Protect the file:
   ```bash
   echo ".env" >> .gitignore
   ```

6. Test connections:
   ```bash
   gh auth status          # GitHub CLI
   claude                  # Then ask Claude to test connections
   ```

---

## Before Our Session

**Required:**
- [ ] GitHub CLI installed (`brew install gh`)
- [ ] GitHub CLI authenticated (`gh auth login`)
- [ ] GitHub Personal Access Token generated and saved

**For Credibility Spine:**
- [ ] Supabase credentials copied (or we create project together)

**Your Other Tools:**
- [ ] List completed (stack discovery above)
- [ ] API keys gathered for tools you want Claude to access

---

## Quick Reference

| Tool | Where to Get Credentials |
|------|--------------------------|
| GitHub Token | github.com → Settings → Developer settings → Personal access tokens |
| Supabase | supabase.com → Project → Settings → API |
| Plausible | plausible.io → Site → Settings → API Keys |
| Bolt | bolt.new → Settings (if available) |
| General | [Tool] → Settings → API / Developer / Integrations |

---

## Questions to Answer Before Session

1. What tools do you use daily?
2. Which ones should Claude Code be able to access?
3. Any tools with sensitive data we should NOT connect?
4. Where is your current project work? (which folder on your Mac)

---
january 2026 · v.00.00.01
