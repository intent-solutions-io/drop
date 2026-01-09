# Creative Wheel House - Progress Log

The canonical record of this collaboration between Jeremy Longshore (Intent Solutions) and Creative House Studios (Glen Kerby, Shelly Frank).

This document is sent in full with each progress update. It serves as both changelog and project reference.

* * *

# Project Overview

## What We're Building

**Creative Wheel House** is a multi-domain credibility infrastructure built on the **CHS Credibility Spine** framework.

**Core idea:** A system for tracking "things happening somewhere over time with evidence." Every claim must be backed by evidence with provenance. No silent rewrites. Append-only history. Audit everything.

**Why it matters:** Current information systems let anyone publish anything. We're building the opposite - a framework where truth is engineered, not assumed. AI helps draft; humans and deterministic gates control what gets published.

## The CHS Credibility Spine Framework

The heart of the project is a domain-agnostic framework with these core entities:

| Entity | Purpose |
|--------|---------|
| **Node** | The thing being tracked (Location, Creator, Brand, Asset) |
| **Situation** | Evolving state about a Node (what's happening now) |
| **Claim** | Structured assertion with required type classification |
| **Evidence** | Source artifacts supporting/contradicting claims |
| **Assessment** | Verification level + bounded confidence + reviewer identity |
| **Revision** | Append-only change record (no silent overwrites) |
| **Endorsement** | External reference/backlink/mention |
| **Policy** | Rules gating actions (publish/outreach/visibility) |

**Non-negotiables (from the spec):**
- Fail closed on missing evidence anchors
- Append-only revisions (no silent overwrites)
- No outreach on stale/conflict/ambiguous items
- Quarantine public submissions until verified
- Policy gates enforced in code, not prompts
- Audit logs are immutable
- AI is copilot, never autopilot

## Domain Packs

The framework is domain-agnostic. Each domain implements it via a **Domain Pack** that defines:
- What entities are tracked (Nodes)
- What events happen
- How things are verified
- How fast things go stale

**Current domains:**
- **Water ($drop)** - Water quality tracking, the pilot domain (IDLW)
- **Influencer** - Creator credibility tracking (planned)

* * *

# Repository Structure

```
creative-wheel-house/
├── packages/
│   ├── core/                          # Domain-agnostic framework
│   │   ├── Situation-Graph-Spec-v00.00.01.md    # THE master spec
│   │   └── Domain-Pack-Template-v00.00.01.md    # Template for new domains
│   │
│   ├── water/                         # Water domain pack ($drop)
│   │   └── Water-Drop-Master-Plan-v00.04.05.md  # Water implementation
│   │
│   └── influencer/                    # Influencer domain (planned)
│
├── _originals/                        # Historical planning docs
│   └── drop/                          # Original planning materials
│
├── graphics/                          # Generated diagrams
│   └── [date]-*.png                   # Session diagrams
│
├── dist/                              # Auto-generated PDFs
│
├── .claude/                           # Claude Code configuration
│   └── skills/
│       └── ship-shelly/               # Progress report automation
│           ├── SKILL.md               # Skill definition
│           ├── scripts/               # Automation scripts
│           └── templates/             # PDF templates
│
├── CHANGELOG.md                       # This file (canonical record)
├── CLAUDE.md                          # Project instructions for Claude
├── README.md                          # Quick reference
└── graphic-changelog.md               # Visual evolution timeline
```

## What Each Directory Contains

### packages/core/
The domain-agnostic master framework. This is where the CHS Credibility Spine spec lives - the core entities, verification gates, and non-negotiable rules that apply to ALL domains.

**Key files:**
- `Situation-Graph-Spec-v00.00.01.md` - The master specification defining Nodes, Situations, Claims, Evidence, Assessments, Revisions, Endorsements, and Policies
- `Domain-Pack-Template-v00.00.01.md` - Template for creating new domain implementations

### packages/water/
The water domain pack, implementing the CHS Credibility Spine for water quality tracking. This is the pilot domain (IDLW - I Drink Living Water).

**Key files:**
- `Water-Drop-Master-Plan-v00.04.05.md` - Complete implementation plan including Truth Integrity Doctrine, Evidence Anchoring, Claim Types, Deterministic Gates, and MVP requirements

### packages/influencer/
Planned domain pack for creator/influencer credibility tracking. Currently empty - will be implemented after water domain is validated.

### .claude/skills/ship-shelly/
Automation for sending progress reports to Shelly. Generates professional PDFs, diagrams, and emails.

**Components:**
- `SKILL.md` - 12-step automation workflow definition
- `scripts/generate-architecture.py` - GCP architecture diagrams with official cloud icons
- `scripts/generate-workflow.sh` - D2 workflow diagrams
- `scripts/send-email.py` - Resend API email delivery
- `templates/cwh-report.latex` - Professional PDF template

* * *

# Technology Stack (When Building)

```
Language:        Python 3.11+
Framework:       FastAPI + ADK (Google Agent Development Kit)
Models:          Claude + Gemini via Vertex AI
Database:        Firestore (real-time) + BigQuery (analytics)
Infrastructure:  OpenTofu on Google Cloud
Deployment:      Cloud Run + Vertex AI Agent Engine
```

* * *

# Session History

## Session: Jan-09-2026 (Evening)

### Summary

Enhanced the `/ship-shelly` skill with professional diagram generation and fixed critical issues with API key management and PDF generation.

### Progress Made

- **Diagram Generation Scripts**: Added Python script for GCP architecture diagrams using official cloud icons, and bash scripts for D2 workflow diagrams
- **Visual Changelog**: New cumulative visual timeline showing project evolution through diagrams
- **API Key Fix**: Switched from `pass` to `.env` for Resend API key (pass requires GPG pinentry GUI unavailable in headless terminals)
- **PDF Generation Fix**: Fixed YAML parsing issue in pandoc by using `* * *` instead of `---` for horizontal rules
- **Comprehensive CHANGELOG**: Rewrote this document to be the canonical reference for the entire project

### Decisions Made

| Decision | Rationale |
|----------|-----------|
| Switch from `pass` to `.env` for API keys | `pass` requires GPG pinentry GUI; `.env` works in all terminals |
| Use `* * *` for horizontal rules | Avoids pandoc confusing `---` with YAML front matter |
| Date format: `Jan-09-2026` | More readable than ISO format |
| Lowercase `graphic-changelog` | Standard naming convention |
| CHANGELOG as canonical doc | Single source of truth sent in full each time |

### Next Priorities

1. Complete first successful test email delivery
2. Get Shelly's GitHub username for repo access
3. Begin Water Drop implementation once collaboration access confirmed

* * *

## Session: Jan-09-2026

### Summary

Built the `/ship-shelly` skill - an end-of-session automation that packages progress updates into professional PDF reports and emails them directly to Shelly. This is the first piece of operational infrastructure for our collaboration.

### Progress Made

- **Ship-Shelly Skill**: Complete 12-step automation workflow (commit, PR, changelog, PDF, email)
- **Professional PDF Template**: Custom LaTeX template with Creative Wheel House branding
- **Email Integration**: Resend API integration with test mode for safe development
- **Validation-Compliant**: Skill passes all enterprise standard checks

### Decisions Made

| Decision | Rationale |
|----------|-----------|
| Pandoc + xelatex for PDFs | Best Unicode support, professional output |
| Claude writes changelog/email | Natural language vs rigid templating |
| Test mode sends only to Jeremy | Safe testing without accidentally emailing Shelly |

### Files Created

- `.claude/skills/ship-shelly/` - Complete skill with scripts and templates
- `CHANGELOG.md` - This progress log
- `packages/water/Water-Drop-Master-Plan-v00.04.05.md` - Water Drop master plan

* * *

# Questions for Shelly

1. **GitHub access**: What's your GitHub username so we can add you to the repository?
2. **Changelog approach**: Does this comprehensive format work for you, or would you prefer something different?
3. **Validation needed**: The spec says "Claude writes changelog/email (not templates)" needs validation - are you comfortable with AI-generated natural language reports?

* * *

# How to Use This Document

**For quick updates:** Read the most recent Session entry (at the top of Session History)

**For context:** Read Project Overview and Repository Structure

**For deep dives:** The full specs are in `packages/core/` and `packages/water/`

**To respond:** Reply to the email with questions, feedback, or concerns

* * *

*This document is sent in full with each progress update.*
