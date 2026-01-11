# intent solutions io
---

# Claude Code Installation Guide
*Step-by-step from zero to running Claude Code.*

## Prerequisites
- [ ] Terminal basics (see Terminal 101)
- [ ] Node.js 18 or higher
- [ ] An Anthropic account

## Part 1: Install Node.js

Check if already installed:
```bash
node --version
```
If you see v18+ → skip to Part 2.

**If "command not found":**
1. Go to [nodejs.org](https://nodejs.org)
2. Download **LTS** version
3. Run installer (defaults are fine)
4. **Restart Terminal completely** (Cmd+Q, reopen)
5. Verify: `node --version` and `npm --version`

## Part 2: Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

Wait for it to finish. Verify:
```bash
claude --version
```

## Part 3: Authenticate

```bash
claude
```

Browser opens automatically:
1. Sign in to Anthropic
2. Click **Authorize**
3. See "Authentication successful"
4. Return to Terminal

## Part 4: First Conversation

Try these:
```
Hello! What can you do?
```
```
/help
```

Exit: `Ctrl + C`

## Part 5: Navigate to a Project

```bash
cd ~/Desktop/my-project    # Go to your project
claude                      # Start Claude Code
```

Now Claude can see and work with your files.

## Common Issues

**"command not found: claude"**
Restart Terminal. If still broken:
```bash
export PATH="$PATH:$(npm prefix -g)/bin"
```

**"npm: command not found"**
Node.js not installed. Go to nodejs.org, install LTS, restart Terminal.

**"EACCES: permission denied"**
```bash
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
npm install -g @anthropic-ai/claude-code
```

**Browser won't open**
Copy the URL from Terminal and paste in browser manually.

**"Please update"**
```bash
npm update -g @anthropic-ai/claude-code
```

## Daily Workflow

```bash
cd ~/Desktop/my-project    # 1. Go to project
claude                      # 2. Start Claude Code
# ... work ...              # 3. Ask questions, make changes
Ctrl + C                    # 4. Exit when done
```

## Key Commands Inside Claude Code

| Command | What It Does |
|---------|--------------|
| `/help` | Show all commands |
| `/clear` | Fresh start |
| `/compact` | Summarize and continue |
| `Ctrl + C` | Stop/exit |

## Quick Reference
```
+------------------------------------------+
|         CLAUDE CODE CHEAT SHEET          |
+------------------------------------------+
| INSTALL                                  |
| npm install -g @anthropic-ai/claude-code |
|                                          |
| START                                    |
| cd your-project && claude                |
|                                          |
| COMMANDS                                 |
| /help    = All commands                  |
| /clear   = Fresh start                   |
| /compact = Summarize context             |
| Ctrl+C   = Exit                          |
|                                          |
| UPDATE                                   |
| npm update -g @anthropic-ai/claude-code  |
+------------------------------------------+
```

---
january 2026 · v.00.00.01
