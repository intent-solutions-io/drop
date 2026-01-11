# intent solutions io
---

# GitHub Actions 101: Automatic Testing
*How GitHub verifies your code works before it goes live*

---

## What Are GitHub Actions?

GitHub Actions are **automatic checks** that run whenever you push code.

Think of it like a quality inspector at a factory. Every time you send code to GitHub, the inspector:
- Runs your tests
- Checks for errors
- Reports back: pass or fail

**You don't run these manually.** They happen automatically.

---

## Why This Matters

Without Actions:
1. You write code
2. You push to GitHub
3. Hope it works
4. Find out later it's broken

With Actions:
1. You write code
2. You push to GitHub
3. **Actions run automatically**
4. You see ✓ (pass) or ✗ (fail) immediately
5. Fix issues before they become problems

---

## What You'll See

When you push code, GitHub shows:

**Green checkmark ✓** = All tests passed, code looks good

**Red X ✗** = Something failed, needs attention

**Yellow dot ●** = Tests still running

You'll see these on:
- Your repository's main page
- Pull requests
- Individual commits

---

## Real Example

You push a change to your Credibility Spine project:

```
git add .
git commit -m "Add new receipt type"
git push
```

GitHub Actions automatically:
1. Spins up a test computer
2. Installs your project
3. Runs all tests
4. Checks code formatting
5. Reports results

**2 minutes later:** Green checkmark. Your code works.

---

## What Actions Typically Check

| Check | What It Does |
|-------|--------------|
| Tests | Runs your test suite, makes sure nothing broke |
| Lint | Checks code style and formatting |
| Build | Makes sure the project compiles/builds |
| Security | Scans for known vulnerabilities |
| Type Check | Verifies TypeScript/type safety |

---

## The Workflow File

Actions are defined in a file. You don't need to write these - Claude Code or your coach can set them up.

Lives at: `.github/workflows/test.yml`

Example:
```yaml
name: Test

on: push  # Run when code is pushed

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Install
        run: npm install
      - name: Test
        run: npm test
```

**Translation:**
- When someone pushes code
- Grab the code
- Install dependencies
- Run tests

---

## How We'll Use This

For the Credibility Spine:

1. **I'll set up basic Actions** for your project
2. **When you push code**, tests run automatically
3. **You'll see pass/fail** on GitHub
4. **Before merging**, we confirm all checks pass

This means:
- Catch bugs early
- Confidence that changes work
- Professional development workflow

---

## Viewing Action Results

### From Repository Page:
1. Go to your repo on github.com
2. Click **Actions** tab (top menu)
3. See all workflow runs
4. Click any run to see details

### From a Commit:
1. Look for ✓ or ✗ next to commit message
2. Click it for details
3. See which checks passed/failed

### From a Pull Request:
1. Scroll to bottom of PR
2. See "Checks" section
3. All green = safe to merge

---

## When Actions Fail

**Don't panic.** Failed checks are normal and helpful.

1. **Click the red X** to see what failed
2. **Read the error message**
3. **Fix the issue** locally
4. **Push again** - Actions re-run automatically

Common failures:
- Test that needs updating
- Missing dependency
- Typo in code
- Formatting issue

---

## Actions vs. Local Testing

| Local (your computer) | GitHub Actions |
|----------------------|----------------|
| You run `npm test` | Runs automatically |
| Only your machine | Fresh machine every time |
| Quick feedback | Catches "works on my machine" bugs |
| Optional | Consistent, always runs |

**Best practice:** Test locally first, then push. Actions are your safety net.

---

## Quick Reference

| What | Where |
|------|-------|
| View all runs | Repository → Actions tab |
| See commit status | ✓ or ✗ next to commit |
| Check PR status | Bottom of pull request |
| Workflow files | `.github/workflows/` folder |
| Re-run failed job | Actions tab → Click run → Re-run |

---

## What You Don't Need to Do

- Write workflow files (we'll do this together)
- Manually run actions (they're automatic)
- Debug complex failures (that's what coaching is for)

**Your job:** Push code, check for green checkmark, fix if red.

---

## Summary

1. **GitHub Actions = automatic testing**
2. **Runs every time you push**
3. **Green ✓ = good, Red ✗ = needs fixing**
4. **Catches problems before they cause real issues**
5. **We'll set this up together for your project**

---
january 2026 · v.00.00.01
