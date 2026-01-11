# intent solutions io
---

# Troubleshooting Cheatsheet
*Quick fixes for common Claude Code issues.*

## Installation Issues

**"command not found: claude"**
Close and reopen Terminal. Still broken:
```bash
export PATH="$PATH:$(npm prefix -g)/bin"
```

**"npm: command not found"**
1. Install Node.js from nodejs.org (LTS)
2. Restart Terminal (Cmd+Q, reopen)
3. Verify: `node --version`

**"EACCES: permission denied"**
```bash
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.zshrc
source ~/.zshrc
npm install -g @anthropic-ai/claude-code
```

## Authentication Issues

**"Please authenticate" loop**
1. Run `claude`
2. Complete full sign-in in browser
3. Look for "Authentication successful"
4. Return to Terminal

**Browser doesn't open**
Copy the URL from Terminal, paste in browser manually.

**"API key invalid"**
```bash
rm -rf ~/.claude
claude
```

## Runtime Issues

**Claude runs slowly**
```bash
/compact    # Or /clear for fresh start
```

**"Context limit reached"**
```bash
/compact    # Summarize and continue
/clear      # Or start fresh
```

**Claude gives outdated info**
```bash
/clear
# Then point to specific files
```

## Common Errors

**"I don't have access to that file"**
Ask Claude to read it explicitly:
```
Read src/components/Header.js and explain it
```

**"I can't find that file"**
Check you're in right folder: `pwd` and `ls -la`

**Changes not appearing**
Did you approve? Type `y` when Claude proposes changes.

## CLAUDE.md Issues

**Not being read**
```bash
ls -la CLAUDE.md    # Check it exists
chmod 644 CLAUDE.md # Fix permissions
pwd                 # Verify you're in right folder
```

**Claude ignores preferences**
- Be specific in CLAUDE.md
- Use "ALWAYS" and "NEVER" language
- `/clear` after updating CLAUDE.md

## Performance Tips

- **Keep sessions short** - `/compact` or `/clear` regularly
- **Be specific** - Point to exact files and line numbers
- **One task at a time** - Don't combine unrelated tasks
- **Update CLAUDE.md** - Good context = faster responses

## Full Reset

```bash
pkill -f claude
rm -rf ~/.claude
npm uninstall -g @anthropic-ai/claude-code
npm install -g @anthropic-ai/claude-code
claude
```

## Quick Reference

| Problem | Fix |
|---------|-----|
| Slow response | `/compact` or `/clear` |
| Lost context | `/clear` and start over |
| File not found | Check path with `ls` |
| Command not found | Restart Terminal |
| Auth issues | Remove ~/.claude, retry |
| Permissions | Use ~/.npm-global for npm |

---
january 2026 · v.00.00.01
