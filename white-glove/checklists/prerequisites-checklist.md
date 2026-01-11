# intent solutions io
---

# Prerequisites Checklist
*Redirected to the new verification system*

---

## For Clients

**Step 1:** Complete the Stack Discovery Form
→ [GOOGLE_FORM_URL - to be added]

**Step 2:** You'll receive a personalized verification guide via email

**Step 3:** Run the verification script and send Jeremy a screenshot

**Step 4:** Add Jeremy as GitHub collaborator

That's it! The form and guide will walk you through everything.

---

## For Jeremy (Internal Reference)

### New Verification System Files

| File | Purpose |
|------|---------|
| `forms/stack-discovery-fields.md` | Google Form field spec |
| `scripts/verify-prereqs.sh` | Client verification script |
| `templates/verification-guide-base.md` | Personalized guide template |
| `clients/{name}/pre-session-verification.md` | Per-client status tracking |

### Workflow

1. Client submits Stack Discovery Form
2. Review responses (5 min)
3. Send verification guide: `/email client@example.com -s "Your Pre-Session Checklist" --attach templates/verification-guide-base.md`
4. Client runs `verify-prereqs.sh`, sends screenshot
5. Review screenshot → confirm or send fixes
6. Schedule session once all green

### Quick Reference: What Clients Need

**Required (everyone):**
- Node.js 18+
- Claude Code CLI
- GitHub account
- GitHub CLI (gh) authenticated

**Optional (based on stack):**
- Supabase project URL
- Other service credentials (discovered via form)

---

## Legacy Checklist (Archived)

The detailed prerequisites checklist has been replaced by the personalized system above.

For the original comprehensive checklist, see git history or ask Jeremy.

---
january 2026 · v.00.00.01
