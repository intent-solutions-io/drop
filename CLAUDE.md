# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Multi-domain credibility infrastructure built on the **CHS Credibility Spine** framework. A collaboration with Creative House Studios (Glen Kerby, Shelly Frank).

**Core idea:** A system for tracking "things happening somewhere over time with evidence." Every claim must be backed by evidence with provenance. No silent rewrites. Append-only history. Audit everything.

## Repository Structure

```
creative-wheel-house/
├── packages/
│   ├── core/                    # Domain-agnostic framework (master spec)
│   │   ├── Situation-Graph-Spec-v00.00.01.md
│   │   └── Domain-Pack-Template-v00.00.01.md
│   ├── water/                   # Water domain pack ($drop, IDLW pilot)
│   │   └── Water-Drop-Master-Plan-v00.04.05.md
│   └── influencer/              # Influencer domain pack (planned)
├── graphics/                    # Generated diagrams (Jan-09-2026-*.png)
├── _originals/                  # Historical planning docs
├── dist/                        # Auto-generated PDFs
├── .claude/
│   └── skills/
│       └── ship-shelly/         # Progress report automation
│           ├── SKILL.md
│           ├── scripts/         # PDF gen, email, diagrams
│           └── templates/       # LaTeX template
├── CHANGELOG.md                 # Canonical progress log (sent to Shelly)
├── graphic-changelog.md         # Visual evolution timeline
├── changelog-Jan-09-2026.pdf    # Session report PDF
└── graphic-changelog.pdf        # Visual changelog PDF
```

## Key Commands

### Progress Reports to Shelly
```bash
/ship-shelly           # Full run: commit, PR, diagrams, PDF, email to Shelly
/ship-shelly --test    # Test mode: sends to Jeremy only
```

### What /ship-shelly Does
1. Sweeps repo (commit, PR, merge)
2. Generates GCP architecture diagrams (Python diagrams library)
3. Generates workflow diagrams (D2)
4. Updates CHANGELOG.md with session entry
5. Generates professional PDFs (pandoc + xelatex)
6. Emails Shelly with attachments via Resend API

## Key Documents

- `CHANGELOG.md` - THE canonical document, sent in full each session
- `packages/core/Situation-Graph-Spec-*.md` - CHS Credibility Spine master spec
- `packages/core/Domain-Pack-Template-*.md` - Template for new domains
- `packages/water/Water-Drop-Master-Plan-*.md` - Water domain implementation

## Versioning Convention

All specs use semantic versioning: `v00.00.01` format (major.minor.patch)

- **Patch:** Minor clarifications, typo fixes
- **Minor:** New sections, significant additions
- **Major:** Breaking changes to the framework

## Date Format

Use `Jan-09-2026` format (Mon-DD-YYYY), not ISO format.

## Tech Stack (Future Code)

```
Language:        Python 3.11+
Framework:       FastAPI (API) + ADK (agents)
Models:          Claude + Gemini via Vertex AI
Database:        Firestore (real-time) + BigQuery (analytics)
Infrastructure:  OpenTofu on Google Cloud
Deployment:      Cloud Run + Vertex AI Agent Engine
```

## Non-Negotiables

From the CHS Credibility Spine Spec - these apply to ALL domains:

- Fail closed on missing evidence anchors
- Append-only revisions (no silent overwrites)
- No outreach on stale/conflict/ambiguous items
- Quarantine public submissions until verified
- Policy gates enforced in code, not prompts
- Audit logs are immutable
- AI is copilot, never autopilot

## Working with This Repo

- **Docs + automation** - Framework docs and progress reporting operational
- **Rough drafts** - Expect iteration based on stakeholder feedback
- **Shelly prefers deliberate pace** - Validate before building
- **Use CHS Credibility Spine** - Not "Situation Graph" in communications

## Environment Setup

```bash
# For /ship-shelly to work
source .venv/bin/activate           # Python venv with diagrams, resend
~/.local/bin/d2 --version           # D2 for workflow diagrams
pandoc --version                    # PDF generation
cat .env                            # RESEND_API_KEY must be set
```
