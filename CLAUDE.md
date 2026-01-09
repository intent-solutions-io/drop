# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Multi-domain credibility infrastructure built on the **Situation Graph** framework. A collaboration with Creative House Studios (Glen Kerby, Shelly Frank).

## Repository Structure

```
creative-wheel-house/
├── packages/
│   ├── core/           # Master template (domain-agnostic)
│   ├── water/          # Water domain pack (IDLW pilot)
│   └── influencer/     # Influencer domain pack
├── _originals/         # Historical planning docs
├── dist/               # Auto-generated PDFs
├── .github/workflows/  # PDF automation
└── README.md
```

## Key Documents

- `packages/core/Situation-Graph-Spec-*.md` - The master framework
- `packages/core/Domain-Pack-Template-*.md` - Template for new domains
- `packages/[domain]/[Domain]-Pack-*.md` - Domain-specific implementations

## Versioning Convention

All specs use semantic versioning: `v00.00.01` format (major.minor.patch)

- **Patch:** Minor clarifications, typo fixes
- **Minor:** New sections, significant additions
- **Major:** Breaking changes to the framework

Include explicit change log at the top of each version.

## Creating New Domain Packs

1. Copy `packages/core/Domain-Pack-Template-*.md` to `packages/[domain]/`
2. Rename to `[Domain]-Pack-v00.00.01.md`
3. Fill in all sections for your domain
4. Create `packages/[domain]/CLAUDE.md` with domain-specific guidance

## PDF Generation

PDFs are auto-generated via GitHub Actions on push to main. Find them in:
- GitHub Releases (recommended)
- `dist/` folder

## Tech Stack (Future Code)

```
Language:        Python 3.11+
Framework:       FastAPI (API) + ADK (agents)
Models:          Claude 3.5 Sonnet + Gemini 1.5 via Vertex AI
Database:        Firestore (real-time) + BigQuery (analytics)
Infrastructure:  OpenTofu on Google Cloud
Deployment:      Cloud Run + Vertex AI Agent Engine
```

## Non-Negotiables

From the Situation Graph Spec - these apply to ALL domains:

- Fail closed on missing evidence anchors
- Append-only revisions (no silent overwrites)
- No outreach on stale/conflict/ambiguous items
- Quarantine public submissions until verified
- Policy gates enforced in code, not prompts
- Audit logs are immutable
- AI is copilot, never autopilot

## Working with This Repo

- **Docs only for now** - no code until framework validated
- **Rough drafts** - expect iteration based on stakeholder feedback
- **Shelly prefers deliberate pace** - validate before building
