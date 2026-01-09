#!/bin/bash
#
# generate-workflow.sh - Generate professional workflow diagrams with D2
#
# Creates session workflow, progress, and status diagrams using D2.
# Outputs clean, professional diagrams suitable for C-suite presentation.
#
# Usage:
#     ./generate-workflow.sh [output_dir]
#
# Output:
#     graphics/YYYY-MM-DD-workflow.png
#     graphics/YYYY-MM-DD-progress.png

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="${PROJECT_ROOT:-$(git rev-parse --show-toplevel 2>/dev/null || dirname "$SCRIPT_DIR"/../../..)}"
DATE_STR=$(date +%b-%d-%Y)
OUTPUT_DIR="${1:-$PROJECT_ROOT/graphics}"

mkdir -p "$OUTPUT_DIR"

# D2 binary location
D2_BIN="${D2_BIN:-$HOME/.local/bin/d2}"

if [[ ! -x "$D2_BIN" ]]; then
    echo "ERROR: D2 not found at $D2_BIN"
    exit 1
fi

# ============================================================================
# DIAGRAM 1: Session Workflow
# Shows the /ship-shelly automation pipeline
# ============================================================================

generate_session_workflow() {
    local output="$OUTPUT_DIR/${DATE_STR}-workflow.png"
    local d2_file=$(mktemp --suffix=.d2)

    cat > "$d2_file" << 'EOF'
direction: right

title: Creative Wheel House - Session Workflow {
  shape: text
  style.font-size: 24
  style.bold: true
  style.font-color: "#1F4E79"
}

# Main flow groups
session: Session Start {
  style.fill: "#E3F2FD"
  style.stroke: "#1565C0"

  init: Initialize
  review: Review State

  init -> review
}

development: Development {
  style.fill: "#E8F5E9"
  style.stroke: "#2E7D32"

  code: Code Changes
  commit: Commit
  pr: Create PR

  code -> commit -> pr
}

qa: Quality Gate {
  style.fill: "#FFF3E0"
  style.stroke: "#EF6C00"

  gemini: Gemini Review
  approve: Approval
  merge: Merge to Main

  gemini -> approve -> merge
}

delivery: Delivery {
  style.fill: "#F3E5F5"
  style.stroke: "#7B1FA2"

  changelog: Write Changelog
  pdf: Generate PDF
  diagrams: Create Diagrams

  changelog -> pdf
  changelog -> diagrams
}

send: Send to Shelly {
  style.fill: "#E0F2F1"
  style.stroke: "#00695C"

  compose: Compose Email
  attach: Attach Reports
  send: Send via Resend

  compose -> attach -> send
}

# Flow connections
session.review -> development.code: triggers
development.pr -> qa.gemini: requires
qa.merge -> delivery.changelog: generates
delivery.pdf -> send.attach
delivery.diagrams -> send.attach
EOF

    "$D2_BIN" --theme 0 --layout elk --pad 40 "$d2_file" "$output" 2>/dev/null
    rm -f "$d2_file"
    echo "Generated: $output"
}

# ============================================================================
# DIAGRAM 2: Progress Status
# Shows current session metrics and status
# ============================================================================

generate_progress_status() {
    local output="$OUTPUT_DIR/${DATE_STR}-progress.png"
    local d2_file=$(mktemp --suffix=.d2)

    # Get git stats
    local commits_today=$(git log --oneline --since="midnight" 2>/dev/null | wc -l || echo "0")
    local files_changed=$(git diff --stat HEAD~5 2>/dev/null | tail -1 | grep -oP '\d+ file' | grep -oP '\d+' || echo "0")
    local branch=$(git branch --show-current 2>/dev/null || echo "main")
    local last_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")

    cat > "$d2_file" << EOF
direction: down

title: Session Progress - $DATE_STR {
  shape: text
  style.font-size: 24
  style.bold: true
  style.font-color: "#1F4E79"
}

metrics: Session Metrics {
  style.fill: "#E3F2FD"
  style.stroke: "#1565C0"
  style.border-radius: 8

  commits: "Commits Today: $commits_today" {
    shape: rectangle
    style.fill: "#BBDEFB"
  }
  files: "Files Changed: $files_changed" {
    shape: rectangle
    style.fill: "#BBDEFB"
  }
  branch: "Branch: $branch" {
    shape: rectangle
    style.fill: "#BBDEFB"
  }
  version: "Version: $last_tag" {
    shape: rectangle
    style.fill: "#BBDEFB"
  }
}

status: Workflow Status {
  style.fill: "#E8F5E9"
  style.stroke: "#2E7D32"
  style.border-radius: 8

  sweep: "Sweep Phase" {
    shape: rectangle
    style.fill: "#C8E6C9"
  }
  changelog: "Changelog" {
    shape: rectangle
    style.fill: "#C8E6C9"
  }
  pdf: "PDF Generation" {
    shape: rectangle
    style.fill: "#C8E6C9"
  }
  email: "Email Delivery" {
    shape: rectangle
    style.fill: "#FFF9C4"
  }
}

metrics -> status
EOF

    "$D2_BIN" --theme 0 --layout elk --pad 40 "$d2_file" "$output" 2>/dev/null
    rm -f "$d2_file"
    echo "Generated: $output"
}

# ============================================================================
# DIAGRAM 3: Architecture Overview (D2 version - simpler than Python)
# ============================================================================

generate_architecture_d2() {
    local output="$OUTPUT_DIR/${DATE_STR}-arch-simple.png"
    local d2_file=$(mktemp --suffix=.d2)

    cat > "$d2_file" << 'EOF'
direction: right

title: Creative Wheel House - Technical Architecture {
  shape: text
  style.font-size: 24
  style.bold: true
  style.font-color: "#1F4E79"
}

client: Client Layer {
  style.fill: "#E3F2FD"
  style.stroke: "#1565C0"

  web: Web App
  cli: Claude Code
}

compute: Google Cloud {
  style.fill: "#FFF3E0"
  style.stroke: "#EF6C00"

  functions: Cloud Functions {
    style.fill: "#FFE0B2"
  }
  run: Cloud Run {
    style.fill: "#FFE0B2"
  }
}

ai: AI/ML {
  style.fill: "#F3E5F5"
  style.stroke: "#7B1FA2"

  vertex: Vertex AI {
    style.fill: "#E1BEE7"
  }
  gemini: Gemini 2.5 {
    style.fill: "#E1BEE7"
  }
}

data: Data Layer {
  style.fill: "#E8F5E9"
  style.stroke: "#2E7D32"

  firestore: Firestore {
    style.fill: "#C8E6C9"
  }
  bigquery: BigQuery {
    style.fill: "#C8E6C9"
  }
  storage: Cloud Storage {
    style.fill: "#C8E6C9"
  }
}

# Connections
client.web -> compute.run: HTTPS
client.cli -> compute.functions: API
compute.functions -> ai.vertex: inference
compute.run -> data.firestore: queries
ai.vertex -> ai.gemini
data.firestore -> data.bigquery: sync
EOF

    "$D2_BIN" --theme 0 --layout elk --pad 40 "$d2_file" "$output" 2>/dev/null
    rm -f "$d2_file"
    echo "Generated: $output"
}

# ============================================================================
# Main execution
# ============================================================================

echo "Generating workflow diagrams..."
echo "Output directory: $OUTPUT_DIR"
echo ""

generate_session_workflow
generate_progress_status
generate_architecture_d2

echo ""
echo "All diagrams generated successfully."
