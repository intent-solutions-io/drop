# intent solutions io
---

# Terminal 101: Your First Commands
*For people who have never touched a command line.*

## What is Terminal?
Terminal is a text-based way to control your computer. Instead of clicking icons, you type commands.

**Why use it?**
- Faster once you know it
- More powerful than clicking
- Required for Claude Code

## Opening Terminal

**Mac:** Press `Cmd + Space`, type `Terminal`, press Enter
**Windows:** Press `Windows key`, type `cmd` or `PowerShell`, press Enter
**Linux:** Press `Ctrl + Alt + T`

## The Prompt
When Terminal opens, you'll see something like:
```
jeremy@macbook ~ %
```
This is the **prompt** - it's waiting for your input.
- `jeremy` = your username
- `~` = current location (home folder)
- `%` or `$` = ready for input

## Your First 5 Commands

### 1. `pwd` - Where am I?
**P**rint **W**orking **D**irectory. Shows your current location.
```bash
pwd
```
Output: `/Users/jeremy`

### 2. `ls` - What's here?
**L**i**s**t. Shows files and folders.
```bash
ls
```
Output: `Desktop  Documents  Downloads  Pictures`

Pro tip - see hidden files: `ls -la`

### 3. `cd` - Move around
**C**hange **D**irectory. Move to a different folder.
```bash
cd Desktop
```
Go back up: `cd ..`
Go home: `cd ~`

### 4. `mkdir` - Make a folder
**M**a**k**e **Dir**ectory.
```bash
mkdir my-project
```

### 5. `clear` - Clean the screen
```bash
clear
```
Or press `Cmd + K` (Mac) / `Ctrl + L` (Windows/Linux)

## Cheat Sheet

| Command | What It Does | Example |
|---------|--------------|---------|
| `pwd` | Show current location | `pwd` |
| `ls` | List files/folders | `ls -la` |
| `cd` | Change folder | `cd Desktop` |
| `cd ..` | Go up one level | `cd ..` |
| `cd ~` | Go to home folder | `cd ~` |
| `mkdir` | Create folder | `mkdir new-folder` |
| `clear` | Clear screen | `clear` |

## Common Mistakes

**"No such file or directory"** - Check spelling with `ls` first.
**"Permission denied"** - Try adding `sudo` before the command.
**"Command not found"** - The program isn't installed.

## Practice Exercise

1. Open Terminal
2. `pwd` (where are you?)
3. `ls` (what's here?)
4. `cd Desktop`
5. `mkdir claude-projects`
6. `ls` (see the new folder?)
7. `cd claude-projects`
8. `pwd`

Done! You navigated to Desktop, created a folder, and moved into it.

## Quick Reference Card
```
+------------------------------------------+
|           TERMINAL CHEAT SHEET           |
+------------------------------------------+
| pwd         = Where am I?                |
| ls          = What's here?               |
| cd folder   = Go to folder               |
| cd ..       = Go up one level            |
| cd ~        = Go home                    |
| mkdir name  = Create folder              |
| clear       = Clean screen               |
+------------------------------------------+
| Tab = Auto-complete | Up = Last command  |
| Ctrl+C = Cancel     |                    |
+------------------------------------------+
```

---
january 2026 · v.00.00.01
