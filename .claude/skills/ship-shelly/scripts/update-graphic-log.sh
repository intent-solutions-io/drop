#!/bin/bash
#
# update-graphic-log.sh - Update cumulative visual changelog
#
# Prepends new session diagrams to GRAPHIC-CHANGELOG.md and regenerates PDF.
# Creates a visual timeline of project evolution for C-suite review.
#
# Usage:
#     ./update-graphic-log.sh [date]
#
# Output:
#     GRAPHIC-CHANGELOG.md (updated)
#     GRAPHIC-CHANGELOG.pdf (regenerated)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="${PROJECT_ROOT:-$(git rev-parse --show-toplevel 2>/dev/null || dirname "$SCRIPT_DIR"/../../..)}"
DATE_STR="${1:-$(date +%Y-%m-%d)}"
GRAPHIC_LOG="$PROJECT_ROOT/GRAPHIC-CHANGELOG.md"
GRAPHICS_DIR="$PROJECT_ROOT/graphics"
TEMPLATE_DIR="$SCRIPT_DIR/../templates"

# ============================================================================
# Initialize GRAPHIC-CHANGELOG.md if it doesn't exist
# ============================================================================

if [[ ! -f "$GRAPHIC_LOG" ]]; then
    cat > "$GRAPHIC_LOG" << 'EOF'
# Creative Wheel House - Visual Evolution

A chronological record of project architecture and workflow evolution.
Each session adds new diagrams showing the state at that point in time.

**How to read this document:**
- Most recent session at the top
- Scroll down to see project history
- Each diagram is self-explanatory with labels
- Use for quick visual scans of progress

---

EOF
    echo "Initialized: $GRAPHIC_LOG"
fi

# ============================================================================
# Find all diagrams for this session
# ============================================================================

diagrams=()
for img in "$GRAPHICS_DIR/$DATE_STR-"*.png; do
    if [[ -f "$img" ]]; then
        diagrams+=("$img")
    fi
done

if [[ ${#diagrams[@]} -eq 0 ]]; then
    echo "WARNING: No diagrams found for $DATE_STR in $GRAPHICS_DIR"
    echo "Run generate-workflow.sh and generate-architecture.py first."
    exit 0
fi

# ============================================================================
# Build new session entry
# ============================================================================

build_session_entry() {
    local entry=""

    entry+="## Session: $DATE_STR"$'\n\n'

    # Add each diagram with descriptive headers
    for img in "${diagrams[@]}"; do
        local basename=$(basename "$img" .png)
        local name="${basename#$DATE_STR-}"  # Remove date prefix

        # Convert name to title case and make descriptive
        case "$name" in
            "architecture")
                entry+="### GCP Infrastructure Architecture"$'\n'
                entry+="_Production cloud infrastructure with Vertex AI, Cloud Run, and data services._"$'\n\n'
                ;;
            "arch-simple")
                entry+="### Technical Architecture Overview"$'\n'
                entry+="_System architecture showing client, compute, AI/ML, and data layers._"$'\n\n'
                ;;
            "workflow")
                entry+="### Session Workflow Pipeline"$'\n'
                entry+="_End-to-session automation from code changes through delivery._"$'\n\n'
                ;;
            "progress")
                entry+="### Session Progress Metrics"$'\n'
                entry+="_Current session statistics and workflow status._"$'\n\n'
                ;;
            *)
                entry+="### ${name^}"$'\n\n'
                ;;
        esac

        entry+="![${name}](graphics/$(basename "$img"))"$'\n\n'
    done

    entry+="---"$'\n\n'

    echo "$entry"
}

# ============================================================================
# Prepend new entry to GRAPHIC-CHANGELOG.md
# ============================================================================

NEW_ENTRY=$(build_session_entry)

# Find the line after the header section (after first ---)
HEADER_END=$(grep -n "^---$" "$GRAPHIC_LOG" | head -1 | cut -d: -f1)

if [[ -z "$HEADER_END" ]]; then
    # No header separator found, just prepend after title
    HEADER_END=1
fi

# Create new file: header + new entry + rest
{
    head -n "$HEADER_END" "$GRAPHIC_LOG"
    echo ""
    echo "$NEW_ENTRY"
    tail -n +"$((HEADER_END + 1))" "$GRAPHIC_LOG" | tail -n +2  # Skip blank line
} > "${GRAPHIC_LOG}.tmp"

mv "${GRAPHIC_LOG}.tmp" "$GRAPHIC_LOG"

echo "Updated: $GRAPHIC_LOG"
echo "Added ${#diagrams[@]} diagrams for session $DATE_STR"

# ============================================================================
# Generate PDF from GRAPHIC-CHANGELOG.md
# ============================================================================

if command -v pandoc &>/dev/null; then
    PDF_OUTPUT="$PROJECT_ROOT/GRAPHIC-CHANGELOG.pdf"

    pandoc "$GRAPHIC_LOG" \
        -o "$PDF_OUTPUT" \
        --pdf-engine=xelatex \
        --template="$TEMPLATE_DIR/cwh-report.latex" \
        -V title="Creative Wheel House - Visual Evolution" \
        -V author="Jeremy Longshore" \
        -V date="$(date '+%B %d, %Y')" \
        -V geometry:margin=0.75in \
        2>/dev/null

    echo "Generated: $PDF_OUTPUT"
else
    echo "WARNING: pandoc not found, skipping PDF generation"
fi

echo ""
echo "Graphic changelog updated successfully."
