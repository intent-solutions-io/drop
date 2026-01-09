---
name: ship-shelly
description: |
  Enterprise-grade end-of-session progress automation for Creative Wheel House.
  Executes complete delivery pipeline: sweep (commit, PR, review gate, merge),
  generates professional PDF reports with embedded GCP architecture diagrams
  (Vertex AI, Cloud Run, BigQuery), creates cumulative visual changelog with
  D2 workflow diagrams, and delivers multi-attachment email via Resend.
  Use when session work is complete and ready for C-suite delivery. Trigger
  with phrases like "/ship-shelly", "ship to shelly", "send progress update".
allowed-tools: "Read,Write,Edit,Glob,Grep,Bash(git:*),Bash(pandoc:*),Bash(python:*),Bash(d2:*),Bash(chmod:*),Bash(ls:*),Bash(cat:*),Task,Skill,AskUserQuestion"
model: claude-opus-4-5-20251101
version: 2.0.0
author: Jeremy Longshore <jeremy@intentsolutions.io>
license: MIT
---

# Ship Shelly - Enterprise Progress Delivery System

Automated end-of-session delivery pipeline for C-suite stakeholders.

## Overview

This skill delivers professional progress updates to Creative Wheel House stakeholders (Shelly Frank, Glen Kerby) with enterprise-grade presentation quality.

**What gets delivered:**

| Attachment | Purpose | Content |
|------------|---------|---------|
| **Session Report PDF** | Complete narrative | Text + embedded diagrams (architecture, workflows) |
| **Visual Evolution PDF** | Project timeline | Cumulative diagram history (scroll to see evolution) |

**Technology stack:**
- **Diagrams (Python)** - GCP architecture with official cloud icons (Vertex AI, Cloud Run, BigQuery, Firestore)
- **D2** - Modern workflow diagrams with professional styling
- **Pandoc + XeLaTeX** - Publication-quality PDF output
- **Resend API** - Reliable email delivery with attachments

## Prerequisites

**System Requirements:**
```bash
# Verify all prerequisites
pandoc --version | head -1                    # pandoc 3.x
~/.local/bin/d2 --version                     # D2 v0.7+
source .venv/bin/activate && python3 -c "import diagrams; print('diagrams OK')"
grep -q RESEND_API_KEY .env && echo "API key OK"
```

**Required tools:**
- pandoc 3.x with xelatex engine
- D2 diagram tool (~/.local/bin/d2)
- Python venv with: diagrams, resend packages
- graphviz (for diagrams library)
- `.env` file with `RESEND_API_KEY=re_xxx` (project root)

## Instructions

### Phase 1: Initialize Session

Detect project root and establish working context:

```bash
PROJECT_ROOT=$(git rev-parse --show-toplevel)
cd "$PROJECT_ROOT"
DATE_STR=$(date +%Y-%m-%d)
echo "Ship Shelly - Session $DATE_STR"
echo "Working from: $PROJECT_ROOT"
```

### Phase 2: Repository Sweep

Check repository state and prepare for delivery:

```bash
# Check state
git status --porcelain
git log --oneline -10

# If uncommitted changes exist:
# 1. Create feature branch (if on main)
# 2. Commit with descriptive message
# 3. Create PR via gh cli
# 4. GATE: Wait for review (Gemini Code Assistant)
# 5. Merge after approval only
```

**Non-negotiable:** Every change must go through PR review before merge.

### Phase 3: Generate Diagrams

Execute diagram generation scripts to create professional visuals.

**3a. GCP Architecture Diagram** (with official cloud icons):
```bash
source "$PROJECT_ROOT/.venv/bin/activate"
python3 {baseDir}/scripts/generate-architecture.py "$PROJECT_ROOT/graphics/$DATE_STR-architecture"
```

Output: `graphics/YYYY-MM-DD-architecture.png` - Professional GCP infrastructure diagram showing Vertex AI, Cloud Run, Firestore, BigQuery, Cloud Storage.

**3b. Workflow Diagrams** (D2):
```bash
{baseDir}/scripts/generate-workflow.sh "$PROJECT_ROOT/graphics"
```

Output:
- `graphics/YYYY-MM-DD-workflow.png` - Session automation pipeline
- `graphics/YYYY-MM-DD-progress.png` - Session metrics and status
- `graphics/YYYY-MM-DD-arch-simple.png` - D2 architecture overview

### Phase 4: Write Changelog Entry

Analyze session data and WRITE comprehensive changelog entry (natural language generation, not template filling).

**Gather data:**
```bash
# Commits since last entry
git log --oneline $(git describe --tags --abbrev=0 2>/dev/null || echo "HEAD~20")..HEAD

# Files changed
git diff --stat $(git describe --tags --abbrev=0 2>/dev/null || echo "HEAD~20")..HEAD
```

**Entry structure (C-suite optimized):**

1. **Session Summary** (2-3 sentences)
   - Goal, achievement, surprises

2. **Progress Made** (concrete deliverables)
   - New capabilities, completed work
   - Include relevant diagram references: `![Architecture](graphics/YYYY-MM-DD-architecture.png)`

3. **Decisions & Rationale** (critical for collaboration)
   - Choices made and why
   - **Flag decisions needing validation**

4. **Technical Architecture** (with embedded diagrams)
   - Include GCP architecture diagram
   - Show infrastructure evolution

5. **Alignment Check**
   - On track with vision?
   - Scope changes or pivots?

6. **Next Session Priorities**
   - Clear next steps
   - Blockers and dependencies

7. **Technical Appendix**
   - Commit table (hash, message)
   - Files changed
   - Metrics

**Prepend entry to CHANGELOG.md after header.**

### Phase 5: Update Visual Changelog

Append session diagrams to cumulative visual timeline:

```bash
{baseDir}/scripts/update-graphic-log.sh "$DATE_STR"
```

This creates/updates:
- `GRAPHIC-CHANGELOG.md` - Markdown with all session diagrams
- `GRAPHIC-CHANGELOG.pdf` - Cumulative visual timeline PDF

### Phase 6: Generate Session Report PDF

Generate professional PDF from changelog:

```bash
{baseDir}/scripts/generate-pdf.sh \
    "$PROJECT_ROOT/CHANGELOG.md" \
    "$PROJECT_ROOT/changelog-$DATE_STR.pdf"
```

Template: `{baseDir}/templates/cwh-report.latex`
- Professional typography (DejaVu fonts)
- Creative Wheel House branding
- Embedded graphics support
- Tables with professional styling

### Phase 7: Validation Gate

**Before sending, validate outputs:**

```bash
# Check PDF exists and has content
ls -la "$PROJECT_ROOT/changelog-$DATE_STR.pdf"
ls -la "$PROJECT_ROOT/GRAPHIC-CHANGELOG.pdf"

# Check page count (pdfinfo if available)
pdfinfo "$PROJECT_ROOT/changelog-$DATE_STR.pdf" 2>/dev/null | grep Pages
```

**Display preview:**
```
PDF VALIDATION
---------------------------------------------
Session Report: changelog-YYYY-MM-DD.pdf
  Size: [X] KB
  Pages: [Y]

Visual Evolution: GRAPHIC-CHANGELOG.pdf
  Size: [X] KB
  Pages: [Y]

[S]end to Shelly
[P]review PDFs first
[A]bort - don't send
---------------------------------------------
```

Use AskUserQuestion for approval before proceeding.

### Phase 8: Gather Personal Notes

Ask user for any personal message to include:

```
PERSONAL NOTES FOR SHELLY
---------------------------------------------
Anything you want to say directly to Shelly?
(Questions, thoughts, context - anything that
doesn't belong in the formal changelog.)
---------------------------------------------
```

Use AskUserQuestion. This creates a "Personal Notes" section in the email body.

### Phase 9: Compose Email

WRITE personalized email (natural language, not template):

**Structure:**
- Casual professional greeting
- 2-3 sentence session summary
- **Personal notes section** (if provided)
- Reference to attachments
- Sign-off: "Jeremy (via Claude)"

**Tone:** Friendly, professional, respectful of time.

### Phase 10: Send Email

Execute send script with multiple attachments:

```bash
# Production mode
python3 {baseDir}/scripts/send-email.py \
    --to "shelly@shellyfrank.com" \
    --cc "jeremy@intentsolutions.io" \
    --subject "Creative Wheel House Progress - $DATE_STR" \
    --body "$EMAIL_BODY" \
    --attachment "$PROJECT_ROOT/changelog-$DATE_STR.pdf" \
    --attachment "$PROJECT_ROOT/GRAPHIC-CHANGELOG.pdf"

# Test mode (sends to Jeremy only)
python3 {baseDir}/scripts/send-email.py --test \
    --subject "Creative Wheel House Progress - $DATE_STR" \
    --body "$EMAIL_BODY" \
    --attachment "$PROJECT_ROOT/changelog-$DATE_STR.pdf" \
    --attachment "$PROJECT_ROOT/GRAPHIC-CHANGELOG.pdf"
```

### Phase 11: Commit and Confirm

```bash
git add CHANGELOG.md GRAPHIC-CHANGELOG.md GRAPHIC-CHANGELOG.pdf graphics/
git commit -m "docs: session report $DATE_STR"
git push origin main
```

**Display completion summary:**
```
SHIP SHELLY COMPLETE
=====================================================

Sweep Phase
  PRs merged: [X]
  Branches cleaned: [Y]

Diagrams Generated
  GCP Architecture: graphics/YYYY-MM-DD-architecture.png
  Workflow: graphics/YYYY-MM-DD-workflow.png
  Progress: graphics/YYYY-MM-DD-progress.png

Reports Generated
  Session Report: changelog-YYYY-MM-DD.pdf ([size])
  Visual Evolution: GRAPHIC-CHANGELOG.pdf ([size])

Email Sent
  To: shelly@shellyfrank.com
  CC: jeremy@intentsolutions.io
  Attachments: 2 PDFs

Session Metrics
  Commits: [X]
  Files Changed: [Y]

=====================================================
```

## Output

**Files created/updated:**
- `CHANGELOG.md` - Session entry prepended
- `GRAPHIC-CHANGELOG.md` - Visual timeline updated
- `GRAPHIC-CHANGELOG.pdf` - Cumulative diagrams PDF
- `changelog-YYYY-MM-DD.pdf` - Session report PDF
- `graphics/YYYY-MM-DD-*.png` - Session diagrams

**Email delivered:**
- **To:** shelly@shellyfrank.com
- **CC:** jeremy@intentsolutions.io
- **Subject:** Creative Wheel House Progress - YYYY-MM-DD
- **Attachments:**
  1. Session Report PDF (text + embedded diagrams)
  2. Visual Evolution PDF (cumulative diagrams only)

## Error Handling

| Error | Cause | Solution |
|-------|-------|----------|
| diagrams import error | venv not activated | `source .venv/bin/activate` |
| D2 not found | Not installed | Check `~/.local/bin/d2` |
| graphviz error | Missing dot binary | `sudo apt install graphviz` |
| PDF generation fails | Missing LaTeX packages | `sudo apt install texlive-xetex texlive-fonts-extra` |
| Resend API error | Invalid key | Check `RESEND_API_KEY` in `.env` file |
| No commits | Nothing to report | Skip or send status-only email |

## Examples

### Example 1: Full Session Delivery

```
/ship-shelly

Ship Shelly - Session 2026-01-09
Working from: /home/jeremy/000-projects/creative-wheel-house

SWEEP PHASE
  Found 5 uncommitted files
  Creating PR #45: "Session work: diagram automation"
  Waiting for review... approved
  Merged PR #45
  Cleaned 2 stale branches

DIAGRAM GENERATION
  GCP Architecture: graphics/2026-01-09-architecture.png (94 KB)
  Workflow: graphics/2026-01-09-workflow.png (234 KB)
  Progress: graphics/2026-01-09-progress.png (116 KB)

CHANGELOG
  Entry written: 2026-01-09
  Diagrams embedded inline

VISUAL CHANGELOG
  Updated: GRAPHIC-CHANGELOG.md
  Generated: GRAPHIC-CHANGELOG.pdf (4 pages)

PDF GENERATION
  Session Report: changelog-2026-01-09.pdf (312 KB, 3 pages)

VALIDATION
  [S]end to Shelly? > S

EMAIL
  Composing personalized email...
  Sending via Resend...
  Delivered to shelly@shellyfrank.com

COMPLETE - 2 attachments delivered
```

### Example 2: Test Mode

```
/ship-shelly --test

Ship Shelly - TEST MODE
All emails will be sent to jeremy@intentsolutions.io only

[proceeds with same workflow]

EMAIL
  TEST MODE: Redirecting to jeremy@intentsolutions.io
  Delivered successfully
```

## Resources

**Scripts:**
- `{baseDir}/scripts/generate-architecture.py` - GCP diagram with official icons
- `{baseDir}/scripts/generate-workflow.sh` - D2 workflow diagrams
- `{baseDir}/scripts/update-graphic-log.sh` - Cumulative visual changelog
- `{baseDir}/scripts/generate-pdf.sh` - Pandoc PDF generation
- `{baseDir}/scripts/send-email.py` - Resend multi-attachment delivery

**Templates:**
- `{baseDir}/templates/cwh-report.latex` - Professional PDF template

**References:**
- `{baseDir}/references/pandoc-options.md` - Full pandoc configuration
