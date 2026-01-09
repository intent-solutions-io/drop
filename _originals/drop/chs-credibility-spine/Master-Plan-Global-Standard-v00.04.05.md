**Project Name:** $drop
**Document:** Master Plan — Global Standard + Credibility Spine
**Version:** v00.04.05
**Positioning:** Water-first "Situation Graph" platform that becomes the global standard for "things happening somewhere over time with evidence."
**Core Output:** The canonical, citeable truth index is the set of **Location Node URLs** (plus their evidence, revisions, and APIs). The geomap is the canonical interface (projection) to that index.

---

## Change Log (explicit)

### From v00.04.04 → v00.04.05
1. **Truth Integrity Doctrine (P0)**: Expanded "Truth is not a text problem" into explicit engineering doctrine with WheelFly Truth Contract
2. **Evidence Anchoring Requirements**: Added detailed Evidence Anchor schema (page, section, quote_span, table_row, timestamp, content_hash)
3. **Claim Types Taxonomy**: Added required claim type classification (Measurement, Advisory, Official Statement, Allegation, Observation)
4. **Deterministic Gates Detail**: Expanded Gates A-E with specific implementation requirements
5. **Human-in-the-Loop Requirements**: Explicit list of cases requiring human approval (P0)
6. **Threat Model Formalized**: Added attack categories (Poisoning, Prompt Injection, Cost Attacks, Forged Evidence, Narrative Manipulation)
7. **Defensive Architecture**: Added 7 must-have controls with implementation details
8. **Re-Verification Engine**: Expanded with detailed schedules by event type and trigger overrides
9. **SLA/SLO Framework**: Added explicit targets and monitoring requirements
10. **Escalation Ladders**: Added L0-L3 escalation levels with specific triggers
11. **Stale Labeling Behavior**: Added fail-safe behaviors for stale content
12. **Governance UX**: Added trust signaling requirements for node pages
13. **MVP Requirements Checklist**: Added explicit P0 checklist for "v1 ready"

### From v0.4 PDF → v00.04.04 (prior changes)
1. **Naming**: Rebranded from WheelFly to **$drop** everywhere
2. **Canonical truth clarification**: Location Node URLs + API + append-only revision log; geomap is projection
3. **Credibility Spine added (P0)**: Evidence authenticity, claim anchoring, deterministic gates, append-only revisions
4. **Adversarial resilience upgraded (P0)**: Explicit threat model and controls
5. **Re-verification ops added (P0)**: Freshness as product feature
6. **Governance expanded (P0)**: Verification levels, conflict handling, corrections policy, sponsor separation
7. **AI posture formalized**: Copilot for proposals, not autopilot for publishing
8. **Civic Governance Intelligence added**: US municipalities first with Civic Pack v1
9. **Operator-grade instrumentation**: Correlation IDs, audit trails, backpressure, DLQ strategy
10. **Roadmap adjusted**: Phase 1 is "credibility-first shipping"

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
- **Claim**: structured assertion with required type classification
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

# 3) Truth is NOT a Text Problem (P0 Doctrine)

**This replaces "AI will enforce truth" vibes with explicit engineering doctrine.**

AI can help write and summarize. It cannot guarantee:
- sources are authentic
- claims match sources
- geo resolution is correct
- conflicts are handled correctly
- updates don't corrupt history

If AI "decides truth," you will ship confident nonsense eventually. The failure mode is reputational collapse.

## 3.1 $drop Truth Contract (Non-Negotiable)
**A statement is publishable only if:**
1) It maps to one or more **Evidence objects** (sources) with provenance metadata.
2) The **Claim** is a structured extraction that can be traced to exact source anchors.
3) The **Location** is resolved via deterministic geo rules and ambiguity handling.
4) Conflicts are explicitly represented (not overwritten).
5) The change is recorded as an **append-only revision** with a reason and actor.

## 3.2 Evidence Anchors (Required Schema)
For every Claim→Evidence link, store "where in the source" it came from:

```
evidence_anchor: {
  page: number | null,
  section: string | null,
  quote_span: { start: number, end: number } | null,
  table_row: number | null,
  timestamp: ISO8601 | null
}
retrieval_snapshot_ref: string (frozen copy pointer)
content_hash: string (hash of the snapshot)
retrieved_at: ISO8601
publisher: string
domain_trust_tier: "official" | "accredited" | "news" | "community" | "unknown"
```

This prevents "summary drift" where the story slowly diverges from sources.

**Fail-closed rule:** No anchors → no publish for snapshot claims.

## 3.3 Claim Types (Required Classification)
Not everything is the same kind of truth. Each claim must be typed:

| Claim Type | Description | Verification Rules |
|------------|-------------|-------------------|
| **Measurement** | Numerical result with unit + method | Requires lab/sensor source + method metadata |
| **Advisory** | Boil notice issued/lifted | Requires official source + timestamp |
| **Official Statement** | Press release, government posting | Requires authoritative URL |
| **Allegation** | Must be labeled as such | Lower verification ceiling; attribution required |
| **Observation** | Community/witness report | Lower trust tier; requires corroboration for upgrade |

## 3.4 Revision Safety (Required)
- Canonical records are **append-only**.
- Corrections create new revisions (no "edit in place").
- Public pages show:
  - `last_verified_at`
  - `verification_level`
  - `change_log_link`

---

# 4) Deterministic Verification Gates (Code, Not Prompts)

All "truth checks" run as explicit gates in code. Gates fail closed.

## 4.1 Gate A — Source Authenticity
- Allowlist + trust tiers per domain (gov, utility, accredited labs, news, community)
- Snapshot storage + content hashing
- Detect lookalike domains (typosquatting detection)
- Reject sources that fail authenticity checks
- Store `domain_trust_tier` on every evidence object

## 4.2 Gate B — Claim-to-Source Alignment
- Require evidence anchors for all key claims
- "Claim coverage" check: each key claim must reference specific anchors
- Fail closed if anchors are missing or mismatched
- Automated drift detection: flag when summary diverges from anchored content

## 4.3 Gate C — Geo Resolution Correctness
- Canonical gazetteer with stable IDs (not free-text place names)
- Ambiguity workflow (the "Springfield problem"):
  - If ambiguous: require operator resolution OR additional disambiguation sources
  - Never silently "pick a place" at low confidence
- Store geo confidence score and ambiguity flags
- Block auto-publish when geo confidence < threshold

## 4.4 Gate D — Conflict Handling
- If conflicting sources detected: mark conflict status
- Show competing claims with full provenance + uncertainty indicators
- Require human approval for publish when conflict is present
- Block outreach and "official" label upgrades during conflict state

## 4.5 Gate E — History Integrity
- Optimistic concurrency on all revision writes
- Prevent "silent history rewrite" via version checks
- Automated regression checks on node timelines (no missing events, no timeline gaps)
- Rollback-by-revision: revert is a new revision, never a delete

---

# 5) Human-in-the-Loop Requirements (P0)

**P0: Human approval is required for:**
- Publishing any new location node for the first time
- Any conflict case between credible sources
- Any geo ambiguity case
- Any "official-looking documents" submitted by users
- Any outreach send beyond a small daily limit
- Any verification level upgrade/downgrade
- Any content touching indigenous consent flags
- Any allegations implicating individuals/organizations

**Later, reduce human load via:**
- Verified Publisher feeds (signed, conformance-tested)
- High-trust domain allowlists
- Automated conformance tests
- Trust tier automation privileges

---

# 6) Adversaries Exist (P0 Threat Model)

The moment $drop matters, attackers will:
- poison submissions
- manipulate narratives
- trigger costly agent loops
- inject prompt attacks through sources
- fabricate "official-looking" documents

**Treat this as guaranteed, not hypothetical.**

## 6.1 Attack Categories

### A) Data Poisoning
**Goal:** Get false claims into canonical nodes.
**Vectors:** Fake submissions, compromised sources, slow-drip misinformation.

### B) Prompt Injection via Sources
**Goal:** Make the model call tools, leak data, or bypass gates.
**Vectors:** Malicious content in fetched pages, PDFs with hidden instructions.

### C) Cost Attacks (Agent Loop Flooding)
**Goal:** Force repeated ingestion/re-verification/outreach workloads.
**Vectors:** Burst submissions, repeated "new signal" triggers, infinite loops.

### D) Forged Evidence
**Goal:** Submit convincing PDFs/screenshots that appear official.
**Vectors:** Spoofed letterheads, fake lab reports, manipulated screenshots.

### E) Narrative Manipulation / Harassment
**Goal:** Create reputational damage, target communities, or cause panic.
**Vectors:** Coordinated false reports, weaponized corrections, amplification attacks.

## 6.2 Defensive Architecture (7 Must-Have Controls)

### Control 1 — AI Cannot Take Side Effects
Agents only produce **proposals** (structured diffs). Only gated services apply changes.
- Proposal includes: claims + evidence anchors + geo candidate + confidence scores
- Apply requires all deterministic gates passing
- No direct database writes from agent code

### Control 2 — Retrieval and Fetch Allowlists (SSRF + Injection Resistance)
- Fetch only from allowlisted domains for "primary evidence"
- Block internal IP ranges, cloud metadata endpoints, localhost
- Strict redirect policy: no cross-domain redirects without re-validation
- Sanitize HTML, strip scripts, normalize text before model processing
- Separate "content for reading" from "instructions" (instructions are discarded)

### Control 3 — Submission Quarantine + Reputation
All public submissions land in **quarantine**:
- No auto-publish
- No auto-outreach
- No effect on canonical truth until verified

Contributor reputation tracking:
- Identity verification options (optional verified accounts)
- Historical acceptance rate
- Domain/organization association
- Anomaly signals (burst submissions, coordinated wording, new account patterns)

### Control 4 — Forgery Detection Workflow
For "official-looking" documents:
- Require source URL when possible (not just uploaded file)
- Compare document claims against authoritative site postings
- Store document hashes; detect re-uploads and modifications
- Manual review required for all official-looking submissions until verified publisher integrations exist
- Cross-reference with known official posting patterns

### Control 5 — Cost & Rate Controls (Agent Budgets)
- Per-user and per-IP submission limits
- Per-tenant daily budgets for LLM calls + fetches
- Backpressure in queues; autoscaling ceilings
- Circuit breakers: if anomaly detected, degrade gracefully (pause automation, require manual)
- DLQ caps with alerting

### Control 6 — Audit + Transparency (Anti-Manipulation)
- Immutable audit log (who approved what, when, why, correlation IDs)
- Public change log for nodes (what changed, reason codes)
- Rollback-by-revision (revert creates new revision, never deletes)
- Tamper-evident logging (append-only, signed if possible)

### Control 7 — Outreach Safety
- Outreach sends are throttled and campaign-approved
- Global opt-out list enforced
- Never auto-outreach on:
  - Unverified content
  - Conflict-state content
  - Ambiguous geo content
  - Stale content

---

# 7) Water as a Commodity (Global Spin)

## 7.1 Commodity framing (why it matters)
Water behaves like a commodity because it has:
- supply constraints (availability, infrastructure capacity)
- demand drivers (agriculture, industry, population growth)
- quality grades (potability, contamination thresholds)
- logistics & bottlenecks (treatment plants, pipes, intakes, rights-of-way)
- regional scarcity and price pressure (not globally fungible)
- regulatory constraints (rights, permits, standards, advisories)

**Key difference:** water is not fully tradable like oil—its value is local, political, and constrained by infrastructure and rights.
$drop's value is to quantify and explain the "water condition premium/discount" for a location and time period.

## 7.2 What $drop can uniquely compute (later phases)
Once you have coverage and verified historical timelines, you can compute:
- **Water Condition Index (WCI)** per location (quality × availability × reliability)
- **Scarcity Pressure Index** (drought + demand proxies + infrastructure stress)
- **Disruption Events** count and duration (boil notices, outages, contamination spikes)
- **Risk-adjusted signals** (insurers, ESG, infrastructure investors, supply chains)

---

# 8) Users and Value (Primary Personas)

## 8.1 Core users
- Journalists (verification + citations)
- NGOs (evidence hubs + advocacy)
- Policy staff (briefs + defensible references)
- Researchers (structured history + datasets)
- Communities (trusted summaries + actions)
- Internal operators (freshness, approvals, governance)

## 8.2 Expansion users (commodity/value layer)
- Insurers / risk analysts
- Infrastructure investors / funders
- Corporate supply chain + ESG teams
- Utilities (official updates + corrections)

---

# 9) Product Surfaces (What you ship)

## 9.1 Public Web
- **Location Node Page (canonical URL)**
  - snapshot (status, verification level, last verified, freshness state)
  - key claims (structured assertions with type labels)
  - citations + sources (timestamped, with anchors)
  - timeline (historical events)
  - revision/change log (append-only, public)
  - "Cite this location" (citation + embed + export)
  - Trust signaling section (how we verify, correction policy)
- **Story Page** (narrative for one event)
- **Data Appendix Page** (sources, measurements, methods, citations)
- **Educational Summary Page** (neutral explainer, quotable)
- **Global Map** (projection + filters)

## 9.2 Situation Monitor (Operator Cockpit)
A panel dashboard to run the machine:
- Incoming signals queue
- Geo ambiguity/conflicts queue
- Verification/approval queue
- Freshness SLA panel (overdue nodes by severity)
- Revision feed ("what changed today and why")
- Endorsements/backlinks monitor
- Outreach queue + throttling status
- Coverage gaps (where you're thin)
- Cost/backpressure + DLQ panel
- Error budget consumption

## 9.3 Integrations (Standardization)
- Read API (public + versioned)
- Webhooks (notify on node changes)
- Embeds (node cards, timelines, cite blocks)
- SDKs (JS, Python)
- CLI (institutions/research)

---

# 10) Data Model (Canonical Objects)

All publishable truth is append-only with provenance.

## 10.1 Core entities (Situation Graph)
- Node
- Situation
- Claim (with required type: Measurement | Advisory | Official Statement | Allegation | Observation)
- Evidence (with required anchors)
- Assessment
- Revision
- Endorsement
- Policy

## 10.2 Water Pack v1 (Domain Pack)
Defines:
- event types (boil notice, do-not-drink, PFAS/lead results, drought status, flood, infrastructure failure, spill, etc.)
- metric units, measurement semantics, sampling method metadata
- minimum-source requirements per event type
- freshness SLAs per event type
- sensitive-location rules (including indigenous consent flags)

---

# 11) Re-Verification Engine (Freshness is a Product Feature)

A Location Node URL is only valuable if it stays current *and* shows its age honestly.

## 11.1 Re-Verification Model (per Location + per Event)
Every location node and every active event tracks:

```
last_verified_at: ISO8601
reverify_due_at: ISO8601
freshness_state: "Fresh" | "Due Soon" | "Stale" | "Critical"
verification_level: "Unverified" | "Source-Backed" | "Multi-Source" | "Official"
freshness_reason: string (why it's due: time-based, new signal, conflict, missing primary source)
```

## 11.2 Re-Verification Schedules (Rule Table)

### High-volatility incidents (fast decay)
| Event Type | Active Cadence | Post-Resolution |
|------------|---------------|-----------------|
| Boil notice | 6-24 hours | 7 days |
| Do-not-drink | 6-24 hours | 7 days |
| Service outage | 6-24 hours | 7 days |

### Medium-volatility incidents
| Event Type | Active Cadence | Post-Resolution |
|------------|---------------|-----------------|
| Infrastructure failure | 24-72 hours | 14-30 days |
| Chemical spill | 24-72 hours | 14-30 days |
| Acute contamination | 24-72 hours | 14-30 days |

### Slow-moving conditions
| Event Type | Cadence |
|------------|---------|
| PFAS/lead sampling programs | 30-90 days or on new lab result |
| Chronic contamination investigations | 30-90 days or on official update |

### Long-horizon signals
| Event Type | Cadence |
|------------|---------|
| Drought classifications | Weekly to monthly |
| Watershed stress | Weekly to monthly |

## 11.3 Trigger-Based Overrides (Event-Driven)
- Any new credible signal touching a location → pull `reverify_due_at` forward
- Conflict detected → immediate recheck + human escalation
- Official source posting changes → immediate recheck
- Verification level dispute → immediate recheck

## 11.4 How Re-Verification Executes (Copilot, Not Autopilot)
Re-verification creates a job that produces a **proposal**:
- Updated status (if lifted/resolved/escalated)
- New claims with evidence anchors
- Updated timeline entries
- Updated verification level if rules are met

**Publishing still requires:**
- All deterministic gates passing
- Conflict handling (if any)
- Approval gate (at least early in maturity)

---

# 12) SLAs, Monitoring, and Alerting (Ops Discipline)

## 12.1 Freshness SLAs (Minimum Viable)

| SLO | Target | Measurement |
|-----|--------|-------------|
| Freshness Compliance | >95% | % of lit nodes that are Fresh (not overdue) |
| Re-verification Lag | <24h | Time from due → verified |
| Signal Response Time | <4h | Time from new signal → proposal created |
| Approval Queue Time | <8h | Time from proposal → published revision |
| Endorsement Detection Lag | <24h | Time from backlink → recorded |

## 12.2 Monitoring Surface (Situation Monitor Panels)

**Required panels:**
- **Freshness SLA Panel:** Overdue nodes by severity + age
- **Re-verification Queue:** Jobs due now / due soon / blocked
- **Staleness Hotspots Map:** Visual layer for overdue nodes
- **Error Budget Panel:** Failures in ingest/verify/publish pipelines
- **Backpressure/Cost Panel:** LLM calls, fetch volume, retries, DLQ growth
- **Conflict Queue:** Unresolved conflicts by age
- **Geo Ambiguity Queue:** Unresolved ambiguities

## 12.3 Alerting Rules

**Trigger alerts when:**
- A "Critical" freshness node is stale beyond threshold
- Conflicts persist beyond 48 hours
- DLQ size exceeds threshold (system stuck)
- Unusual submission spike detected (>3σ from baseline)
- Outreach send spike detected (possible misconfig)
- Gate failure rate exceeds error budget
- New untrusted domain appears in evidence

---

# 13) Escalation Workflows (When Humans Must Intervene)

## 13.1 Escalation Levels

| Level | Actor | Scope |
|-------|-------|-------|
| **L0 (Auto)** | System | Fetch, prepare proposals, run gates |
| **L1 (Operator Review)** | Ops team | Approve/reject updates, resolve ambiguity |
| **L2 (Senior Review)** | Senior/legal | Conflicts, sensitive locations, legal-risk |
| **L3 (External Verification)** | Partner org | Verified publisher input required |

## 13.2 Escalation Triggers

**Escalate to L1 when:**
- Geo ambiguity detected
- Conflict between credible sources
- Evidence is "official-looking" but unverified
- New domain/source outside allowlist
- Verification level would change materially

**Escalate to L2 when:**
- Indigenous consent flags apply
- Allegations implicate individuals/orgs (defamation risk)
- Politically sensitive regional narratives
- Rapid status changes could cause public harm if wrong
- Legal review required

**Escalate to L3 when:**
- Requires partner organization verification
- Verified publisher sign-off needed
- Cross-jurisdictional coordination required

## 13.3 Stop Conditions (Automation Halts)
Automation must stop and wait for human input when:
- Any L1+ escalation trigger fires
- Gate E (history integrity) fails
- Circuit breaker trips
- Error budget exhausted

---

# 14) Clear "Stale" Labeling (Honesty Beats Silence)

Staleness is not an internal metric—it must be visible to users.

## 14.1 Public-Facing Freshness UI
Every node page must show:
- **Last Verified:** Timestamp with relative time ("3 days ago")
- **Freshness State:** Fresh / Due Soon / Stale / Critical (with color coding)
- **What Changed Last:** Short revision summary + link to full change log
- **Verification Level:** With explanation of what it means

## 14.2 Stale Behavior (Fail-Safe)
**When a node is Stale or Critical:**
- Do not present stale content as current facts
- Show prominent banner: "This location has not been verified since [date]"
- Prioritize re-verification job creation
- Suppress outreach (do not amplify stale nodes)
- Downgrade in search/discovery rankings
- Add to Staleness Hotspots panel

---

# 15) Governance is the Moat (Why Institutions Cite You)

Institutions cite systems that are:
- Consistent
- Transparent about uncertainty
- Correction-friendly
- Conflict-aware
- Policy-driven

**That's process and design, not model output.**

## 15.1 Governance Primitives (Required)

| Primitive | Implementation |
|-----------|---------------|
| **Policy Engine** | Explicit gates for publish/outreach/visibility in code |
| **Provenance** | Evidence snapshots + anchors + content hashes |
| **Audit Logs** | Immutable logs for all approvals and changes |
| **Corrections Policy** | Append-only revisions; public change log |
| **Uncertainty Model** | Clear confidence scores + verification levels |
| **Conflict Model** | Competing claims displayed, never overwritten |

## 15.2 Governance UX (Make the Rules Visible)
Add "Trust Signaling" sections on every node page:
- "How we verify" (methodology)
- "What counts as a primary source" (source hierarchy)
- "How conflicts are handled" (process)
- "How to request a correction" (contact + process)
- "Disclosure policy" (funding, sponsors, limitations)

## 15.3 Verified Publisher Program (The Scale Lever)
To reduce ops load while improving trust:
- Onboard publishers with signed feeds
- Run conformance tests against the Situation Graph spec
- Assign trust tiers and automation privileges accordingly
- Allow "Official" verification level only through verified pipelines
- Regular re-certification and audit

---

# 16) The Correct Operating Posture (AI = Copilot)

AI makes this feasible with a small team **if you use it as:**
- A copilot for proposals
- NOT an autopilot for publishing

**Therefore the system must have:**
- Policy gates (in code, not prompts)
- Provenance (hashes, anchors, snapshots)
- Audit logs (immutable, tamper-evident)
- Rate limits and budgets (cost control + abuse resistance)
- Human approvals early (especially for ambiguity/conflicts/sensitive content)

---

# 17) Agentic System (OODA + Structured Autonomy)

## 17.1 Agent roles (Truth pipeline)
- Signal Intake Agent
- Dedup/Cluster Agent
- Geo Resolution Agent
- Claim Extraction Agent (structured assertions with types)
- Source QA Agent (evidence anchors, authenticity checks)
- Conflict Detector Agent
- Freshness Scheduler Agent

## 17.2 Agent roles (Authority pipeline)
- Asset Targeting Agent
- Backlink Outreach Drafting Agent
- Authority/Endorsement Monitor Agent
- Coverage Gap Agent

## 17.3 Non-negotiable safety rules
- Models are never sources.
- Agents generate **proposals**, not publishes.
- Only gated services apply canonical changes after deterministic checks.
- Outreach is throttled and gated (manual approval early).
- PII redaction and logging rules are enforced in code, not prompts.
- Every tool has schema-bound IO, idempotency, rate limits, and audit hooks.

---

# 18) Architecture (Edge + Cloud, Event-Driven)

## 18.1 Two-Pipeline Architecture

**Truth Pipeline (Integrity-Critical)**
1) Ingest signals → quarantine classification
2) Normalize + dedupe with rate limits
3) Geo resolve (ambiguity triggers stop condition)
4) Extract claims with evidence anchors (required)
5) Deterministic gates A-E (fail closed)
6) Human approval gate (P0)
7) Append-only revision apply
8) Publish node/story/data/learn assets
9) Schedule re-verification with anomaly-aware cadence

**Authority Pipeline (Risk-Managed)**
1) Select link targets (published, verified assets only)
2) Generate outreach drafts
3) Throttled sends + opt-out enforcement
4) Monitor endorsements
5) Propose coverage expansions (suggestions only)

**Guardrail:** Authority pipeline cannot mutate truth. Endorsement monitor cannot trigger truth changes directly.

## 18.2 Edge / Local-first
- Offline submissions + media + GPS (where appropriate)
- On-device PII redaction
- Encrypted local store
- Sync sanitized artifacts + hashes

## 18.3 Sync & conflict resolution
- Canonical facts: append-only revisions with optimistic concurrency
- Drafts/layouts: deterministic merges (CRDT optional later)
- Conflicts: create review tasks (no silent overwrite)

---

# 19) Verification Levels and Conflict Handling

## 19.1 Verification levels (visible)
| Level | Meaning | Requirements |
|-------|---------|--------------|
| **Unverified** | Internal-only or clearly labeled | No verification gates passed |
| **Source-Backed** | Single credible source | Gate A + B passed |
| **Multi-Source Verified** | Multiple independent sources | 2+ sources, Gate A-D passed |
| **Official** | Verified publisher / authoritative posting | Verified Publisher feed or official URL |

## 19.2 Conflict handling
- No silent truth picking
- Show competing claims with full provenance + uncertainty
- Conflict triggers escalation and blocks automations (outreach, "Official" labels)
- Resolution requires human approval

## 19.3 Corrections policy
- Corrections create new revisions (append-only)
- Every node has a public change log (what changed, when, why, who)
- Correction requests have defined SLA

## 19.4 Indigenous consent & sensitive detail mode
- Consent flags per location and per content item
- Restricted detail outputs when required
- Escalation required for publish on flagged locations (early)

## 19.5 Sponsor separation
- Hard wall between funding and coverage decisions
- Persistent disclosures on all sponsored content
- Sponsor content cannot override truth pipeline gates

---

# 20) Security & Abuse Resistance (Red-Team Ready)

## 20.1 Core platform controls
- Authentication + RBAC for operator tools
- Least privilege services
- Strict input validation and output escaping
- CSP and XSS protections
- Upload scanning + type/size limits
- Rate limits per IP/account/endpoint
- Secrets in secret manager; never in logs/client
- SSRF protection: allowlisted fetching; block internal ranges; strict redirect policy

## 20.2 AI/agent risks + mitigations
| Risk | Mitigation |
|------|-----------|
| Prompt injection | External content can't trigger tools; tool schemas enforced; strip "instructions" |
| Data poisoning | Quarantine + domain trust tiers; contributor reputation; anomaly detection |
| Cost attacks | Budgets, circuit breakers, backpressure, queue caps, DLQ triage |
| Forged evidence | Prefer authoritative URLs; snapshot/hashes; manual review early |
| Privacy | PII minimization; structured logs; redaction pipelines; retention policy |

---

# 21) Observability & Ops Excellence

- OpenTelemetry tracing end-to-end (ingest → propose → verify → approve → publish → reverify → outreach)
- Correlation IDs:
  - `job_id`, `location_id`, `event_id`, `revision_id`, `evidence_id`, `publisher_id`
- Immutable audit logs:
  - Approvals, overrides, policy exceptions, corrections, outreach sends
- Reliability controls:
  - Idempotency keys per stage
  - Retries + DLQ per stage
  - Queue depth alerts + backpressure
  - Circuit breakers that pause automation on anomaly spikes
- SLOs:
  - Freshness compliance (% nodes not overdue)
  - Re-verification lag (due → verified)
  - Signal response time (signal → proposal)
  - Approval queue time (proposal → publish)
  - Endorsement detection lag
  - Error budget consumption by pipeline stage

---

# 22) "Global Standard" Moats (Hidden Gems)

## 22.1 Publish the Spec
- **Situation Graph Spec v1** (domain-agnostic core)
- **Water Pack v1 Spec** (event types, metrics, minimum sources, freshness SLAs)
- Schema evolution policy + compatibility tests

## 22.2 Federation
- Verified Publisher Program (signed feeds)
- Conformance tests for onboarding publishers
- Trust tiers determine automation privileges

## 22.3 Integrity Spine (Don't trust us, verify us)
- Evidence snapshots + content hashes
- Signed revisions
- Transparency log for "what changed and why"

## 22.4 One-click institutional outputs
- Policy brief pack (citeable, audit-friendly)
- Journalist verification pack (timeline + sources + change log)
- Grant/report appendix pack
- Classroom packet (neutral explainer + citations)

These outputs turn node URLs into durable citations.

---

# 23) Civic Governance Intelligence (US first)

This is the "cities/municipalities" layer that most people can't access efficiently, yet it governs:
- Water utility decisions
- Infrastructure budgets and capital plans
- Procurement contracts
- Enforcement actions and compliance timelines
- Emergency declarations and response policy
- Rate changes and service expansions

## 23.1 Civic Pack v1 (Domain Pack)
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
- Ordinance introduced / amended / adopted
- Contract awarded
- Rate change proposed/approved
- Compliance deadlines set
- Infrastructure project approved
- Emergency actions

## 23.2 Ingestion approach (municipal-first)
- Discover municipal sources (civic platforms, council sites, PDFs, portals)
- Fetch agendas/minutes/attachments
- Parse structured items when available; fallback to PDF extraction
- Extract structured facts (dates, bodies, items, sponsors, votes, outcomes)
- Summarize for civilians (separately from canonical claims)

## 23.3 Integration with Water nodes (why this matters)
Every water location node can link to civic decisions that affect it:
- Upgrades and maintenance projects
- Procurement and vendor contracts
- Compliance actions and deadlines
- Rate changes and service coverage
- Official advisories and public notices

Result: $drop becomes not just "what happened," but "who decided what, when, and where to look next."

## 23.4 Credibility alignment (no civic nonsense publishing)
Civic ingestion must obey the same spine:
- Evidence snapshots + hashes
- Anchors to agenda/minutes lines or item IDs
- Deterministic gates for authenticity (official portals, known civic platforms)
- Append-only revisions
- Conflict-aware corrections

## 23.5 Civic outputs (civilization-grade)
- "What's happening in my city this week" (water + infrastructure + permits)
- "Decisions that affect water risk" (procurement, capex, compliance)
- "Cite this decision" (Decision Node URLs analogous to Location Node URLs)
- Municipal transparency scorecards (coverage + freshness + integrity)

Long-term: scale from US cities → counties → states → federal → international equivalents.

---

# 24) Roadmap (Execution)

## Phase 1 — "Skateboard" (credibility-first)
**Ship only when these are real:**
- Canonical data model + append-only revisions
- Evidence snapshots + hashing + anchors (required)
- Evidence anchor schema enforced
- Claim type classification enforced
- Geo ambiguity workflow
- Conflict representation (no overwrite)
- Truth pipeline with all 5 gates (A-E)
- Human approval gate (P0)
- Node pages with: verification level, last verified, freshness state, stale banner, change log, trust signaling
- Situation monitor queues: signals, conflicts, approvals, freshness, DLQ
- Cost controls: throttles, budgets, backpressure, circuit breakers
- Submission quarantine + reputation baseline
- Allowlisted fetching + SSRF protection
- Audit logging (immutable)
- Endorsement tracking baseline (manual/semi-automated)
- Outreach: gated/manual send + opt-out

**Target:** 10–20 lit locations with defensible evidence.

## Phase 2 — "Bicycle" (safe scale)
- Automated re-verification jobs + alerting
- SLA dashboards + alerts
- Escalation workflows with stop conditions
- API v1 + webhooks
- Embeds + basic SDKs
- Contributor submissions with reputation + quarantine
- Automated endorsement monitoring

## Phase 3 — "Motorcycle" (federation + standardization)
- Publish the specs + conformance tests
- Onboard verified publishers with signed feeds
- Automation privileges by trust tier
- Civic Pack v1 integration

## Phase 4 — "Car" (commodity layer)
- WCI + scarcity/disruption indices
- Premium analytics for insurers/ESG/supply chain
- Enterprise SLAs, audit exports, compliance features

---

# 25) Monetization and Pricing Alignment

## 25.1 Free/public
- Public node pages + map
- Limited API
- Citation + embed basics

## 25.2 Pro (NGOs, journalists, small teams)
- Situation monitor views (limited)
- Alerts + exports (brief packs)
- Higher API limits

## 25.3 Enterprise (policy, ESG, insurers)
- Federation support, signed feeds, verified publisher tooling
- Advanced indices (WCI, scarcity pressure)
- SLAs, audit exports, retention controls
- Private deployments if required

---

# 26) Launch Plan (Water-first global credibility)

- Pick 2–3 starter geographies with strong primary sources and visible impact
- Reach critical mass quickly (10–20 lit locations)
- Partner with 1–2 credible institutions early (validation + first durable endorsements)
- Ship transparency log early (trust accelerant)
- Prioritize resource-page backlinks (edu/ngo/gov) before broad media
- Keep outreach gated until the truth pipeline is boringly reliable

---

# 27) Success Metrics (credibility first)

**Credibility & governance:**
- % snapshot claims with valid evidence anchors (target: 100%)
- Median conflict resolution time
- Correction turnaround time
- Freshness compliance (% nodes not overdue)
- Number of publish blocks prevented by gates (a good sign)

**Adoption:**
- Referring domains (edu/ngo/gov)
- Citations/embeds of node URLs
- API/webhook subscriptions

**Operations:**
- Proposal-to-publish lead time
- Cost per verified update (bounded)
- DLQ stability and incident rate

---

# 28) MVP Requirements Checklist (P0 — Do Not Ship Without)

## Truth Integrity
- [ ] Evidence snapshots + content hashes stored
- [ ] Evidence anchors required on all key claims
- [ ] Claim type classification enforced
- [ ] Geo ambiguity workflow operational
- [ ] Conflict representation (no silent overwrites)
- [ ] Append-only revisions + visible change log
- [ ] All 5 gates (A-E) implemented and fail-closed
- [ ] Human approval gate for P0 cases

## Adversarial Resilience
- [ ] Submission quarantine + manual approval
- [ ] Rate limits + budgets + circuit breakers
- [ ] Allowlisted fetching + SSRF protection
- [ ] Forgery detection workflow
- [ ] Contributor reputation baseline

## Freshness + Ops
- [ ] `last_verified_at` + `reverify_due_at` on all nodes
- [ ] Freshness states + public stale banners
- [ ] Re-verification job runner + queues
- [ ] SLA dashboards + alerts
- [ ] Escalation workflows with stop conditions

## Governance
- [ ] Publish gates enforced in code
- [ ] Audit logs immutable
- [ ] Revision log visible publicly
- [ ] Conflict representation + human escalation
- [ ] Outreach suppression on stale/conflict/ambiguous

---

# 29) Non-Negotiables (Build Rules)

- Fail closed on missing evidence anchors for snapshot claims
- No silent overwrites; revisions are append-only
- No outreach amplification on stale/conflict/ambiguous geo items
- Quarantine public submissions until verified
- Policy gates enforced in code, not prompts
- Audit logs are immutable and tamper-evident
- Rate limits and budgets exist from day one
- Human approval required for all P0 escalation triggers
- AI is copilot, never autopilot

---

# 30) What This Unlocks (Why It Matters)

With these controls in place:
- **Institutional trust increases** — citations stick because the system is auditable
- **Adversarial attacks cost attackers more than they cost you** — quarantine + gates + budgets
- **You can safely scale contributor networks** — reputation + verification tiers
- **Federation becomes possible** — accept signed, conformance-tested feeds
- **Water-as-commodity analytics becomes credible** — underlying record is defensible
- **Global standard adoption** — other domains can implement Situation Graph + their own domain packs
