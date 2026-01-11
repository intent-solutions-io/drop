#!/bin/bash
#
# Claude Code Health Check
# Verifies installation is working correctly
#

echo "=================================="
echo "  Claude Code Health Check"
echo "=================================="
echo ""

ERRORS=0

# Check Node.js
echo -n "Node.js: "
if command -v node &> /dev/null; then
    echo "✓ $(node --version)"
else
    echo "❌ Not installed"
    ((ERRORS++))
fi

# Check npm
echo -n "npm: "
if command -v npm &> /dev/null; then
    echo "✓ $(npm --version)"
else
    echo "❌ Not installed"
    ((ERRORS++))
fi

# Check Claude Code
echo -n "Claude Code: "
if command -v claude &> /dev/null; then
    echo "✓ Installed"
else
    echo "❌ Not installed"
    echo "   Run: npm install -g @anthropic-ai/claude-code"
    ((ERRORS++))
fi

# Check authentication
echo -n "Auth config: "
if [ -d "$HOME/.claude" ]; then
    echo "✓ Found"
else
    echo "⚠ Not found (run 'claude' to authenticate)"
fi

# Check for CLAUDE.md in current directory
echo -n "CLAUDE.md: "
if [ -f "CLAUDE.md" ]; then
    echo "✓ Found in current directory"
else
    echo "⚠ Not found (optional)"
fi

echo ""
echo "=================================="
if [ $ERRORS -eq 0 ]; then
    echo "  All checks passed!"
else
    echo "  $ERRORS issue(s) found"
fi
echo "=================================="
