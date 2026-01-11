# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

**Learn with Jeremy** - White-glove Claude Code CLI training for executives and non-technical founders. PDF-first, GitHub-required, elite attention.

Part of Creative House Studios collaboration with Glen Kerby and Shelly Frank.

## Architecture

```
white-glove/
├── guides/              # Learning materials (01-11), markdown → PDF
├── checklists/          # Prerequisites, intake forms
├── templates/           # CLAUDE.md templates + verification guide
├── forms/               # Google Form specs (stack-discovery-fields.md)
├── clients/             # Per-client folders with session plans
│   └── shelly-chs/      # First pilot client
└── scripts/             # install.sh, verify-prereqs.sh
```

### Client Onboarding Flow

1. **Form**: Client completes Stack Discovery Form (Google Form)
2. **Guide**: Send personalized verification guide (`templates/verification-guide-base.md`)
3. **Verify**: Client runs `scripts/verify-prereqs.sh`, sends screenshot
4. **Confirm**: Review results → green = schedule, red = send fixes
5. **Sessions**: Follow session plan in `clients/{name}/session-plan.md`
6. **Delivery**: Custom CLAUDE.md from templates, ongoing support

### Service Tiers

- **Tier 1** ($0): Self-service PDF + basic template
- **Tier 2** ($99): 30-min guided setup + custom CLAUDE.md
- **Tier 3** ($299): Full white-glove (60-min discovery, 30-day support)
- **Tier 4** ($999): Team onboarding (up to 5 members)

## Commands

### Client Verification
```bash
# Pre-session verification (clients run this)
bash scripts/verify-prereqs.sh

# Mac installer (if needed)
./scripts/install.sh
```

### Email Delivery
```bash
# Send verification guide after form submission
/email client@example.com -s "Your Pre-Session Checklist" --attach templates/verification-guide-base.md

# Send learning materials
/email client@example.com -s "Materials" --attach guides/01-terminal-101.md guides/07-github-101.md guides/08-claude-code-install.md
```

## Document Standards

**Header:** `# intent solutions io` (lowercase)
**Footer:** `january 2026 · v.00.00.01`
**Style:** Tight spacing, copy/paste friendly, beginner-appropriate

## Constraints

- PDF-first delivery (no videos required)
- GitHub required for all clients (collaboration layer)
- Free tools only (no paid subscriptions required)
- Claude Code CLI specialty (not web Claude)
- Client types: Simple, Automator, Cloud User, Developer-Adjacent

## Current Client

**Shelly (CHS)** - First pilot. Building Credibility Spine on Supabase.
- Files: `clients/shelly-chs/`
- Status: Pre-session prep (GitHub access, credentials)
- Sessions: 3 planned (Orientation → Structure → Implementation)
