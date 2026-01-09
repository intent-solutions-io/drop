**Project Name:** $drop
**Document:** Master Plan — Global Standard + Credibility Spine
**Version:** v00.04.04
**Positioning:** Water-first "Situation Graph" platform that becomes the global standard for "things happening somewhere over time with evidence."
**Core Output:** The canonical, citeable truth index is the set of **Location Node URLs** (plus their evidence, revisions, and APIs). The geomap is the canonical interface (projection) to that index.

---

## Change Log (explicit)

### From v0.4 PDF → v00.04.04
1. **Naming**: Rebranded from WheelFly to **$drop** everywhere (titles, language, examples).
2. **Canonical truth clarification**: "Map as canonical truth" is refined into:
   - **Canonical truth index** = Location Node URLs + API read model + append-only revision log
   - **Geomap** = canonical interface/projection (proof-of-scale + discovery)
3. **Credibility Spine added (P0)**: "Truth is not a text problem" becomes a first-class engineering principle:
   - evidence authenticity checks
   - claim-to-evidence anchoring requirements
   - deterministic publish gates in code (fail closed)
   - append-only revisions (no silent overwrites)
4. **Adversarial resilience upgraded (P0)**: Explicit threat model and controls:
   - poisoning, prompt injection via sources, forged "official" docs, cost attacks, narrative manipulation
   - quarantine + reputation, allowlisted retrieval, SSRF/redirect hardening, tool-schema enforcement, budgets, circuit breakers
5. **Re-verification ops added (P0)**: Freshness is a product feature:
   - re-verification schedules by event class
   - SLAs/SLOs + monitoring + alerting
   - escalation ladders + stop conditions
   - explicit "stale" labeling and behavior (no outreach amplification)
6. **Governance expanded (P0)**: Institutions cite systems that are consistent, transparent about uncertainty, correction-friendly, conflict-aware, and policy-driven:
   - visible verification levels + uncertainty semantics
   - conflict representation (no silent truth picking)
   - corrections policy with append-only revisions + public change log
   - sponsor separation and disclosure enforcement
7. **AI posture formalized**: AI is a **copilot for proposals**, not an autopilot for publishing:
   - agents generate structured diffs
   - gated services apply changes only after deterministic checks and approvals (early)
8. **Civic Governance Intelligence added (new major feature)**:
   - US municipalities first; long-term global
   - ingest lowest-level government agendas/minutes/votes/ordinances and connect decisions to locations/water infrastructure
   - integrate concepts from civic agenda processing tools (e.g., Engagic-style pipelines) as a **Civic Pack v1**
9. **Operator-grade instrumentation tightened**:
   - correlation IDs end-to-end
   - immutable audit trails for approvals/outreach
   - backpressure + DLQ strategy + error budgets
10. **Roadmap adjusted**: Phase 1 definition is explicitly "credibility-first shipping," not "agents publishing content."

---

# 1) North Star Outcome

$drop becomes the default system people cite when they need to answer:
- What is happening with water **here**?
- What's verified, by whom, and based on what evidence?
- How has it changed over time?
- What is the risk/impact, and what's the value at stake?

**End-state behaviors**
- Institutions cite **Location Node URLs** in policy briefs, syllabi, research, journalism, and resource pages.
- The map is trusted because it is backed by an auditable, revisioned truth index.
- A small team operates the system because automation drafts proposals while governance controls publication.
- Water is first; the platform becomes a reusable template for other domains.

---

# 2) The Big Innovation (Reframed)

You're not building "content + SEO." You're building a living intelligence layer:
- Stories are events
- Locations are anchors
- Backlinks are endorsements
- Maps are proof of scale
- Agents run the loop continuously

## 2.1 Situation Graph (Global Standard Layer)
$drop's core is domain-agnostic:

- **Node**: entity (Location, Organization, Infrastructure, Asset)
- **Situation**: evolving state about a Node (what's happening)
- **Claim**: structured assertion
- **Evidence**: source artifacts supporting/contradicting claims
- **Assessment**: verification level + bounded confidence + reviewer identity
- **Revision**: append-only change record
- **Endorsement**: external reference/backlink/mention
- **Policy**: rules gating actions (publish/outreach/visibility)

Water is implemented as **Water Pack v1** (event types, metrics/units, minimum-source rules, SLAs, sensitive handling).

## 2.2 Canonical Index of Truth
- **Canonical citation target**: Location Node URLs (one place → one URL).
- **Geomap**: a projection over the canonical index (proof-of-scale view, not the datastore).

---

# 3) Water as a Commodity (Global Spin)

## 3.1 Commodity framing (why it matters)
Water behaves like a commodity because it has:
- supply constraints (availability, infrastructure capacity)
- demand drivers (agriculture, industry, population growth)
- quality grades (potability, contamination thresholds)
- logistics & bottlenecks (treatment plants, pipes, intakes, rights-of-way)
- regional scarcity and price pressure (not globally fungible)
- regulatory constraints (rights, permits, standards, advisories)

**Key difference:** water is not fully tradable like oil—its value is local, political, and constrained by infrastructure and rights.
$drop's value is to quantify and explain the "water condition premium/discount" for a location and time period.

## 3.2 What $drop can uniquely compute (later phases)
Once you have coverage and verified historical timelines, you can compute:
- **Water Condition Index (WCI)** per location (quality × availability × reliability)
- **Scarcity Pressure Index** (drought + demand proxies + infrastructure stress)
- **Disruption Events** count and duration (boil notices, outages, contamination spikes)
- **Risk-adjusted signals** (insurers, ESG, infrastructure investors, supply chains)

---

# 4) Users and Value (Primary Personas)

## 4.1 Core users
- Journalists (verification + citations)
- NGOs (evidence hubs + advocacy)
- Policy staff (briefs + defensible references)
- Researchers (structured history + datasets)
- Communities (trusted summaries + actions)
- Internal operators (freshness, approvals, governance)

## 4.2 Expansion users (commodity/value layer)
- Insurers / risk analysts
- Infrastructure investors / funders
- Corporate supply chain + ESG teams
- Utilities (official updates + corrections)

---

# 5) Product Surfaces (What you ship)

## 5.1 Public Web
- **Location Node Page (canonical URL)**
  - snapshot (status, verification, last verified, freshness state)
  - key claims (structured assertions)
  - citations + sources (timestamped)
  - timeline (historical events)
  - revision/change log (append-only)
  - "Cite this location" (citation + embed + export)
- **Story Page** (narrative for one event)
- **Data Appendix Page** (sources, measurements, methods, citations)
- **Educational Summary Page** (neutral explainer, quotable)
- **Global Map** (projection + filters)

## 5.2 Situation Monitor (Operator Cockpit)
A panel dashboard to run the machine:
- incoming signals queue
- geo ambiguity/conflicts queue
- verification/approval queue
- freshness SLA panel
- revision feed ("what changed today and why")
- endorsements/backlinks monitor
- outreach queue + throttling
- coverage gaps (where you're thin)
- cost/backpressure + DLQ panel

## 5.3 Integrations (Standardization)
- Read API (public + versioned)
- Webhooks (notify on node changes)
- Embeds (node cards, timelines, cite blocks)
- SDKs (JS, Python)
- CLI (institutions/research)

---

# 6) Data Model (Canonical Objects)

All publishable truth is append-only with provenance.

## 6.1 Core entities (Situation Graph)
- Node
- Situation
- Claim
- Evidence
- Assessment
- Revision
- Endorsement
- Policy

## 6.2 Water Pack v1 (Domain Pack)
Defines:
- event types (boil notice, do-not-drink, PFAS/lead results, drought status, flood, infrastructure failure, spill, etc.)
- metric units, measurement semantics, sampling method metadata
- minimum-source requirements per event type
- freshness SLAs per event type
- sensitive-location rules (including indigenous consent flags)

---

# 7) Agentic System (OODA + Structured Autonomy)

## 7.1 Agent roles (Truth pipeline)
- Signal Intake Agent
- Dedup/Cluster Agent
- Geo Resolution Agent
- Claim Extraction Agent (structured assertions)
- Source QA Agent (evidence, anchors, authenticity checks)
- Conflict Detector Agent
- Freshness Scheduler Agent

## 7.2 Agent roles (Authority pipeline)
- Asset Targeting Agent
- Backlink Outreach Drafting Agent
- Authority/Endorsement Monitor Agent
- Coverage Gap Agent

## 7.3 Non-negotiable safety rules
- Models are never sources.
- Agents generate **proposals**, not publishes.
- Only gated services apply canonical changes after deterministic checks.
- Outreach is throttled and gated (manual approval early).
- PII redaction and logging rules are enforced in code, not prompts.
- Every tool has schema-bound IO, idempotency, rate limits, and audit hooks.

---

# 8) Architecture (Edge + Cloud, Event-Driven)

## 8.1 Two-Pipeline Architecture
**Truth Pipeline (Integrity-Critical)**
1) ingest signals → quarantine classify
2) normalize + dedupe
3) geo resolve (ambiguity handling)
4) extract claims + attach evidence anchors
5) deterministic publish gates (fail closed)
6) approval gate (early)
7) append-only revision apply
8) publish assets + API read models
9) schedule re-verification

**Authority Pipeline (Risk-Managed)**
1) select link targets
2) generate outreach drafts
3) throttled sends + opt-out
4) monitor endorsements
5) propose coverage expansions

**Guardrail:** Authority pipeline cannot mutate truth.

## 8.2 Edge / Local-first
- offline submissions + media + GPS (where appropriate)
- on-device PII redaction
- encrypted local store
- sync sanitized artifacts + hashes

## 8.3 Sync & conflict resolution
- canonical facts: append-only revisions
- drafts/layouts: deterministic merges (CRDT optional later)
- conflicts: review tasks (no silent overwrite)

---

# 9) Verification, Governance, and "Wikipedia Survival Kit"

## 9.1 Verification levels (visible)
- Unverified (internal-only or clearly labeled public, depending on policy)
- Source-Backed
- Multi-Source Verified
- Official (verified publisher / authoritative posting)

## 9.2 Conflict handling
- no silent truth picking
- show competing claims with provenance + uncertainty
- conflict triggers escalation and blocks certain automations (outreach, "official" labels)

## 9.3 Corrections policy
- corrections create new revisions (append-only)
- every node has a public change log (what changed, when, why)

## 9.4 Indigenous consent & sensitive detail mode
- consent flags per location and per content item
- restricted detail outputs when required
- escalation required for publish on flagged locations (early)

## 9.5 Sponsor separation
- hard wall between funding and coverage decisions
- persistent disclosures
- sponsor content cannot override truth pipeline gates

## 9.6 Re-verification operations (freshness discipline)
Freshness is a product feature, not an internal metric.

**Required fields**
- `last_verified_at`
- `reverify_due_at`
- `freshness_state`: Fresh / Due Soon / Stale / Critical
- `freshness_reason`: time-based, new signal, conflict, missing primary source, etc.

**Cadence baseline**
- High volatility (boil notice, outage): 6–24h while active; 7d post-resolution check
- Medium volatility (spill, acute contamination): 24–72h while active; 14–30d post-resolution
- Slow-moving (chronic programs): 30–90d or on new lab result/official posting
- Long-horizon (drought/watershed): weekly → monthly depending on source cadence

**Trigger overrides**
- new credible signal touching a location pulls due date forward
- conflicts force immediate recheck + escalation
- official posting changes force immediate recheck

**Public stale labeling**
- Node pages display freshness state and last verified timestamp
- Stale nodes show a banner and suppress amplification (no outreach pushes)

---

# 10) Security & Abuse Resistance (Red-Team Ready)

## 10.1 Core platform controls
- authentication + RBAC for operator tools
- least privilege services
- strict input validation and output escaping
- CSP and XSS protections
- upload scanning + type/size limits
- rate limits per IP/account/endpoint
- secrets in secret manager; never in logs/client
- SSRF protection: allowlisted fetching; block internal ranges; strict redirect policy

## 10.2 AI/agent risks + mitigations
- prompt injection: external content can't trigger tools; tool schemas enforced; strip "instructions"
- data poisoning: quarantine + domain trust tiers; contributor reputation; anomaly detection
- cost attacks: budgets, circuit breakers, backpressure, queue caps, DLQ triage
- forged evidence: prefer authoritative URLs; snapshot/hashes; manual review early
- privacy: PII minimization; structured logs; redaction pipelines; retention policy

---

# 11) Observability & Ops Excellence

- OpenTelemetry tracing end-to-end (ingest → propose → verify → approve → publish → reverify → outreach)
- Correlation IDs:
  - `job_id`, `location_id`, `event_id`, `revision_id`, `evidence_id`, `publisher_id`
- Immutable audit logs:
  - approvals, overrides, policy exceptions, corrections, outreach sends
- Reliability controls:
  - idempotency keys per stage
  - retries + DLQ per stage
  - queue depth alerts + backpressure
  - circuit breakers that pause automation on anomaly spikes
- SLOs:
  - freshness compliance (% nodes not overdue)
  - re-verification lag (due → verified)
  - signal response time (signal → proposal)
  - approval queue time (proposal → publish)
  - endorsement detection lag
  - error budget consumption by pipeline stage

---

# 12) "Global Standard" Moats (Hidden Gems)

## 12.1 Publish the Spec
- **Situation Graph Spec v1** (domain-agnostic core)
- **Water Pack v1 Spec** (event types, metrics, minimum sources, freshness SLAs)
- schema evolution policy + compatibility tests

## 12.2 Federation
- Verified Publisher Program (signed feeds)
- conformance tests for onboarding publishers
- trust tiers determine automation privileges

## 12.3 Integrity Spine (Don't trust us, verify us)
- evidence snapshots + content hashes
- signed revisions
- transparency log for "what changed and why"

## 12.4 One-click institutional outputs
- Policy brief pack (citeable, audit-friendly)
- Journalist verification pack (timeline + sources + change log)
- Grant/report appendix pack
- Classroom packet (neutral explainer + citations)

These outputs turn node URLs into durable citations.

---

# 13) Roadmap (Execution)

## Phase 1 — "Skateboard" (credibility-first)
Ship:
- canonical data model + append-only revisions
- evidence snapshots + hashing + anchors
- geo ambiguity workflow
- conflict representation (no overwrite)
- truth pipeline with approval gate
- node pages with: verification level, last verified, freshness state, stale banner, change log
- situation monitor queues: signals, conflicts, approvals, freshness, DLQ
- cost controls: throttles, budgets, backpressure, circuit breakers
- endorsement tracking baseline (manual/semi-automated)
- outreach: gated/manual send + opt-out

Target: 10–20 lit locations with defensible evidence.

## Phase 2 — "Bicycle" (safe scale)
- automated re-verification jobs + alerting
- API v1 + webhooks
- embeds + basic SDKs
- contributor submissions with reputation + quarantine
- automated endorsement monitoring

## Phase 3 — "Motorcycle" (federation + standardization)
- publish the specs + conformance tests
- onboard verified publishers with signed feeds
- automation privileges by trust tier

## Phase 4 — "Car" (commodity layer)
- WCI + scarcity/disruption indices
- premium analytics for insurers/ESG/supply chain
- enterprise SLAs, audit exports, compliance features

---

# 14) Monetization and Pricing Alignment

## 14.1 Free/public
- public node pages + map
- limited API
- citation + embed basics

## 14.2 Pro (NGOs, journalists, small teams)
- situation monitor views (limited)
- alerts + exports (brief packs)
- higher API limits

## 14.3 Enterprise (policy, ESG, insurers)
- federation support, signed feeds, verified publisher tooling
- advanced indices (WCI, scarcity pressure)
- SLAs, audit exports, retention controls
- private deployments if required

---

# 15) Launch Plan (Water-first global credibility)

- pick 2–3 starter geographies with strong primary sources and visible impact
- reach critical mass quickly (10–20 lit locations)
- partner with 1–2 credible institutions early (validation + first durable endorsements)
- ship transparency log early (trust accelerant)
- prioritize resource-page backlinks (edu/ngo/gov) before broad media
- keep outreach gated until the truth pipeline is boringly reliable

---

# 16) Missing Feature Worthwhile for Civilization: Civic Governance Intelligence (US first)

This is the "cities/municipalities" layer that most people can't access efficiently, yet it governs:
- water utility decisions
- infrastructure budgets and capital plans
- procurement contracts
- enforcement actions and compliance timelines
- emergency declarations and response policy
- rate changes and service expansions

## 16.1 Civic Pack v1 (Domain Pack)
Introduce **Civic Pack v1** alongside Water Pack v1.

**Core civic entities (extend Situation Graph)**
- `CivicBody` (city council, utility board, planning commission)
- `Meeting` (agenda, minutes, attachments)
- `AgendaItem` / `Matter` (tracked across meetings)
- `Vote` (per member, tally, outcome)
- `Ordinance/Resolution` (decision artifacts)
- `BudgetLine` / `CapexProject` (when available)
- `PublicParticipation` (comment channels, hearing links)

**Civic events**
- ordinance introduced / amended / adopted
- contract awarded
- rate change proposed/approved
- compliance deadlines set
- infrastructure project approved
- emergency actions

## 16.2 Ingestion approach (municipal-first)
- discover municipal sources (civic platforms, council sites, PDFs, portals)
- fetch agendas/minutes/attachments
- parse structured items when available; fallback to PDF extraction
- extract structured facts (dates, bodies, items, sponsors, votes, outcomes)
- summarize for civilians (separately from canonical claims)

## 16.3 Integration with Water nodes (why this matters)
Every water location node can link to civic decisions that affect it:
- upgrades and maintenance projects
- procurement and vendor contracts
- compliance actions and deadlines
- rate changes and service coverage
- official advisories and public notices

Result: $drop becomes not just "what happened," but "who decided what, when, and where to look next."

## 16.4 Credibility alignment (no civic nonsense publishing)
Civic ingestion must obey the same spine:
- evidence snapshots + hashes
- anchors to agenda/minutes lines or item IDs
- deterministic gates for authenticity (official portals, known civic platforms)
- append-only revisions
- conflict-aware corrections

## 16.5 "Engagic-style" tooling integration (pragmatic)
Leverage the proven pattern used by civic agenda processing systems:
- vendor adapters for common civic platforms
- matters-first tracking across meetings
- structured storage for meetings/items/votes
- rate limiting and tiered access
- weekly digests and "happening this week" feeds

In $drop, this becomes a **Civic Signal Pipeline** feeding the same canonical index model—without mixing civic summaries with publishable truth claims unless provenance gates pass.

## 16.6 Civic outputs (civilization-grade)
- "What's happening in my city this week" (water + infrastructure + permits)
- "Decisions that affect water risk" (procurement, capex, compliance)
- "Cite this decision" (Decision Node URLs analogous to Location Node URLs)
- municipal transparency scorecards (coverage + freshness + integrity)

Long-term: scale from US cities → counties → states → federal → international equivalents.

---

# 17) Success Metrics (credibility first)

Credibility & governance:
- % snapshot claims with valid evidence anchors
- median conflict resolution time
- correction turnaround time
- freshness compliance (% nodes not overdue)
- number of publish blocks prevented by gates (a good sign)

Adoption:
- referring domains (edu/ngo/gov)
- citations/embeds of node URLs
- API/webhook subscriptions

Operations:
- proposal-to-publish lead time
- cost per verified update (bounded)
- DLQ stability and incident rate

---

# 18) Non-negotiables (build rules)

- Fail closed on missing evidence anchors for snapshot claims
- No silent overwrites; revisions are append-only
- No outreach amplification on stale/conflict/ambiguous geo items
- Quarantine public submissions until verified
- Policy gates enforced in code
- Audit logs are immutable
- Rate limits and budgets exist from day one
