# intent solutions io

---

# Complete Stack Verification Guide
*Verify ALL your connections before our session*

---

## How This Works

You have Claude Code installed. For each service you use, you'll:
1. Get your credentials ready
2. Paste a verification prompt into Claude Code
3. Report what worked / what failed

This ensures we don't waste session time debugging connections.

---

## Part 1: Your Stack Checklist

Check everything you use:

**Code & Version Control**
- [ ] GitHub

**Database & Backend**
- [ ] Supabase
- [ ] Firebase
- [ ] Airtable

**Deployment**
- [ ] Vercel
- [ ] Netlify
- [ ] Railway
- [ ] Bolt.new

**Automation**
- [ ] n8n
- [ ] Zapier
- [ ] Make

**Analytics**
- [ ] Plausible
- [ ] Google Analytics

**Other**
- [ ] _________________
- [ ] _________________

---

## Part 2: Gather Credentials

For each service you checked, get the credentials below.

### GitHub
**Where:** github.com → Settings → Developer settings → Personal access tokens → Tokens (classic)

Create token with scopes:
- [x] repo
- [x] workflow

```
GITHUB_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxx
```

---

### Supabase
**Where:** supabase.com → Your Project → Settings → API

```
SUPABASE_URL=https://xxxxxxxxxxxx.supabase.co
SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
SUPABASE_SERVICE_ROLE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

---

### n8n
**Where:** Your n8n instance → Settings → API

```
N8N_URL=https://your-n8n-instance.com
N8N_API_KEY=n8n_api_xxxxxxxxxxxx
```

---

### Vercel
**Where:** vercel.com → Settings → Tokens

```
VERCEL_TOKEN=xxxxxxxxxxxx
```

---

### Netlify
**Where:** netlify.com → User settings → Applications → Personal access tokens

```
NETLIFY_TOKEN=xxxxxxxxxxxx
```

---

### Plausible
**Where:** plausible.io → Site Settings → Visibility → API Keys

```
PLAUSIBLE_API_KEY=xxxxxxxxxxxx
PLAUSIBLE_SITE_ID=your-domain.com
```

---

### Airtable
**Where:** airtable.com → Account → Developer hub → Personal access tokens

```
AIRTABLE_API_KEY=patxxxxxxxxxxxx
AIRTABLE_BASE_ID=appxxxxxxxxxxxx
```

---

### Firebase
**Where:** Firebase Console → Project Settings → Service accounts → Generate new private key

Download the JSON file and note its location.

---

## Part 3: Set Up Your Environment File

Open Terminal in your project folder and run:

```
touch .env
open .env
```

Paste your credentials in this format:

```
# GitHub
GITHUB_TOKEN=ghp_xxxxxxxxxxxx

# Supabase
SUPABASE_URL=https://xxxxxxxxxxxx.supabase.co
SUPABASE_ANON_KEY=eyJhbG...
SUPABASE_SERVICE_ROLE_KEY=eyJhbG...

# n8n
N8N_URL=https://your-n8n.com
N8N_API_KEY=n8n_api_xxxx

# Add others as needed...
```

Save and close.

---

## Part 4: Verify Each Connection

Open Claude Code in your project folder:

```
cd ~/your-project-folder
claude
```

Then copy-paste each verification prompt below for services you use.

---

### Verify GitHub

Copy and paste this into Claude Code:

```
Check if I have GitHub access. Read my GITHUB_TOKEN from .env and:
1. Test the token works by calling the GitHub API
2. Show me my GitHub username
3. List my 3 most recent repositories
4. Confirm if I can create/push to repos

Just show me: PASS or FAIL for each, plus my username.
```

**Expected result:** All PASS, shows your username and repos

---

### Verify Supabase

Copy and paste this into Claude Code:

```
Check my Supabase connection. Read SUPABASE_URL and SUPABASE_ANON_KEY from .env and:
1. Test the connection to my Supabase project
2. List all tables in my database
3. Show the project URL

Just show me: PASS or FAIL, plus table names if any.
```

**Expected result:** PASS, shows your tables (or "no tables yet")

---

### Verify n8n

Copy and paste this into Claude Code:

```
Check my n8n connection. Read N8N_URL and N8N_API_KEY from .env and:
1. Test the API connection
2. List my workflows (just names)
3. Show how many workflows I have

Just show me: PASS or FAIL, workflow count, and names.
```

**Expected result:** PASS, shows your workflow names

---

### Verify Vercel

Copy and paste this into Claude Code:

```
Check my Vercel connection. Read VERCEL_TOKEN from .env and:
1. Test the API connection
2. List my projects
3. Show my team/account name

Just show me: PASS or FAIL, plus project names.
```

**Expected result:** PASS, shows your projects

---

### Verify Netlify

Copy and paste this into Claude Code:

```
Check my Netlify connection. Read NETLIFY_TOKEN from .env and:
1. Test the API connection
2. List my sites
3. Show my account info

Just show me: PASS or FAIL, plus site names.
```

**Expected result:** PASS, shows your sites

---

### Verify Plausible

Copy and paste this into Claude Code:

```
Check my Plausible connection. Read PLAUSIBLE_API_KEY and PLAUSIBLE_SITE_ID from .env and:
1. Test the API connection
2. Get visitor count for the last 7 days
3. Confirm the site ID is valid

Just show me: PASS or FAIL, plus visitor count.
```

**Expected result:** PASS, shows visitor stats

---

### Verify Airtable

Copy and paste this into Claude Code:

```
Check my Airtable connection. Read AIRTABLE_API_KEY and AIRTABLE_BASE_ID from .env and:
1. Test the API connection
2. List tables in my base
3. Show record count for each table

Just show me: PASS or FAIL, plus table names.
```

**Expected result:** PASS, shows your tables

---

## Part 5: Report Your Results

After running the verifications, fill out this report and send to me:

```
STACK VERIFICATION REPORT
========================

Name: ________________________
Date: ________________________

SERVICES TESTED:

[ ] GitHub
    Result: PASS / FAIL
    Username: ________________
    Notes: ________________

[ ] Supabase
    Result: PASS / FAIL
    Project URL: ________________
    Tables found: ________________
    Notes: ________________

[ ] n8n
    Result: PASS / FAIL
    Workflows: ________________
    Notes: ________________

[ ] Vercel
    Result: PASS / FAIL
    Projects: ________________
    Notes: ________________

[ ] Netlify
    Result: PASS / FAIL
    Sites: ________________
    Notes: ________________

[ ] Plausible
    Result: PASS / FAIL
    Site: ________________
    Notes: ________________

[ ] Airtable
    Result: PASS / FAIL
    Base: ________________
    Notes: ________________

[ ] Other: ________________
    Result: PASS / FAIL
    Notes: ________________

ISSUES TO FIX BEFORE SESSION:
1. ________________________
2. ________________________
3. ________________________

QUESTIONS FOR JEREMY:
1. ________________________
2. ________________________
```

---

## Quick Troubleshooting

**"Token not found" or "unauthorized"**
- Double-check you copied the full token
- Make sure .env file is saved
- Restart Claude Code after editing .env

**"Connection refused" or "timeout"**
- Check the URL is correct
- Make sure you're connected to internet
- Some services need VPN off

**"Invalid API key"**
- Regenerate the key
- Make sure you have the right permissions/scopes

**"Module not found" errors**
- Claude Code will install needed packages
- If it fails, note the error for our session

---

## Don't Have Credentials Yet?

That's okay! Mark those services as "SKIP - will set up together" and we'll configure them during our session.

The goal is to know what works NOW so we can plan our time.

---

## What to Send Me

1. **Verification report** (filled out above)
2. **Screenshot** of any FAIL results
3. **Questions** about services you're unsure about

Once I see your report, I'll know exactly what we need to focus on.

---

january 2026 · v.00.00.01
