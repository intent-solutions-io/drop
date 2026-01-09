**Specification:** Situation Graph
**Version:** v00.00.01
**Status:** ROUGH DRAFT - Validate with stakeholders before building

---

## What This Is

A domain-agnostic framework for tracking "things happening somewhere over time with evidence." Any domain (water, influencer, food, civic) implements this spec via a Domain Pack.

---

# 1) Core Entities

Every Situation Graph implementation uses these primitives:

| Entity | Purpose |
|--------|---------|
| **Node** | The thing being tracked (Location, Creator, Brand, Asset, Organization) |
| **Situation** | Evolving state about a Node (what's happening now) |
| **Claim** | Structured assertion with required type classification |
| **Evidence** | Source artifacts supporting/contradicting claims |
| **Assessment** | Verification level + bounded confidence + reviewer identity |
| **Revision** | Append-only change record (no silent overwrites) |
| **Endorsement** | External reference/backlink/mention |
| **Policy** | Rules gating actions (publish/outreach/visibility) |

---

# 2) Claim Types (Required Classification)

Every claim must be typed. Not everything is the same kind of truth:

| Claim Type | Description | Verification Rules |
|------------|-------------|-------------------|
| **Measurement** | Numerical result with unit + method | Requires source + method metadata |
| **Advisory** | Official notice issued/lifted | Requires official source + timestamp |
| **Official Statement** | Press release, government posting | Requires authoritative URL |
| **Allegation** | Must be labeled as such | Lower verification ceiling; attribution required |
| **Observation** | Community/witness report | Lower trust tier; requires corroboration for upgrade |

---

# 3) Evidence Anchors (Required Schema)

For every Claim → Evidence link, store "where in the source" it came from:

```
evidence_anchor: {
  page: number | null,
  section: string | null,
  quote_span: { start: number, end: number } | null,
  table_row: number | null,
  timestamp: ISO8601 | null
}
retrieval_snapshot_ref: string   # Frozen copy pointer
content_hash: string             # Hash of the snapshot
retrieved_at: ISO8601
publisher: string
domain_trust_tier: "official" | "accredited" | "news" | "community" | "unknown"
```

**Fail-closed rule:** No anchors → no publish for snapshot claims.

---

# 4) Verification Levels

| Level | Meaning | Requirements |
|-------|---------|--------------|
| **Unverified** | Internal-only or clearly labeled | No verification gates passed |
| **Source-Backed** | Single credible source | Gate A + B passed |
| **Multi-Source Verified** | Multiple independent sources | 2+ sources, Gate A-D passed |
| **Official** | Verified publisher / authoritative posting | Verified Publisher feed or official URL |

---

# 5) Deterministic Gates (Code, Not Prompts)

All truth checks run as explicit gates in code. Gates fail closed.

## Gate A — Source Authenticity
- Allowlist + trust tiers per domain
- Snapshot storage + content hashing
- Detect lookalike domains (typosquatting)
- Store `domain_trust_tier` on every evidence object

## Gate B — Claim-to-Source Alignment
- Require evidence anchors for all key claims
- "Claim coverage" check: each key claim must reference specific anchors
- Fail closed if anchors are missing or mismatched

## Gate C — Resolution Correctness
- Canonical identifiers with stable IDs (not free-text names)
- Ambiguity workflow: require operator resolution OR additional disambiguation
- Never silently "pick" at low confidence
- Store confidence score and ambiguity flags

## Gate D — Conflict Handling
- If conflicting sources detected: mark conflict status
- Show competing claims with full provenance + uncertainty
- Require human approval for publish when conflict present
- Block outreach during conflict state

## Gate E — History Integrity
- Optimistic concurrency on all revision writes
- Prevent "silent history rewrite" via version checks
- Automated regression checks (no missing events, no timeline gaps)
- Rollback-by-revision: revert is a new revision, never a delete

---

# 6) Two-Pipeline Architecture

## Truth Pipeline (Integrity-Critical)
1. Ingest signals → quarantine classification
2. Normalize + dedupe with rate limits
3. Resolve identity (ambiguity triggers stop condition)
4. Extract claims with evidence anchors (required)
5. Deterministic gates A-E (fail closed)
6. Human approval gate (P0)
7. Append-only revision apply
8. Publish assets
9. Schedule re-verification

## Authority Pipeline (Risk-Managed)
1. Select link targets (published, verified assets only)
2. Generate outreach drafts
3. Throttled sends + opt-out enforcement
4. Monitor endorsements
5. Propose coverage expansions (suggestions only)

**Guardrail:** Authority pipeline cannot mutate truth.

---

# 7) Freshness Model

Every Node tracks:

```
last_verified_at: ISO8601
reverify_due_at: ISO8601
freshness_state: "Fresh" | "Due Soon" | "Stale" | "Critical"
verification_level: "Unverified" | "Source-Backed" | "Multi-Source" | "Official"
freshness_reason: string   # Why it's due: time-based, new signal, conflict, etc.
```

**Stale Behavior (Fail-Safe):**
- Show prominent banner: "Not verified since [date]"
- Suppress outreach (do not amplify stale nodes)
- Prioritize re-verification job creation
- Downgrade in search/discovery rankings

---

# 8) Human-in-the-Loop Requirements (P0)

Human approval required for:
- Publishing any new Node for the first time
- Any conflict case between credible sources
- Any identity ambiguity case
- Any "official-looking documents" submitted by users
- Any outreach send beyond a small daily limit
- Any verification level upgrade/downgrade
- Any content touching sensitivity flags
- Any allegations implicating individuals/organizations

---

# 9) Adversarial Controls (Required)

## Control 1 — AI Cannot Take Side Effects
Agents only produce **proposals** (structured diffs). Only gated services apply changes.

## Control 2 — Retrieval Allowlists
Fetch only from allowlisted domains. Block internal IP ranges, cloud metadata. Strict redirect policy.

## Control 3 — Submission Quarantine
All public submissions land in quarantine. No auto-publish, no auto-outreach.

## Control 4 — Forgery Detection
Require source URL when possible. Compare against authoritative postings. Manual review for official-looking documents.

## Control 5 — Cost & Rate Controls
Per-user/IP submission limits. Daily budgets for LLM calls. Backpressure in queues. Circuit breakers.

## Control 6 — Audit + Transparency
Immutable audit log. Public change log for nodes. Rollback-by-revision.

## Control 7 — Outreach Safety
Throttled, campaign-approved. Never auto-outreach on unverified/conflict/stale content.

---

# 10) Revision Safety

- Canonical records are **append-only**
- Corrections create new revisions (no "edit in place")
- Public pages show: `last_verified_at`, `verification_level`, `change_log_link`
- Every revision has: reason, actor, correlation IDs

---

# 11) Non-Negotiables (Universal Build Rules)

- Fail closed on missing evidence anchors for snapshot claims
- No silent overwrites; revisions are append-only
- No outreach amplification on stale/conflict/ambiguous items
- Quarantine public submissions until verified
- Policy gates enforced in code, not prompts
- Audit logs are immutable and tamper-evident
- Rate limits and budgets exist from day one
- Human approval required for all P0 escalation triggers
- AI is copilot, never autopilot

---

# 12) Domain Pack Interface

Each domain implements this spec by defining:

| Component | What to Define |
|-----------|----------------|
| **Node Types** | What entities are tracked (Location, Creator, Brand, etc.) |
| **Event Types** | What kinds of things happen (Boil Notice, Brand Deal, etc.) |
| **Claim Types** | Domain-specific claim classifications |
| **Metrics & Units** | How things are measured |
| **Source Rules** | What counts as evidence, trust tiers by source type |
| **Freshness SLAs** | How fast things go stale, re-verification cadence |
| **Sensitivity Rules** | Consent flags, restricted content handling |
| **Verification Levels** | Domain-specific requirements for each level |

See `Domain-Pack-Template-v00.00.01.md` for the template.

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| v00.00.01 | 2025-01-09 | Initial rough draft extracted from $drop Master Plan v00.04.05 |
