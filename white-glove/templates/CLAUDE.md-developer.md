# CLAUDE.md - Developer Template

## About This Project

<!-- Describe your project in 2-3 sentences -->

**Tech Stack:**
- Language:
- Framework:
- Database:
- Deployment:

## Code Standards

- Use [language] best practices
- Follow existing patterns in the codebase
- Keep functions small and focused
- Write descriptive variable names
- Add comments only when logic isn't self-evident

## File Structure

```
src/
├── components/    # UI components
├── lib/           # Utilities and helpers
├── api/           # API routes
└── types/         # Type definitions
```

## Common Commands

```bash
# Development
npm run dev

# Testing
npm test

# Build
npm run build

# Deploy
npm run deploy
```

## Preferences

- Prefer editing existing files over creating new ones
- Ask before making architectural changes
- Keep PRs small and focused
- Run tests before committing

## Don't Do

- Don't modify .env files without asking
- Don't install new dependencies without approval
- Don't refactor unrelated code
- Don't add console.logs (use proper logging)
