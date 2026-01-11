#!/bin/bash
#
# Claude Code Installer for Mac
# White Glove Onboarding Package
#

set -e

echo "=================================="
echo "  Claude Code Installer"
echo "=================================="
echo ""

# Check if running on Mac
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ This script is for macOS only."
    exit 1
fi

# Check for Node.js
echo "Checking for Node.js..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo "✓ Node.js installed: $NODE_VERSION"
else
    echo "❌ Node.js not found."
    echo ""
    echo "Please install Node.js first:"
    echo "  1. Go to https://nodejs.org"
    echo "  2. Download the LTS version"
    echo "  3. Run the installer"
    echo "  4. Restart Terminal"
    echo "  5. Run this script again"
    exit 1
fi

# Check Node version (need 18+)
NODE_MAJOR=$(node --version | cut -d. -f1 | tr -d 'v')
if [ "$NODE_MAJOR" -lt 18 ]; then
    echo "❌ Node.js 18+ required. You have $NODE_VERSION"
    echo "   Please update Node.js at https://nodejs.org"
    exit 1
fi

echo ""
echo "Installing Claude Code..."
npm install -g @anthropic-ai/claude-code

echo ""
echo "=================================="
echo "  Installation Complete!"
echo "=================================="
echo ""
echo "Next steps:"
echo "  1. Run 'claude' to authenticate"
echo "  2. Navigate to your project folder"
echo "  3. Run 'claude' to start"
echo ""
echo "Need help? Email jeremy@intentsolutions.io"
