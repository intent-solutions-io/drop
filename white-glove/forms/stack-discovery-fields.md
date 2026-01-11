# intent solutions io
---

# Stack Discovery Form Spec
*Google Form field definitions for "Learn with Jeremy" intake*

---

## Form Title
**Learn with Jeremy: Pre-Session Stack Discovery**

## Form Description
Help me prepare for our Claude Code session by telling me about your setup.
Takes 5 minutes. Your answers shape our time together.

---

## Section 1: Basic Information

| Field | Type | Required | Options/Notes |
|-------|------|----------|---------------|
| Full Name | Short text | Yes | |
| Email Address | Email | Yes | For sending verification instructions |
| Preferred First Name | Short text | No | How should I address you? |
| Computer Type | Multiple choice | Yes | Mac (Intel) / Mac (Apple Silicon) / Windows / Linux |

---

## Section 2: Technical Comfort Level

| Field | Type | Required | Options |
|-------|------|----------|---------|
| Terminal Experience | Multiple choice | Yes | Never used it / Used a few times / Comfortable with basics / Power user |
| Previous AI Tools | Checkbox | No | Claude (web) / ChatGPT / GitHub Copilot / Cursor / n8n / Make / Zapier / None |

---

## Section 3: Your Tech Stack

*Check all that apply. This helps me customize your session.*

### Databases & Backend (Checkbox)
- Supabase
- Firebase / Firestore
- Airtable
- PostgreSQL (other hosting)
- MongoDB
- None yet

### Code & Deployment (Checkbox)
- GitHub (required for collaboration)
- Bolt.new
- Vercel
- Netlify
- Railway
- Render
- Other: ___

### Automation & Workflows (Checkbox)
- n8n
- Zapier
- Make (Integromat)
- GitHub Actions
- None

### Analytics (Checkbox)
- Plausible
- Google Analytics
- PostHog
- Mixpanel
- None

---

## Section 4: Credential Readiness

| Field | Type | Options |
|-------|------|---------|
| Do you have a GitHub account? | Multiple choice | Yes / No / Not sure |
| Do you have your Supabase project URL handy? | Multiple choice | Yes / No / Not using Supabase |
| Have you created a GitHub Personal Access Token before? | Multiple choice | Yes / No / Unsure what that is |
| Do you have admin access to install software on your computer? | Multiple choice | Yes / No / Not sure |

---

## Section 5: Your Project

| Field | Type | Required |
|-------|------|----------|
| What project will you use Claude Code for first? | Long text | Yes |
| What do you most want Claude Code to help with? | Checkbox | Yes |

**Checkbox options:**
- Writing code
- Debugging / fixing issues
- Learning new technologies
- Documentation
- Data analysis
- General productivity
- Other: ___

| Field | Type | Required |
|-------|------|----------|
| Biggest frustration with your current workflow? | Long text | No |

---

## Section 6: Scheduling

| Field | Type | Options |
|-------|------|---------|
| Your Timezone | Dropdown | US timezones + common international |
| Best times for our session | Checkbox | Morning (9am-12pm) / Afternoon (12-5pm) / Evening (5-8pm) / Weekends |
| Preferred session length | Multiple choice | 45 minutes / 60 minutes / 90 minutes |

---

## Form Settings

- **Collect emails**: Yes (for sending follow-up)
- **Limit to 1 response**: No (allow re-submissions)
- **Confirmation message**: "Thanks! I'll review your answers and send your personalized verification checklist within 24 hours."
- **Send copy to respondent**: Yes

---

## After Submission Flow

1. Jeremy receives notification
2. Review responses (5 min)
3. Generate personalized verification guide from `templates/verification-guide-base.md`
4. Send via `/email` skill with guide attached
5. Client completes verification homework
6. Client sends screenshot + confirmation
7. Jeremy confirms → schedule session

---

## Google Form URL

**[TO BE FILLED AFTER CREATION]**

Live form: `https://forms.gle/...`
Edit form: `https://docs.google.com/forms/d/.../edit`

---
january 2026 · v.00.00.01
