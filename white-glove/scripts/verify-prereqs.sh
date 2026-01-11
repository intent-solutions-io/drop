#!/bin/bash
#
# Claude Code Pre-Session Verification
# Run this script and screenshot the results for Jeremy.
#
# Usage: bash verify-prereqs.sh
#

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║          CLAUDE CODE PRE-SESSION VERIFICATION                ║"
echo "║          Learn with Jeremy                                   ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

PASS=0
FAIL=0

check() {
    local name="$1"
    local cmd="$2"

    echo -n "  $name: "
    if eval "$cmd" &> /dev/null; then
        echo "✅ PASS"
        ((PASS++))
    else
        echo "❌ FAIL"
        ((FAIL++))
    fi
}

echo "1. CORE REQUIREMENTS"
echo "──────────────────────────────────────────────────────────────"
check "Node.js installed" "command -v node"
check "Node.js version 18+" "[ \$(node -v | cut -d. -f1 | tr -d v) -ge 18 ]"
check "npm installed" "command -v npm"
check "Claude Code installed" "command -v claude"

echo ""
echo "2. GITHUB"
echo "──────────────────────────────────────────────────────────────"
check "GitHub CLI (gh) installed" "command -v gh"
check "GitHub CLI authenticated" "gh auth status"

echo ""
echo "3. AUTHENTICATION"
echo "──────────────────────────────────────────────────────────────"
check "Claude config exists" "[ -d ~/.claude ]"

echo ""
echo "4. VERSION INFO"
echo "──────────────────────────────────────────────────────────────"
echo -n "  Node version: "; node --version 2>/dev/null || echo "N/A"
echo -n "  npm version: "; npm --version 2>/dev/null || echo "N/A"
echo -n "  Claude Code: "; claude --version 2>/dev/null || echo "N/A"
echo -n "  GitHub CLI: "; gh --version 2>/dev/null | head -1 || echo "N/A"

echo ""
echo "══════════════════════════════════════════════════════════════"
echo "  SUMMARY: $PASS passed, $FAIL failed"
echo ""

if [ $FAIL -eq 0 ]; then
    echo "  🎉 ALL CHECKS PASSED - Ready for your session!"
else
    echo "  ⚠️  Some checks failed - See troubleshooting below"
    echo ""
    echo "  QUICK FIXES:"
    echo "  ────────────"
    echo "  Node.js missing:    brew install node (or nodejs.org)"
    echo "  Claude Code:        npm install -g @anthropic-ai/claude-code"
    echo "  GitHub CLI:         brew install gh && gh auth login"
fi
echo "══════════════════════════════════════════════════════════════"
echo ""
echo "📸 Please screenshot this output and send to Jeremy."
echo ""
