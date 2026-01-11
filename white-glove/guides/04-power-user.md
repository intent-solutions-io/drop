# intent solutions io
---

# Power User Guide
*Advanced techniques once you're comfortable with basics.*

## Slash Commands

| Command | What It Does |
|---------|--------------|
| `/help` | Show all commands |
| `/clear` | Wipe conversation, start fresh |
| `/compact` | Summarize context, keep working |
| `/config` | View/change settings |
| `/doctor` | Diagnose installation issues |

**Use /compact when:** Conversation slow, same task, need context space
**Use /clear when:** Switching tasks, Claude confused, want fresh start

## CLAUDE.md Mastery

**Hierarchy** (later overrides earlier):
1. `~/.claude/CLAUDE.md` (global)
2. `./CLAUDE.md` (project root)
3. `./src/CLAUDE.md` (subdirectory)

**Be direct and specific:**
```markdown
## Code Style
- Use const, never let or var
- Single quotes, no semicolons
- 2-space indentation, max 80 chars
```

**Use ALWAYS/NEVER:**
```markdown
ALWAYS: Run tests before saying done, use TypeScript strict mode
NEVER: Use `any` type, commit console.log, add obvious comments
```

## Prompt Engineering

**Task Decomposition:**
Instead of "Build authentication", try:
```
Let's build auth. Start with login form only:
1. Create LoginForm component
2. Add email/password fields
3. Add validation
4. Style to match existing forms
Stop there. I'll ask for backend next.
```

**Iterative Refinement:**
```
Write email validation function.
→ Good. Now handle subdomains and plus addressing.
→ Add JSDoc and unit tests.
```

**Context Loading:**
```
I'm working on checkout. Read these first:
- src/pages/Checkout.tsx
- src/api/orders.ts
- src/types/order.ts
Then tell me what you understand.
```

## Multi-File Operations

**Refactor across files:**
```
Rename 'user' to 'currentUser' across src/.
Show all files that would change before editing.
```

**Consistent changes:**
```
Add error boundary to all top-level pages.
Use pattern from src/components/ErrorBoundary.tsx.
```

**Find patterns:**
```
Find all API calls without proper error handling. List them, don't fix yet.
```

## Git Integration

**Commit messages:**
```
What changed since my last commit? Write a descriptive commit message.
```

**Before PR:**
```
Review my changes since branching from main. Check for:
console.logs, TODO comments, missing error handling, type errors.
```

## Efficiency Tips

**Shortcuts:** `Ctrl+C` stop, `Ctrl+D` exit, `Up` last prompt

**Batch tasks:**
```
Fix all TypeScript errors in src/components/. Group by file.
```

**Save templates:**
```markdown
# My Prompts
## Code Review: "Review [file] for bugs, edge cases. Be specific about lines."
## Debug: "[Error] in [file] when [action]. Find cause and fix."
```

## When to Start Fresh

Use `/clear` when:
- Switching projects
- Claude confused about codebase
- Major changes Claude doesn't know about
- 30+ exchanges on complex topics
- Response quality declining

Context is precious. Protect it.

---
january 2026 · v.00.00.01
