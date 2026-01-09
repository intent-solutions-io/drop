#!/bin/bash
# generate-pdf.sh - Generate professional PDF from markdown using pandoc
#
# Usage:
#   ./generate-pdf.sh [input.md] [output.pdf]
#
# Defaults:
#   input:  CHANGELOG.md
#   output: changelog-YYYYMMDD.pdf

set -e

# Get script directory for template path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/../templates"

# Input/output files
INPUT="${1:-CHANGELOG.md}"
OUTPUT="${2:-changelog-$(date +%Y%m%d).pdf}"

# Validate input exists
if [[ ! -f "$INPUT" ]]; then
    echo "Error: Input file not found: $INPUT" >&2
    exit 1
fi

# Check for pandoc
if ! command -v pandoc &> /dev/null; then
    echo "Error: pandoc not found. Install with: sudo apt install pandoc" >&2
    exit 1
fi

# Check for xelatex
if ! command -v xelatex &> /dev/null; then
    echo "Error: xelatex not found. Install with: sudo apt install texlive-xetex" >&2
    exit 1
fi

echo "Generating PDF..."
echo "  Input:  $INPUT"
echo "  Output: $OUTPUT"
echo "  Template: $TEMPLATE_DIR/cwh-report.latex"

# Generate PDF with custom template
pandoc "$INPUT" \
    -o "$OUTPUT" \
    --pdf-engine=xelatex \
    --template="$TEMPLATE_DIR/cwh-report.latex" \
    -V title="Creative Wheel House Progress Report" \
    -V author="Jeremy Longshore" \
    -V date="$(date '+%B %d, %Y')" \
    --toc \
    --toc-depth=2 \
    --highlight-style=tango \
    2>&1

# Check result
if [[ -f "$OUTPUT" ]]; then
    SIZE=$(du -h "$OUTPUT" | cut -f1)
    echo ""
    echo "Success: $OUTPUT ($SIZE)"
else
    echo "Error: PDF generation failed" >&2
    exit 1
fi
