# intent solutions io
---

# Daily Workflows with Claude Code
*Real examples for everyday tasks. Copy and adapt.*

## For Developers

**Morning Catchup:**
```
What changed in this codebase since yesterday? Summarize new/modified code.
```

**Bug Hunting:**
```
The login form submits but nothing happens.
Check src/components/LoginForm.jsx and the API call it makes. Find the bug.
```

**Code Review:**
```
Review this function for potential issues:
[paste code or point to file]
Focus on edge cases, error handling, and performance.
```

**Refactoring:**
```
The handleSubmit function in src/forms/Contact.js is 150 lines long.
Break it into smaller, testable functions. Keep the same behavior.
```

**Adding Features:**
```
Add a "Remember Me" checkbox to the login form.
When checked, store email in localStorage. Pre-fill if exists.
```

**Writing Tests:**
```
Write unit tests for calculateTotal in src/utils/cart.js.
Cover: empty cart, single item, discounts, negative quantities. Use Jest.
```

## For Writers

**Research and Outline:**
```
I'm writing about remote work productivity. Give me a detailed outline:
hook/intro, 5-7 sections, key points each, call to action.
```

**Drafting:**
```
Write intro for a blog post about AI in healthcare.
Tone: Professional but accessible. Length: 150-200 words.
Include a surprising statistic or hook.
```

**Editing:**
```
Edit this paragraph for clarity and flow:
[paste paragraph]
Make it punchier. Remove filler words.
```

**Repurposing:**
```
Turn this 2000-word blog post into:
1. Twitter thread (10 tweets)
2. LinkedIn post (300 words)
3. Email newsletter intro (100 words)
```

## For Analysts

**SQL Help:**
```
Write a SQL query: Top 10 customers by total spend, last 90 days,
exclude cancelled orders. Tables: customers, orders, order_items.
```

**Data Exploration:**
```
Look at this CSV data:
- What patterns do you see?
- Any outliers or anomalies?
- What questions would you investigate?
[paste sample data]
```

**Report Writing:**
```
I have these Q3 findings: [paste bullets]
Turn into executive summary (one page). Lead with business impact.
```

## For Everyone

**Email Drafts:**
```
Draft professional email:
To: Client who missed deadline
Tone: Firm but understanding
Goal: Get commitment to new deadline. Under 150 words.
```

**Meeting Prep:**
```
Meeting about [topic] in 1 hour. Help me prepare:
- 3 key points to make
- Potential questions I might get
- Data I should have ready
```

**Quick Explanations:**
```
Explain [concept] like I'm a smart person who doesn't know this thing.
No jargon. Real examples.
```

## Workflow Tips

**Chain requests:**
```
First: "Outline the feature"
Second: "Now implement step 1"
Third: "Now add tests for what you wrote"
```

**Give examples:**
```
Write error messages in this style:
"Oops! We couldn't save that. Try again in a sec."
NOT: "Error 500: Internal Server Exception"
```

**Specify format:**
```
Give results as markdown table: Issue | Severity | File | Fix
```

## Daily Routine

**Start of day:** `cd project` → `claude` → Start first task
**End of day:** `/compact` → Note what you were working on → `Ctrl+C`
**Weekly:** Update CLAUDE.md → `/clear` for fresh start

---
january 2026 · v.00.00.01
