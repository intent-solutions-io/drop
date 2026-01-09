# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**$drop** is a water-first "Situation Graph" platform designed to become the global standard for "things happening somewhere over time with evidence." The canonical output is citeable Location Node URLs backed by auditable evidence, revisions, and APIs. The geomap is the interface/projection to this truth index.

## Current State

This repository currently contains planning documents only. No code has been implemented yet.

## Document Structure

```
drop/
└── chs-credibility-spine/
    └── Master-Plan-Global-Standard-v*.md   # Versioned master plan documents
```

## Document Versioning

Master plan documents use semantic versioning: `v00.04.04` format (major.minor.patch). When editing or creating new versions:
- Increment patch for minor clarifications
- Increment minor for new sections or significant changes
- Include explicit change log at the top of each version

## Key Architectural Concepts

### Situation Graph (Domain-Agnostic Core)
- **Node**: entity (Location, Organization, Infrastructure, Asset)
- **Situation**: evolving state about a Node
- **Claim**: structured assertion
- **Evidence**: source artifacts with provenance
- **Assessment**: verification level + confidence + reviewer
- **Revision**: append-only change record
- **Endorsement**: external reference/backlink
- **Policy**: rules gating actions

### Two-Pipeline Architecture
1. **Truth Pipeline** (integrity-critical): ingest → normalize → geo resolve → extract claims → gates → approve → publish → reverify
2. **Authority Pipeline** (endorsements): target → draft outreach → throttled sends → monitor → expand

### Non-Negotiables (Build Rules)
- Fail closed on missing evidence anchors
- Append-only revisions (no silent overwrites)
- No outreach on stale/conflict/ambiguous items
- Quarantine public submissions until verified
- Policy gates enforced in code
- Immutable audit logs
- Rate limits and budgets from day one

## Domain Packs

- **Water Pack v1**: event types (boil notices, PFAS, drought, flood), metrics, minimum-source rules, freshness SLAs
- **Civic Pack v1** (planned): municipal agendas, minutes, votes, ordinances connected to water infrastructure

## Roadmap Phases

1. **Skateboard** (credibility-first): 10-20 lit locations with defensible evidence
2. **Bicycle** (safe scale): automated re-verification, API v1, contributor submissions
3. **Motorcycle** (federation): published specs, verified publishers, signed feeds
4. **Car** (commodity layer): WCI indices, premium analytics, enterprise features
