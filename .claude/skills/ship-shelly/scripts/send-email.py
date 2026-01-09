#!/usr/bin/env python3
"""
send-email.py - Send email via Resend API with multiple attachments

Enterprise-grade email delivery for Creative Wheel House progress reports.
Supports multiple PDF attachments for session reports and visual changelogs.

Usage:
    # Single attachment
    python3 send-email.py \
        --to "shelly@shellyfrank.com" \
        --cc "jeremy@intentsolutions.io" \
        --subject "Progress Update" \
        --body "Email body text" \
        --attachment "changelog.pdf"

    # Multiple attachments
    python3 send-email.py \
        --to "shelly@shellyfrank.com" \
        --cc "jeremy@intentsolutions.io" \
        --subject "Progress Update" \
        --body "Email body text" \
        --attachment "changelog-2026-01-09.pdf" \
        --attachment "GRAPHIC-CHANGELOG.pdf"

    # Test mode (sends to Jeremy only)
    python3 send-email.py --test \
        --subject "Progress Update" \
        --body "Email body text" \
        --attachment "changelog.pdf"

API key is retrieved from project .env file (RESEND_API_KEY) or environment variable.
"""

import argparse
import base64
import os
import subprocess
import sys
from pathlib import Path

try:
    import resend
except ImportError:
    print("Error: resend package not installed. Run: pip install resend", file=sys.stderr)
    sys.exit(1)


def load_env_file(env_path: Path) -> dict:
    """Load environment variables from a .env file."""
    env_vars = {}
    if env_path.exists():
        with open(env_path) as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith('#') and '=' in line:
                    key, _, value = line.partition('=')
                    # Remove quotes if present
                    value = value.strip().strip('"').strip("'")
                    env_vars[key.strip()] = value
    return env_vars


def get_api_key() -> str:
    """Retrieve Resend API key from multiple sources.

    Order of precedence:
    1. RESEND_API_KEY environment variable
    2. Project .env file (creative-wheel-house/.env)
    3. pass password store (apis/resend-api-key)
    """
    # 1. Check environment variable
    env_key = os.environ.get("RESEND_API_KEY")
    if env_key and not env_key.startswith("re_YOUR"):
        return env_key.strip()

    # 2. Check project .env file
    script_dir = Path(__file__).parent.resolve()
    project_root = script_dir.parent.parent.parent.parent  # Up to creative-wheel-house
    env_file = project_root / ".env"
    if env_file.exists():
        env_vars = load_env_file(env_file)
        if "RESEND_API_KEY" in env_vars and not env_vars["RESEND_API_KEY"].startswith("re_YOUR"):
            return env_vars["RESEND_API_KEY"]

    # 3. Try pass password store
    try:
        result = subprocess.run(
            ["pass", "apis/resend-api-key"],
            capture_output=True,
            text=True,
            check=True
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        stderr = e.stderr if e.stderr else ""
        # Check for common GPG issues
        if "pinentry" in stderr.lower() or "no pinentry" in stderr.lower():
            print("Error: GPG pinentry not available (non-interactive terminal)", file=sys.stderr)
            print("\nSolutions:", file=sys.stderr)
            print("  1. Set RESEND_API_KEY environment variable:", file=sys.stderr)
            print("     export RESEND_API_KEY=$(pass apis/resend-api-key)", file=sys.stderr)
            print("  2. Create .env file in project root:", file=sys.stderr)
            print(f"     echo 'RESEND_API_KEY=re_xxx' > {project_root}/.env", file=sys.stderr)
            sys.exit(1)
        print(f"Error retrieving API key from pass: {e}", file=sys.stderr)
        sys.exit(1)
    except FileNotFoundError:
        print("Error: No API key found.", file=sys.stderr)
        print("\nProvide RESEND_API_KEY via:", file=sys.stderr)
        print("  1. Environment variable: export RESEND_API_KEY=re_xxx", file=sys.stderr)
        print(f"  2. Project .env file: {project_root}/.env", file=sys.stderr)
        print("  3. pass password store: pass insert apis/resend-api-key", file=sys.stderr)
        sys.exit(1)


def read_attachment(filepath: str) -> dict:
    """Read file and return attachment dict for Resend API."""
    path = Path(filepath)
    if not path.exists():
        print(f"Error: Attachment not found: {filepath}", file=sys.stderr)
        sys.exit(1)

    with open(path, "rb") as f:
        content = base64.standard_b64encode(f.read()).decode("utf-8")

    # Get file size for reporting
    size_kb = path.stat().st_size / 1024

    return {
        "filename": path.name,
        "content": content,
        "size_kb": size_kb
    }


def send_email(
    to: list[str],
    cc: list[str],
    subject: str,
    body: str,
    attachment_paths: list[str] | None = None
) -> dict:
    """Send email via Resend API with optional multiple attachments."""

    # Configure API key
    resend.api_key = get_api_key()

    # Build email params
    params = {
        "from": "Jeremy Longshore <jeremy@intentsolutions.io>",
        "to": to,
        "subject": subject,
        "text": body,
    }

    if cc:
        params["cc"] = cc

    # Add attachments if provided
    if attachment_paths:
        attachments = []
        for path in attachment_paths:
            att = read_attachment(path)
            attachments.append({
                "filename": att["filename"],
                "content": att["content"],
            })
        params["attachments"] = attachments

    # Send
    try:
        response = resend.Emails.send(params)
        return response
    except Exception as e:
        print(f"Error sending email: {e}", file=sys.stderr)
        sys.exit(1)


def main():
    parser = argparse.ArgumentParser(
        description="Send email via Resend API with multiple PDF attachments",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Production: Send to Shelly with multiple attachments
  python3 send-email.py \\
      --to "shelly@shellyfrank.com" \\
      --cc "jeremy@intentsolutions.io" \\
      --subject "Creative Wheel House Progress - 2026-01-09" \\
      --body "Hey Shelly, ..." \\
      --attachment changelog-2026-01-09.pdf \\
      --attachment GRAPHIC-CHANGELOG.pdf

  # Test mode: Send to Jeremy only
  python3 send-email.py --test \\
      --subject "Progress Update" \\
      --body "Test email body" \\
      --attachment changelog.pdf
"""
    )
    parser.add_argument(
        "--to",
        default="shelly@shellyfrank.com",
        help="Primary recipient email address (default: shelly@shellyfrank.com)"
    )
    parser.add_argument(
        "--cc",
        default="jeremy@intentsolutions.io",
        help="CC recipient(s), comma-separated (default: jeremy@intentsolutions.io)"
    )
    parser.add_argument(
        "--subject",
        required=True,
        help="Email subject line"
    )
    parser.add_argument(
        "--body",
        required=True,
        help="Email body text"
    )
    parser.add_argument(
        "--attachment",
        action="append",
        dest="attachments",
        default=[],
        help="Path to attachment (can be specified multiple times)"
    )
    parser.add_argument(
        "--test",
        action="store_true",
        help="Test mode: send only to jeremy@intentsolutions.io"
    )

    args = parser.parse_args()

    # Parse recipients - in test mode, only send to Jeremy
    if args.test:
        to_list = ["jeremy@intentsolutions.io"]
        cc_list = []
        print("=" * 60)
        print("TEST MODE - Email will be sent to jeremy@intentsolutions.io only")
        print("=" * 60)
    else:
        to_list = [args.to]
        cc_list = [addr.strip() for addr in args.cc.split(",") if addr.strip()]

    # Display email details
    print("\nSending email...")
    print(f"  To: {', '.join(to_list)}")
    if cc_list:
        print(f"  CC: {', '.join(cc_list)}")
    print(f"  Subject: {args.subject}")

    # Display attachments
    if args.attachments:
        print(f"  Attachments ({len(args.attachments)}):")
        for att_path in args.attachments:
            path = Path(att_path)
            if path.exists():
                size_kb = path.stat().st_size / 1024
                print(f"    - {path.name} ({size_kb:.1f} KB)")
            else:
                print(f"    - {path.name} (NOT FOUND)")

    print()

    # Send
    response = send_email(
        to=to_list,
        cc=cc_list,
        subject=args.subject,
        body=args.body,
        attachment_paths=args.attachments if args.attachments else None
    )

    # Success output
    print("=" * 60)
    print("EMAIL SENT SUCCESSFULLY")
    print("=" * 60)
    print(f"  Message ID: {response.get('id', 'unknown')}")
    print(f"  Recipients: {', '.join(to_list)}")
    if cc_list:
        print(f"  CC: {', '.join(cc_list)}")
    print(f"  Attachments: {len(args.attachments)}")
    print("=" * 60)

    return 0


if __name__ == "__main__":
    sys.exit(main())
