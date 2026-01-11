# intent solutions io
---

# GitHub 101: Version Control for Beginners
*Required for Claude Code coaching. This is how we collaborate.*

## What is GitHub?
GitHub is like Google Docs for code - saves every version, lets multiple people work together, keeps history of all changes.

**Why you need it:** Your coach can see and help with your code directly.

## Part 1: Create Your GitHub Account

1. Go to [github.com](https://github.com)
2. Click **Sign up**
3. Enter email, password, username (keep it professional)
4. Verify your email
5. Add profile picture in Settings

## Part 2: Create Your First Repository

A **repository** ("repo") is a project folder on GitHub.

1. Click the `+` icon (top right) → **New repository**
2. Name it: `my-first-project`
3. Check **Add a README file**
4. Click **Create repository**
5. Click green **Code** button → copy the HTTPS URL

## Part 3: Add Your Coach as Collaborator

**Required so your coach can help you.**

1. Open your repository
2. Click **Settings** → **Collaborators** (left sidebar)
3. Click **Add people**
4. Search: `jeremylongshore`
5. Click **Add jeremylongshore to this repository**

## Part 4: Clone to Your Computer

"Cloning" downloads the repo to your computer.

```bash
cd ~/Desktop
git clone https://github.com/yourusername/my-first-project.git
cd my-first-project
ls -la
```
Replace `yourusername` with your actual GitHub username.

## Part 5: Make Changes and Push

**The workflow:** Edit → Stage → Commit → Push

```bash
# 1. Make a change to README.md (any text editor)

# 2. Check what changed
git status

# 3. Stage all changes
git add .

# 4. Commit with a message
git commit -m "Updated README"

# 5. Push to GitHub
git push
```

**First time?** You'll need to authenticate with a Personal Access Token (see below).

## Part 6: Personal Access Token (PAT)

GitHub doesn't accept passwords. You need a token.

1. GitHub → Settings (your profile) → **Developer settings**
2. **Personal access tokens** → **Tokens (classic)**
3. **Generate new token (classic)**
4. Name: `Claude Code Laptop`
5. Check: `repo` (all) and `workflow`
6. **Generate token**
7. **COPY IT NOW** - you won't see it again!

When git asks for password, paste your token instead.

## Daily Commands

```bash
git pull                    # Get latest (do this first!)
# ... make changes ...
git add .                   # Stage all
git commit -m "What I did"  # Commit
git push                    # Upload
```

## Cheat Sheet

| Command | What It Does |
|---------|--------------|
| `git clone URL` | Download a repo |
| `git status` | See what changed |
| `git add .` | Stage all changes |
| `git commit -m "msg"` | Save locally |
| `git push` | Upload to GitHub |
| `git pull` | Download latest |

## Common Issues

**"Permission denied"** - Token wrong/expired. Generate new one.

**"Please tell me who you are"** - Run once:
```bash
git config --global user.email "you@email.com"
git config --global user.name "Your Name"
```

**"Merge conflict"** - Run `git pull`, look for `<<<<<<<` markers in file, fix and commit.

## Your Coach's GitHub

Add this collaborator to all projects: **`jeremylongshore`**

---
january 2026 · v.00.00.01
