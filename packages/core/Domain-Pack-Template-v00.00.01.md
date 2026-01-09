**Template:** Domain Pack
**Version:** v00.00.01
**Status:** ROUGH DRAFT

---

## How to Use This Template

Copy this file to your domain folder (e.g., `packages/water/Water-Pack-v00.00.01.md`) and fill in each section for your specific domain.

Every Domain Pack implements the Situation Graph Spec for a specific vertical.

---

# Domain Pack: [DOMAIN NAME]

**Version:** v00.00.01
**Domain:** [e.g., Water, Influencer, Food, Civic]
**Status:** [Draft | Review | Active]

---

## 1) Node Types

Define what entities are tracked in this domain:

| Node Type | Description | Identifier Format |
|-----------|-------------|-------------------|
| [e.g., Location] | [What it represents] | [e.g., geo coordinates + system ID] |
| [e.g., Creator] | [What it represents] | [e.g., platform + handle] |

---

## 2) Event Types

Define what kinds of things happen to nodes:

| Event Type | Description | Trigger |
|------------|-------------|---------|
| [e.g., Boil Notice] | [What it means] | [What causes it to be created] |
| [e.g., Brand Deal] | [What it means] | [What causes it to be created] |

---

## 3) Claim Types (Domain-Specific)

Map to the core claim types with domain-specific examples:

| Core Type | Domain Example | Evidence Required |
|-----------|----------------|-------------------|
| Measurement | [e.g., PFAS level: 15 ppt] | [e.g., Lab report with method] |
| Advisory | [e.g., Boil notice issued] | [e.g., Official utility posting] |
| Official Statement | [e.g., Utility press release] | [e.g., Authoritative URL] |
| Allegation | [e.g., Contamination complaint] | [e.g., News report with attribution] |
| Observation | [e.g., Water discoloration report] | [e.g., Community submission] |

---

## 4) Metrics & Units

Define how things are measured:

| Metric | Unit | Method | Source Type |
|--------|------|--------|-------------|
| [e.g., Contamination level] | [e.g., ppt, ppb] | [e.g., EPA Method 537.1] | [e.g., Accredited lab] |
| [e.g., Follower count] | [e.g., integer] | [e.g., Platform API] | [e.g., Official API] |

---

## 5) Source Rules

Define trust tiers for this domain:

| Trust Tier | Source Types | Automation Privileges |
|------------|--------------|----------------------|
| **Official** | [e.g., EPA, state agencies, utilities] | Auto-publish after Gate A-B |
| **Accredited** | [e.g., Certified labs, verified publishers] | Auto-propose, human approve |
| **News** | [e.g., Major outlets with water beat] | Auto-propose, human approve |
| **Community** | [e.g., Citizen reports, social media] | Quarantine, manual review |
| **Unknown** | [All others] | Reject or deep review |

---

## 6) Freshness SLAs

Define how fast things go stale:

### High Volatility Events
| Event Type | Active Cadence | Post-Resolution | Critical Threshold |
|------------|---------------|-----------------|-------------------|
| [e.g., Boil notice] | [e.g., 6-24 hours] | [e.g., 7 days] | [e.g., 48 hours] |

### Medium Volatility Events
| Event Type | Active Cadence | Post-Resolution | Critical Threshold |
|------------|---------------|-----------------|-------------------|
| [e.g., Infrastructure failure] | [e.g., 24-72 hours] | [e.g., 14-30 days] | [e.g., 7 days] |

### Slow-Moving Conditions
| Event Type | Cadence | Critical Threshold |
|------------|---------|-------------------|
| [e.g., Chronic contamination] | [e.g., 30-90 days] | [e.g., 180 days] |

---

## 7) Sensitivity Rules

Define special handling requirements:

| Sensitivity Flag | Trigger | Handling |
|------------------|---------|----------|
| [e.g., Indigenous consent] | [e.g., Location on tribal land] | [e.g., Require consent before publish] |
| [e.g., Minor involved] | [e.g., Creator under 18] | [e.g., Restricted data, no contact info] |
| [e.g., Health claims] | [e.g., Medical advice in content] | [e.g., Escalate to L2 review] |

---

## 8) Verification Levels (Domain-Specific)

Map core verification levels to domain requirements:

| Level | Domain Requirements |
|-------|---------------------|
| **Unverified** | [e.g., Single community report, no official source] |
| **Source-Backed** | [e.g., One official source OR two news sources] |
| **Multi-Source Verified** | [e.g., Official + independent confirmation] |
| **Official** | [e.g., Verified utility/agency feed OR official posting] |

---

## 9) Resolution Rules (Identity/Geo)

Define how to resolve ambiguous identifiers:

| Ambiguity Type | Resolution Method | Escalation Trigger |
|----------------|-------------------|-------------------|
| [e.g., Same city name] | [e.g., State + county disambiguation] | [e.g., Multiple matches after rules] |
| [e.g., Similar handles] | [e.g., Platform + follower count + verification] | [e.g., No clear match] |

---

## 10) Outreach Rules

Define who gets contacted and when:

| Target Type | Criteria | Throttle | Opt-Out |
|-------------|----------|----------|---------|
| [e.g., Journalists] | [e.g., Water beat + regional coverage] | [e.g., 5/day per target] | [e.g., Global list] |
| [e.g., Brands] | [e.g., Active campaign + verified contact] | [e.g., 3/week per brand] | [e.g., Per-brand flag] |

**Never auto-outreach when:**
- Node is Stale or Critical
- Active conflict on claims
- Identity ambiguity unresolved
- Below verification threshold

---

## 11) MVP Scope (Pilot Constraints)

For initial launch, constrain:

| Constraint | Value | Reason |
|------------|-------|--------|
| **Geographies** | [e.g., California, Texas, Florida only] | [e.g., Strong primary sources] |
| **Event Types** | [e.g., Boil notices only] | [e.g., Clearest verification path] |
| **Automation** | [e.g., Manual approvals only] | [e.g., Build trust first] |
| **Outreach** | [e.g., None or manual only] | [e.g., Validate content quality first] |

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| v00.00.01 | [DATE] | Initial draft |
