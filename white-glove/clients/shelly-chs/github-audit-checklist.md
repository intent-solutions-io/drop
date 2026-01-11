# intent solutions io
---

# Shelly GitHub Audit
*What to check once you have access*

---

## First Look

Once she adds you, run through this:

### Repository Basics
- [ ] How many repos does she have? (might be more than one)
- [ ] Which one is the "real" Credibility Spine project?
- [ ] Any repos that look abandoned or duplicated?

### Project Structure
- [ ] Is there a clear folder structure?
- [ ] Any CLAUDE.md or README?
- [ ] Where's the actual code/content?
- [ ] Any obvious mess (files in root, no organization)?

### Git History
- [ ] How many commits? (shows how much work exists)
- [ ] Last commit date? (is this active or stale?)
- [ ] Multiple branches? (complexity indicator)
- [ ] Commit messages make sense? (organization indicator)

---

## Red Flags to Note

| Issue | What It Means | Session Priority |
|-------|---------------|------------------|
| No commits | Empty repo, fresh start | Low - just begin |
| 100+ commits, no structure | Lots of work, needs organization | High - audit first |
| Multiple similar repos | Duplication problem | High - consolidate |
| Last commit 6+ months ago | Stale, may have moved elsewhere | Ask where current work is |
| `.env` files committed | Security issue | Fix immediately |
| No `.gitignore` | Will commit junk | Add in Session 1 |

---

## Commands to Run Locally

Once you clone her repo:

```bash
# Clone it
git clone https://github.com/[shelly-username]/[repo-name].git
cd [repo-name]

# Quick audit
ls -la                    # What's in root?
find . -name "*.md" | head -20   # Find docs
find . -name ".env*"      # Check for secrets (bad if exists)
git log --oneline | head -20     # Recent history
git branch -a             # All branches
du -sh */                 # Folder sizes
```

---

## What You're Looking For

### The Good
- Clear project purpose
- Some documentation
- Organized folders
- Regular commits
- No secrets exposed

### The Fixable
- Messy structure (we reorganize)
- No CLAUDE.md (we create)
- Multiple versions (we consolidate)
- Unclear purpose (we clarify in Session 1)

### The Concerning
- Secrets committed (fix before anything else)
- So much complexity she's lost (simplify first)
- Wrong repo entirely (find the right one)

---

## Preparing for Session 1

After your audit, prepare:

1. **Summary** - One paragraph: "Here's what I found"
2. **Structure recommendation** - How should this be organized?
3. **First task** - What do we tackle together in Session 1?
4. **Questions** - What do you need her to clarify?

---

## Notes Space

**Repo URL:**

**Date accessed:**

**What I found:**




**Recommended first action:**




**Questions for Shelly:**




---
january 2026 · v.00.00.01
