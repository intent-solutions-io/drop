#!/usr/bin/env python3
"""
generate-architecture.py - Generate professional GCP architecture diagram

Creates enterprise-grade infrastructure diagrams with actual GCP icons.
Used by /ship-shelly to show technical sophistication.

Usage:
    python3 generate-architecture.py [output_path]

Output:
    graphics/YYYY-MM-DD-architecture.png
"""

import sys
import os
from datetime import datetime
from pathlib import Path

# Add venv to path if running standalone
SCRIPT_DIR = Path(__file__).parent.resolve()
PROJECT_ROOT = SCRIPT_DIR.parent.parent.parent.parent
VENV_SITE = PROJECT_ROOT / ".venv/lib/python3.12/site-packages"
if VENV_SITE.exists():
    sys.path.insert(0, str(VENV_SITE))

from diagrams import Diagram, Cluster, Edge
from diagrams.gcp.ml import VertexAI
from diagrams.gcp.compute import Run, Functions
from diagrams.gcp.database import Firestore
from diagrams.gcp.analytics import BigQuery
from diagrams.gcp.storage import GCS
from diagrams.gcp.devtools import Build
from diagrams.gcp.network import LoadBalancing
from diagrams.custom import Custom


def generate_architecture(output_path: str = None):
    """Generate the Creative Wheel House architecture diagram."""

    date_str = datetime.now().strftime("%b-%d-%Y")

    if output_path is None:
        graphics_dir = PROJECT_ROOT / "graphics"
        graphics_dir.mkdir(exist_ok=True)
        output_path = str(graphics_dir / f"{date_str}-architecture")
    else:
        # Remove extension if provided
        output_path = str(Path(output_path).with_suffix(""))

    # Professional diagram settings
    graph_attr = {
        "fontsize": "12",
        "fontname": "DejaVu Sans",
        "bgcolor": "white",
        "pad": "0.5",
        "nodesep": "0.8",
        "ranksep": "1.0"
    }

    node_attr = {
        "fontsize": "11",
        "fontname": "DejaVu Sans"
    }

    edge_attr = {
        "fontsize": "10",
        "fontname": "DejaVu Sans"
    }

    with Diagram(
        "Creative Wheel House - Infrastructure",
        filename=output_path,
        show=False,
        direction="LR",
        graph_attr=graph_attr,
        node_attr=node_attr,
        edge_attr=edge_attr
    ):

        with Cluster("Google Cloud Platform"):

            with Cluster("AI/ML Services"):
                vertex = VertexAI("Vertex AI\nGemini 2.5")

            with Cluster("Compute"):
                functions = Functions("Cloud Functions\nAPI Handlers")
                run = Run("Cloud Run\nServices")

            with Cluster("Data"):
                firestore = Firestore("Firestore\nDocuments")
                bq = BigQuery("BigQuery\nAnalytics")
                storage = GCS("Cloud Storage\nAssets")

            with Cluster("DevOps"):
                build = Build("Cloud Build\nCI/CD")

        # Connections with labels
        functions >> Edge(label="inference") >> vertex
        run >> Edge(label="queries") >> firestore
        run >> Edge(label="storage") >> storage
        firestore >> Edge(label="sync") >> bq
        build >> Edge(label="deploy") >> functions
        build >> Edge(label="deploy") >> run

    print(f"Generated: {output_path}.png")
    return f"{output_path}.png"


if __name__ == "__main__":
    output = sys.argv[1] if len(sys.argv) > 1 else None
    generate_architecture(output)
