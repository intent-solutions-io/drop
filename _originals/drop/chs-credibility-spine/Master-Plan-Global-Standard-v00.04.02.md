**Project Name:** $drop
**Document:** Master Plan — Global Standard + Credibility Spine
**Version:** v00.04.02

---

## Change Log (small)
- Consolidated prior master plan material into this single document.
- Added "Credibility Spine" sections: provenance, evidence anchoring, deterministic publish gates, append-only revision safety.
- Added adversarial posture: poisoning, prompt injection, forged documents, and cost attacks; mitigations and quotas.
- Added re-verification ops: schedules, SLAs/monitoring, escalation workflows, and public stale labeling.
- Strengthened governance-as-moat: uncertainty transparency, correction-friendly design, conflict-aware representation, policy-driven automation.
- Clarified canonical index: Location Node pages + auditable API + revision log; geomap is the projection/interface.

---

# 1) North Star Outcome

$drop becomes the default global reference system for "what's happening, where, when, and based on what evidence" — starting with water, then expanding to other domains via a shared standard.

**Outcomes (observable):**
- Institutions cite **Location Node URLs** in policy briefs, syllabi, research, journalism, and resource pages.
- Every published claim is traceable to **Evidence** with provenance (snapshots, hashes, anchors).
- Updates never silently rewrite history; changes are append-only and auditable.
- Re-verification is disciplined: freshness is visible, enforced, and operationalized.

---

# 2) Product Thesis: Water as a Commodity of Value (global spin)

Water is a commodity of value (like coffee, livestock, oil, gas)—but unlike most commodities, it is simultaneously essential, local, regulated, politicized, and systemically under-instrumented. $drop turns fragmented signals into a verifiable global reference layer.

## 2.1 Commodity framing (why it matters)
Water behaves like a commodity because it has:
- supply constraints (availability, infrastructure capacity)
- demand drivers (agriculture, industry, population growth)
- quality grades (potability, contamination thresholds)
- logistics & bottlenecks (treatment plants, pipes, rights-of-way)
- regional scarcity and price pressure (not globally fungible)
- regulatory constraints (rights, permits, standards, advisories)

Key difference: water is not fully tradable like oil—its value is local, political, and constrained by infrastructure and rights. $drop's value is to quantify and explain the "water condition premium/discount" for a location and time period.

## 2.2 What $drop can uniquely compute (later phases)
Once you have coverage and verified historical timelines, $drop can compute:
- **Water Condition Index (WCI)** per location (quality × availability × reliability)
- **Scarcity Pressure Index** (drought + demand proxies + infrastructure stress)
- disruption counts and durations (boil notices, outages, contamination spikes)
- risk-adjusted signals (for insurers, ESG, infrastructure investors, supply chains)

Constraint: do not overclaim fungible pricing; $drop is a **reference + risk layer** that supports economic analysis.

---

# 3) Core Innovation (zoom out)

You're not building "content + SEO." You're building a living intelligence layer:
- Stories are events
- Locations are anchors
- Backlinks are endorsements
- Maps are proof of scale
- Agents run the loop continuously

**Canonical truth index:** crawlable **Location Node pages + auditable API + append-only revisions**.
**Geomap:** the canonical interface to the truth index (projection/view).

---

# 4) Flywheel Recipes (the engine)

## 4.1 Recipe 1 — Story → Map → Link Authority Flywheel (foundational)
Each new event:
- activates a location
- generates multiple linkable assets
- triggers outreach (gated/throttled)
- permanently upgrades domain authority

Loop:
1) event is published
2) location lights up on the map
3) node + map projection update automatically
4) agents generate citations + outreach drafts
5) backlinks point to: story / node / dataset
6) authority compounds
7) map becomes more credible
8) future stories earn links faster

## 4.2 Recipe 2 — Geomap as a Backlink Magnet (institutional)
1) critical mass (10–20 lit locations)
2) institutions reference the map/node URLs
3) node URLs become the citations
4) stories inherit authority automatically
5) more institutions engage
6) map becomes default reference

## 4.3 Recipe 3 — Distributed Story Network (scaling)
1) external creator submits a story
2) validation: sources, ethics, geo accuracy
3) approved story updates node
4) creator links back to node + commons page + canonical citation block
5) their audience sees the map
6) new creators want in
7) network expands

---

# 5) Users and Value

## 5.1 Core users
- journalists (verification + citations)
- NGOs (evidence hubs + advocacy)
- policy staff (briefs + defensible references)
- researchers (structured history + datasets)
- communities (trusted summary + actions)
- internal operators (ops discipline + governance)

## 5.2 Expansion users (commodity/value layer)
- insurers / risk analysts
- infrastructure investors / funders
- corporate supply chain + ESG teams
- utilities (official updates + corrections)

---

# 6) What gets published (per event)

On approved event publish, auto-create:
1) **Story Page** (long-form, referenceable)
2) **Location Node Page** (canonical place URL; snapshot + history)
3) **Data Appendix** (sources, measurements, methods)
4) **Educational Summary** (neutral, quotable)
Optional:
- dataset/API endpoint
- embeddable node card + cite widget

Different institutions link to different assets, but all point back to $drop.

---

# 7) The Canonical Data Model (Situation Graph)

$drop becomes a global standard by implementing a domain-agnostic "Situation Graph" and then shipping domain packs.

## 7.1 Situation Graph core entities
- **Node:** entity (Location, Organization, Infrastructure, Asset)
- **Situation:** evolving state about a Node
- **Claim:** structured assertion
- **Evidence:** source artifacts supporting/contradicting claims
- **Assessment:** verification level + bounded confidence + reviewer identity
- **Revision:** append-only change record
- **Endorsement:** backlink/mention/reference
- **Policy:** rules gating actions (publish/outreach/visibility)

## 7.2 Water Pack v1 (domain pack)
Defines:
- event types (boil notice, PFAS, drought, flood, infrastructure failure, etc.)
- metrics and units
- minimum-source rules per type
- freshness SLAs per type
- sensitive-location rules (including consent flags)
- "what counts as primary" by geography

---

# 8) Credibility Spine (Truth + Adversaries + Governance)

## 8.1 Truth is not a text problem
AI can summarize, but it can't guarantee:
- sources are authentic
- claims match sources
- the right place is chosen (geo ambiguity)
- conflicts are handled correctly
- updates don't silently corrupt history

Therefore: AI produces **proposals**, not publishable truth. Publishable truth requires **provenance + deterministic gates + auditability**.

## 8.2 Publishability (Truth Contract)
A statement is publishable only if:
1) It maps to one or more **Evidence** objects with provenance metadata.
2) The **Claim** is structured and traceable to exact **evidence anchors**.
3) The **Location** is resolved via deterministic geo rules (ambiguity explicit).
4) Conflicts are represented (not overwritten).
5) The change is recorded as an **append-only Revision** with reason + actor + correlation IDs.

## 8.3 Evidence Anchoring (prevents summary drift)
Every key claim MUST store:
- `evidence_anchor`: page/section/quote-span/table-row/timestamp
- `retrieval_snapshot_ref`: frozen copy pointer (or canonical snapshot)
- `content_hash`: hash of the snapshot
- `retrieved_at`, `publisher`, `domain_trust_tier`

Fail-closed rule: **no anchors → no publish** for snapshot claims.

## 8.4 Deterministic publish gates (code, not prompts)
All gates run in code as part of the Truth Pipeline:

- **Gate A — Source Authenticity:** allowlist + trust tiers, lookalike detection, snapshot hashing
- **Gate B — Claim Alignment:** key claims require anchors; coverage check; fail closed
- **Gate C — Geo Correctness:** canonical gazetteer IDs; ambiguity workflow; no low-confidence auto-publish
- **Gate D — Conflict Handling:** competing claims shown; escalation required early
- **Gate E — History Integrity:** append-only revisions; optimistic concurrency; timeline regression checks

## 8.5 Adversaries exist (threat model)
Assume attempts to:
- poison submissions
- manipulate narratives
- trigger costly agent loops
- inject prompt attacks through sources
- fabricate official-looking documents

## 8.6 Adversarial controls (required)
- submission quarantine + reputation scoring
- retrieval/fetch allowlists + SSRF protections + redirect controls
- prompt injection resistance (external content cannot control tools)
- forgery workflow (prefer source URLs; cross-check authoritative postings; manual review early)
- cost controls (throttles, budgets, backpressure, circuit breakers)
- outreach safety (campaign approval, throttling, opt-out enforcement; no outreach on stale/conflict/ambiguous cases)
- audit logs for approvals, overrides, and outreach sends

## 8.7 Governance is the moat
Institutions cite systems that are:
- consistent
- transparent about uncertainty
- correction-friendly
- conflict-aware
- policy-driven

Governance primitives:
- policy engine (publish/outreach/visibility gates)
- provenance (snapshots, hashes, anchors)
- audit logs (immutable)
- corrections policy (append-only revisions)
- uncertainty model (verification levels)
- conflict model (no silent truth picking)

---

# 9) Re-Verification Ops (freshness discipline)

## 9.1 Freshness fields and states
Every location/event tracks:
- `last_verified_at`
- `reverify_due_at`
- `freshness_state`: Fresh / Due Soon / Stale / Critical
- `freshness_reason`: time-based, new signal, conflict, missing source, etc.

## 9.2 Re-verification schedule baseline
Cadence varies by event type and state:

**High volatility (fast decay)** — boil notices, do-not-drink, outages
- reverify every 6–24 hours while ongoing
- after resolved: reverify at 7 days

**Medium volatility** — spills, acute contamination, infra failures
- reverify every 24–72 hours while ongoing
- after resolved: reverify at 14–30 days

**Slow-moving conditions** — chronic contamination investigations, sampling programs
- reverify every 30–90 days or on new lab result/official update

**Long-horizon signals** — drought / watershed stress
- weekly to monthly depending on source cadence

Trigger overrides:
- new credible signal → pull reverify_due_at forward
- conflict → immediate recheck + escalation
- official posting change → immediate recheck

## 9.3 Stale labeling (public)
Node pages must show:
- last verified
- freshness state
- verification level
- change log link

When stale:
- show banner "Not verified since X"
- suppress outreach
- prioritize re-verification jobs

---

# 10) SLAs, Monitoring, and Escalation

## 10.1 SLAs / SLOs (examples)
- freshness compliance (% nodes not overdue)
- re-verification lag (due → verified)
- signal response time (signal → proposal)
- approval queue time (proposal → publish)
- endorsement detection lag
- DLQ size and job failure rates

## 10.2 Situation Monitor panels (ops)
- freshness SLA panel
- re-verification queue
- geo ambiguity + conflicts queue
- approvals queue
- revisions/change log feed
- cost/backpressure panel
- outreach throttle status
- endorsement/referring domains feed
- coverage gaps panel

## 10.3 Escalation ladder
- L0 auto proposal only
- L1 operator review (ambiguity/conflict/unknown domains)
- L2 senior review (sensitive locations, legal-risk, high-impact changes)
- L3 external verification (partner/verified publisher required)

Stop conditions require escalation for:
- geo ambiguity
- conflicts
- forged/official-looking documents
- new untrusted domains
- sensitive/consent flagged locations
- major verification level upgrades/downgrades

---

# 11) Architecture (Edge + Cloud, Event-Driven)

## 11.1 Two pipelines
**Truth Pipeline (integrity)**
1) ingest signals (quarantine classification)
2) normalize + dedupe
3) geo resolve (ambiguity handling)
4) extract claims + attach evidence anchors
5) deterministic gates (A–E, fail closed)
6) approval gate (early)
7) append-only revision apply
8) publish assets + API read models
9) schedule re-verification

**Authority Pipeline (endorsements)**
1) select link targets
2) draft outreach by segment
3) throttled sends + opt-out
4) monitor endorsements
5) coverage gap targeting (suggestions only)

Guardrail: authority pipeline cannot alter canonical truth.

## 11.2 Edge / local-first
- offline submissions + media + GPS
- on-device PII redaction
- encrypted local store
- sync sanitized artifacts + hashes

## 11.3 Sync & conflict resolution
- canonical facts append-only (no overwrites)
- drafts/layouts merge rules (CRDT optional)
- conflicts create review tasks (no silent drops)

---

# 12) Agentic System (clean, gated, auditable)

## 12.1 Agents (Truth pipeline)
- Signal Intake
- Dedup/Cluster
- Geo Resolution
- Claim Extraction (structured)
- Source QA (allowlist + anchors)
- Conflict Detector
- Freshness Scheduler

## 12.2 Agents (Authority pipeline)
- Asset Targeting
- Outreach Drafting
- Endorsement Monitor
- Coverage Gap

## 12.3 OODA loops + Structured Autonomy (minimum)
All agents must:
- Perceive: ingest + retrieve canonical context
- Reason: output structured proposal diffs
- Act: only via tool schemas
- Stop: require gates + approvals for publish/outreach

Tools must define:
- JSON schemas IO
- idempotency keys
- rate limits, retries, DLQ behavior
- allowed domains and PII/logging constraints

---

# 13) Integrations & Standardization

## 13.1 Public API (versioned)
Read endpoints (v1):
- locations, location detail, location events
- events, evidence, revisions
- endorsements (aggregate)

## 13.2 Webhooks
- location changed
- status changed
- verification level changed
- conflict flagged
- freshness became stale/critical

## 13.3 Embeds
- node card
- timeline widget
- cite block widget

## 13.4 SDKs + CLI
- JS + Python SDKs
- CLI for institutions/researchers to query and export references

---

# 14) Federation (how $drop becomes the standard)

## 14.1 Verified Publisher Program
- publishers provide signed feeds
- conformance tests against the Situation Graph + Water Pack specs
- trust tiers determine automation privileges

## 14.2 Integrity spine ("don't trust us, verify us")
- content hashing for evidence snapshots
- signed revisions
- transparency log (public change ledger for nodes)

---

# 15) Roadmap (execution)

## Phase 1 — Skateboard (credibility first)
Ship:
- canonical data model + append-only revisions
- evidence snapshots + hashing + anchors
- geo ambiguity workflow
- conflict representation
- Truth pipeline with approval gate
- node pages with: status, verification level, last verified, stale banner, change log
- situation monitor: signals/conflicts/approvals/freshness queues
- cost controls: throttles, budgets, backpressure, circuit breakers
- endorsement tracking baseline (manual or semi-automated)
- outreach: gated/manual with opt-out (no automation yet)

Target: 10–20 lit locations with defensible evidence.

## Phase 2 — Bicycle (safe scale)
- automated re-verification jobs + alerting
- API v1 + webhooks
- embeds + basic SDK
- contributor submissions with reputation + quarantine
- automated endorsement monitoring

## Phase 3 — Motorcycle (standardization + federation)
- publish specs (Situation Graph + Water Pack v1)
- verified publishers + signed feeds
- conformance test suite
- stronger automation privileges for trusted feeds

## Phase 4 — Car (commodity layer)
- WCI + scarcity/disruption indices
- premium analytics for insurers/ESG/supply chain
- enterprise SLAs, audit exports, compliance features

---

# 16) Monetization (aligned to governance and scale)

- **Public:** node pages + map (limited API)
- **Pro:** monitors/alerts, export packs (briefs/press kits), higher API limits
- **Enterprise:** federation support, signed feeds, indices, SLAs, audit exports, private deployments as needed

---

# 17) Success Metrics

Credibility:
- % snapshot claims with valid evidence anchors
- conflict resolution time
- correction turnaround time
- freshness compliance

Adoption:
- number of referring domains (edu/ngo/gov)
- number of institutions embedding/citing node URLs
- API/webhook subscriptions

Operations:
- proposal-to-publish lead time
- cost per verified update (bounded)
- DLQ stability and incident rate

---

# 18) Non-Negotiables (build rules)
- fail closed on missing evidence anchors for snapshot claims
- no silent overwrites; revisions are append-only
- no outreach on stale/conflict/ambiguous geo
- quarantine all public submissions until verified
- policy gates enforced in code
- audit logs are immutable
- rate limits and budgets exist from day one
