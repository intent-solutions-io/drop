# Creative Wheel House

Multi-domain credibility infrastructure built on the **Situation Graph** framework.

## Quick Navigation

| Folder | Purpose |
|--------|---------|
| `packages/core/` | Master template - domain-agnostic Situation Graph spec |
| `packages/water/` | Water domain pack (IDLW pilot) |
| `packages/influencer/` | Influencer domain pack |
| `_originals/` | Historical planning docs |
| `dist/` | Auto-generated PDFs (download from Releases) |

## Latest Versions (PDFs)

**Go to [Releases](../../releases)** to download PDFs of latest specs.

Or view markdown directly:
- [Situation Graph Spec](packages/core/Situation-Graph-Spec-v00.00.01.md)
- [Domain Pack Template](packages/core/Domain-Pack-Template-v00.00.01.md)

## What Is This?

A framework for tracking "things happening somewhere over time with evidence."

**Core idea:** Any claim must be backed by evidence with provenance. No silent rewrites. Append-only history. Audit everything.

**Domains:** The framework is domain-agnostic. Each domain (water, influencer, food, etc.) implements it via a Domain Pack that defines:
- What entities are tracked (Nodes)
- What events happen
- How things are verified
- How fast things go stale

## Tech Stack (When Building)

```
Language:        Python 3.11+
Framework:       FastAPI + ADK (Google Agent Development Kit)
Models:          Claude + Gemini via Vertex AI
Database:        Firestore + BigQuery
Infrastructure:  OpenTofu on Google Cloud
```

## Status

**Current phase:** Documentation and framework design (rough drafts)

---

*Part of the Creative House Studios collaboration*
