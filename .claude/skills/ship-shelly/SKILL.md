---
name: ship-shelly
description: |
  End-of-session progress report automation for Creative Wheel House collaboration.
  Works from any nested directory (packages/water/, packages/core/, etc.) - auto-detects
  project root. Executes sweep phase (commit, PR creation, Gemini review gate, merge,
  branch cleanup), prepares C-level changelog with diagrams and metrics, generates
  professional PDF via pandoc/xelatex, and sends personalized email to Shelly via Resend.
  Use when session work is complete and ready to ship progress update. Trigger with
  phrases like "/ship-shelly", "send update to shelly", "ship progress", "email shelly".
allowed-tools: "Read,Write,Edit,Glob,Grep,Bash(git:*),Bash(pandoc:*),Bash(python:*),Task,Skill,AskUserQuestion"
model: claude-opus-4-5-20251101
version: 1.0.0
author: Jeremy Longshore <jeremy@intentsolutions.io>
license: MIT
---

# Ship Shelly - End-of-Session Progress Report Automation

Send comprehensive progress updates to Shelly with professional PDF attachments.

## Overview

This skill automates the end-of-session workflow for Creative Wheel House:

1. **Sweep Phase**: Commit changes, create PRs, enforce Gemini Code Assistant review, merge approved PRs, clean stale branches
2. **Changelog Phase**: Analyze commits and session activity, write C-level changelog entry with diagrams, metrics, and context
3. **PDF Phase**: Generate professional PDF using pandoc with custom LaTeX template
4. **Email Phase**: Compose personalized email and send via Resend with PDF attachment

The changelog captures progress, decisions, and alignment for executive review. Email body is written fresh each time (not templated) with natural language summary.

## Prerequisites

**Required Skills:**
- `/sweep` - Repository housekeeping (global skill)
- `/release` - Release automation (global skill)

**System Requirements:**
- pandoc 3.x with xelatex PDF engine
- Python 3.11+ with `resend` package
- `pass` password store with `apis/resend-api-key` entry

**Verify Prerequisites:**
```bash
pandoc --version | head -1
python3 -c "import resend; print('resend OK')"
pass apis/resend-api-key > /dev/null && echo "API key OK"
```

## Instructions

### Step 1: Detect Project Root

This skill can be invoked from any subdirectory within creative-wheel-house (e.g., packages/water/, packages/core/).

Detect project root using git:
```bash
PROJECT_ROOT=$(git rev-parse --show-toplevel)
cd "$PROJECT_ROOT"
echo "Working from: $PROJECT_ROOT"
```

All subsequent operations use `$PROJECT_ROOT` for:
- CHANGELOG.md location
- PDF output location
- Git operations

### Step 2: Check Repository State

Run git status to identify uncommitted changes. If changes exist, prompt whether to commit.

```bash
git status --porcelain
git log --oneline -5
```

### Step 3: Execute Sweep Phase

Invoke the `/sweep` skill with PR-first workflow enforcement:

1. Create branch from current work if on main
2. Commit all changes with descriptive message
3. Create pull request via `gh pr create`
4. **GATE**: Wait for Gemini Code Assistant review on PR
5. Only merge after approval received
6. Delete merged branches and stale branches (>30 days)

```bash
# Example PR creation
gh pr create --title "Session work: [date]" --body "[description]"

# Check for Gemini review
gh pr checks [PR_NUMBER]
```

### Step 4: Execute Release Phase (Light)

Invoke `/release` in light mode - validate state, tag if warranted.

### Step 5: Gather Session Data

Collect information for changelog:

```bash
# Commits since last changelog entry
git log --oneline [LAST_TAG]..HEAD

# Files changed
git diff --stat [LAST_TAG]..HEAD

# Session duration (if tracked)
# Decisions made (from conversation context)
```

### Step 6: Gather User Input (for email, not changelog)

Before composing the email, ask the user for personal notes to Shelly:

```
PERSONAL NOTES FOR SHELLY

Anything you want to say directly to Shelly?
(Questions, thoughts, context, concerns - anything outside the
formal changelog that needs communicating. Free-form, babble away.)
```

Use AskUserQuestion for this interactive step.

**NOTE:** This input creates a "Personal Notes from Jeremy" section in the EMAIL, separate from the changelog. This is for:
- Questions that need Shelly's input
- Context that isn't changelog-worthy but important
- Free-form thoughts or concerns
- Anything the user wants to say directly

The changelog remains a formal progress document. The email is where personal communication happens.

### Step 7: Write Changelog Entry

Analyze the gathered data and WRITE a comprehensive changelog entry. This is natural language generation, not template filling.

**Vision: This is a Collaboration Progress Report, Not a Git Log**

Shelly is a C-level collaborator who:
- Prefers deliberate pace over rapid shipping
- Needs to validate decisions before work continues
- Is shaping vision, not just reviewing code
- Wants transparency without technical overload

**Entry Structure:**

1. **Session Summary** (2-3 sentences)
   - What was the goal of this session?
   - Did we achieve it?
   - Anything unexpected?

2. **Progress Made** (concrete deliverables, not activity)
   - What new things exist that didn't before?
   - What moved from "idea" to "done"?
   - Tangible outputs, not "worked on X"

3. **Decisions & Rationale** (CRITICAL for collaboration)
   - What choices were made?
   - Why this approach over alternatives?
   - What tradeoffs were accepted?
   - **Flag any decisions Shelly should validate**

4. **Alignment Check**
   - Are we still on track with original vision?
   - Any scope changes or pivots?
   - Concerns or questions for Shelly

5. **Next Session Priorities**
   - Clear, specific next steps
   - Any blockers or dependencies
   - What decision/input is needed from Shelly?

6. **Technical Appendix** (for reference only, not main content)
   - Commits (table: hash, message)
   - Files changed (grouped by type)
   - Metrics (lines, time)
   - Diagrams if architecture changed

**Tone:**
- Conversational but professional
- Show progress, not just activity
- Highlight decisions that need validation
- Respect the deliberate pace
- Build trust through transparency

**Length:** Entry should be scannable in 2 minutes, with appendix for deep dives.

Prepend entry to `CHANGELOG.md` after the header.

### Step 8: Commit Changelog

```bash
git add CHANGELOG.md
git commit -m "docs: add session changelog entry [date]"
git push origin main
```

### Step 9: Generate PDF

Execute the PDF generation script with custom template:

```bash
{baseDir}/scripts/generate-pdf.sh CHANGELOG.md changelog-[date].pdf
```

This uses `{baseDir}/templates/cwh-report.latex` for professional styling.

### Step 10: Compose Email (with user notes highlighted)

WRITE a personalized email to Shelly. This is natural language generation:

**Vision: Brief, Respectful, Action-Oriented**

Shelly is busy. The email should:
- Tell her what happened in under 30 seconds of reading
- **HIGHLIGHT user's notes/input prominently**
- Point to the PDF for details (don't duplicate everything)

**Structure:**
- Casual professional greeting ("Hey Shelly" not "Dear Ms. Frank")
- 2-3 sentence session summary (what got done, any surprises)
- **PERSONAL NOTES SECTION** (if user provided input in Step 6):
  ```
  A few things on my mind:

  [User's free-form input from Step 6, lightly cleaned up but
   preserving their voice. Could be questions, thoughts, context,
   concerns - whatever they wanted to say.]
  ```
- Note about attached PDF for full details
- Sign-off as "Jeremy (via Claude)"

**Tone:**
- Friendly but professional
- Respectful of her time
- Transparent about uncertainties
- Never overpromise

Do NOT use a template. Write fresh based on the changelog and user input.

### Step 11: Send Email

Execute the send script with composed content:

```bash
# Production (sends to Shelly)
python3 {baseDir}/scripts/send-email.py \
  --to "shelly@shellyfrank.com" \
  --cc "jeremy@intentsolutions.io" \
  --subject "Creative Wheel House Progress Update - [date]" \
  --body "[email_body]" \
  --attachment "[pdf_path]"

# Test mode (sends only to Jeremy)
python3 {baseDir}/scripts/send-email.py \
  --test \
  --to "shelly@shellyfrank.com" \
  --subject "Creative Wheel House Progress Update - [date]" \
  --body "[email_body]" \
  --attachment "[pdf_path]"
```

**Note:** Use `--test` flag during testing to redirect all emails to jeremy@intentsolutions.io only.

### Step 12: Confirm Completion

Display summary:
```
SHIP SHELLY COMPLETE

Sweep: [X] PRs merged, [Y] branches cleaned
Changelog: Entry added for [date]
PDF: changelog-[date].pdf ([size])
Email: Sent to shelly@shellyfrank.com

Session Duration: [time]
Commits: [count]
Files Changed: [count]
```

## Output Format

**Files Created:**
- `CHANGELOG.md` - Updated with new entry at top
- `changelog-[date].pdf` - Professional PDF in project root

**Email Sent:**
- To: shelly@shellyfrank.com
- CC: jeremy@intentsolutions.io
- Subject: Creative Wheel House Progress Update - [date]
- Attachment: changelog-[date].pdf

## Error Handling

| Error | Cause | Solution |
|-------|-------|----------|
| PR review pending | Gemini Code Assistant hasn't reviewed | Wait for review or request manually |
| Resend API failure | Invalid API key or network | Verify `pass apis/resend-api-key` works |
| pandoc failure | Missing LaTeX packages | Run `sudo apt install texlive-xetex` |
| No commits found | Nothing to report | Skip changelog, notify user |
| Branch protection | Cannot push to main | Use /branch-protection to temporarily disable |

## Examples

### Example 1: Standard Session End

**Invocation:**
```
/ship-shelly
```

**Result:**
```
Starting Ship Shelly workflow...

SWEEP PHASE
Found 3 uncommitted files.
Creating PR #42: "Session work: API integration"
Waiting for Gemini Code Assistant review...
Review approved
Merging PR #42...
Cleaning stale branches: feature/old-experiment (45 days)

CHANGELOG PHASE
Analyzing 8 commits since v0.1.0...
Writing changelog entry...
Entry added to CHANGELOG.md

PDF PHASE
Generating PDF with cwh-report template...
changelog-20260109.pdf (312 KB)

EMAIL PHASE
Composing email to Shelly...
Sending via Resend...
Email sent successfully

COMPLETE
```

### Example 2: No Changes to Report

**Invocation:**
```
/ship-shelly
```

**Result:**
```
Starting Ship Shelly workflow...

SWEEP PHASE
Working directory clean.
No open PRs to process.
No stale branches found.

CHANGELOG PHASE
No commits since last entry.
Nothing to report - skipping changelog and email.

Would you like to send a quick status email anyway? [y/n]
```

## Resources

- `{baseDir}/scripts/generate-pdf.sh` - Pandoc wrapper with template
- `{baseDir}/scripts/send-email.py` - Resend API integration
- `{baseDir}/templates/cwh-report.latex` - Professional LaTeX template
- `{baseDir}/templates/changelog-entry.md` - Reference structure for entries
- `{baseDir}/references/pandoc-options.md` - Full pandoc configuration reference
