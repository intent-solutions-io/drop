# intent solutions io

---

# Your Setup Prompt
*Copy this entire prompt and paste it into Claude Code*

---

## Instructions

1. Open Terminal
2. Type `claude` and press Enter
3. Copy EVERYTHING in the box below
4. Paste it into Claude Code
5. Press Enter and follow Claude's questions

---

## Copy This Prompt

```
I need help setting up my environment before my coaching session with Jeremy. Please walk me through the complete setup process interactively.

DO THIS NOW:
1. First, ask me where my projects live on my computer (what folder)
2. Ask me to list the services/tools I use (GitHub, Supabase, n8n, Vercel, etc.)
3. For each service I use, walk me through getting the API key/credentials step-by-step
4. Help me create a .env file with all my credentials
5. Test each connection to make sure it works
6. Generate a verification report I can send to Jeremy

START WITH THESE QUESTIONS:

QUESTION 1: What folder do you keep your projects in?
(Example: ~/Projects, ~/Code, ~/Documents/work)

QUESTION 2: Do you have a GitHub account? What's your username?

QUESTION 3: Which of these services do you use? (just list the numbers)
   1. Supabase (database)
   2. n8n (automation)
   3. Vercel (deployment)
   4. Netlify (deployment)
   5. Airtable (database)
   6. Firebase (database)
   7. Plausible (analytics)
   8. Railway (deployment)
   9. Bolt.new (AI code)
   10. Other (I'll tell you)

After I answer, guide me through each service one at a time:
- Tell me exactly where to find the API key (with URLs)
- Wait for me to paste each credential
- Add it to my .env file
- Test it works before moving to the next one

Be patient - I'm new to terminal/CLI but comfortable with web dashboards.

When done, show me a report like this:

VERIFICATION REPORT
==================
Projects folder: [path]
GitHub: [PASS/FAIL] @username
Supabase: [PASS/FAIL] - X tables
n8n: [PASS/FAIL] - X workflows
[etc for each service]

.env file: Created at [path]
.gitignore: [PASS/FAIL] - .env protected

READY FOR SESSION: YES/NO

Start now with Question 1.
```

---

## What Happens Next

Claude will ask you questions one at a time:

1. **Where are your projects?** - Tell Claude your folder path
2. **GitHub username?** - Share your GitHub name
3. **What services?** - Pick from the list
4. **Credentials** - Claude tells you exactly where to click, you paste each key
5. **Testing** - Claude verifies each connection
6. **Report** - Claude generates summary

---

## When You're Done

Send the verification report to: **jeremy@intentsolutions.io**

If anything shows FAIL, ask Claude to help fix it before our session.

---

## Tips

- Take your time - Claude waits for each answer
- If confused, just say "I don't understand, explain differently"
- If something breaks, say "let's start over"
- Keep your browser open to log into your services

---

january 2026 · v.00.00.01
