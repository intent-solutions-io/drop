# intent solutions io
---

# From n8n to Claude Code
*You know n8n. Now you want more power without the canvas constraints.*

## Why Transition?

**n8n limitations:** Complex logic gets messy, limited error handling, canvas unwieldy, debugging painful.

**Claude Code advantages:** Conversational interface, unlimited complexity, real code when needed, smart error handling, learns your preferences.

## Mental Model Shift

**n8n:** `Trigger → Node → Node → Node → Output`
**Claude Code:** `"Do this task" → Claude figures out steps → Done`

You describe the outcome. Claude handles the process.

## Mapping Concepts

| n8n | Claude Code |
|-----|-------------|
| Workflow | Skill or conversation |
| Trigger | You asking Claude |
| Node | Claude's tool use |
| Expression | Natural language |
| Error handling | Built-in intelligence |

## Common Workflows → Claude Code

**HTTP Request Node:**
```
Fetch data from api.example.com/data and summarize what you find.
```

**Code Node:**
```
Transform this data: uppercase all names, lowercase all emails.
[paste data or point to file]
```

**IF Node:**
```
Look at status field. If "active", add to priority list.
Otherwise, flag for review.
```

**Loop Node:**
```
For each customer in customers.json, generate personalized email
based on purchase history. Save all to emails.md.
```

**Schedule Trigger → Cron:**
```bash
0 9 * * * claude skill run daily-report
```

## Skills: Your Power Tool

Skills are reusable commands. Like n8n workflows you invoke with one command.

**Old n8n (5 nodes, debugging pain):**
`Schedule → Fetch Data → Transform → Format → Email`

**Claude Code skill:**
```
/daily-report
```

**Creating skills:**
1. Identify repetitive task
2. Perfect prompts in conversation
3. Save as skill
4. Invoke with one command

## Migration Path

**Week 1:** Shadow mode - do same tasks in both, compare
**Week 2:** Move 1-3 node workflows (HTTP, transforms, simple logic)
**Week 3:** Tackle multi-branch workflows, convert to skills
**Week 4:** Disable n8n for converted workflows, document skills

## What Works Better Where

**Keep in n8n:** Webhook triggers, integration-heavy workflows, unattended automation

**Move to Claude Code:** Complex logic, interpretation, data analysis, code generation, one-off operations

**Hybrid:** n8n for triggers, Claude Code for processing

## Tips for n8n Users

- **Think outcomes, not steps** - Don't describe each node
- **Trust the intelligence** - No need to specify every condition
- **Build skills gradually** - Start with conversations, then save patterns
- **Keep context in CLAUDE.md** - APIs, integrations, preferences
- **Embrace conversation** - Unlike fire-and-forget, iterate in real-time

## Quick Reference

| n8n Action | Claude Code |
|------------|-------------|
| Create workflow | Start conversation or skill |
| Add node | Describe what you need |
| Set expression | Use plain language |
| Test workflow | Ask Claude to do it |
| Debug | "What went wrong?" |
| Schedule | Cron + skill |

---
january 2026 · v.00.00.01
