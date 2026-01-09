# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## About This Directory

This is the `_originals/drop/` directory containing **historical planning documents** for the $drop water project. These are reference materials preserved for context.

**Note:** Active development has moved to `packages/water/` in the parent repository.

## Project Overview

**$drop** is a water-first platform built on the CHS Credibility Spine framework, designed to become the global standard for "things happening somewhere over time with evidence." The canonical output is citeable Location Node URLs backed by auditable evidence, revisions, and APIs.

## Document Structure

```
drop/
└── chs-credibility-spine/
    └── Master-Plan-Global-Standard-v*.md   # Versioned master plan documents
```

## Key Architectural Concepts

### CHS Credibility Spine (Domain-Agnostic Core)
- **Node**: entity (Location, Organization, Infrastructure, Asset)
- **Situation**: evolving state about a Node
- **Claim**: structured assertion with type classification
- **Evidence**: source artifacts with provenance
- **Assessment**: verification level + confidence + reviewer
- **Revision**: append-only change record
- **Endorsement**: external reference/backlink
- **Policy**: rules gating actions

### Non-Negotiables (Build Rules)
- Fail closed on missing evidence anchors
- Append-only revisions (no silent overwrites)
- No outreach on stale/conflict/ambiguous items
- Quarantine public submissions until verified
- Policy gates enforced in code, not prompts
- Immutable audit logs
- AI is copilot, never autopilot

## Current Status

These are **historical reference documents**. For current work:
- See `packages/water/Water-Drop-Master-Plan-v00.04.05.md`
- See `CHANGELOG.md` in project root for progress updates
