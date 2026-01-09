#!/usr/bin/env python3
"""
send-email.py - Send email via Resend API with PDF attachment

Usage:
    python3 send-email.py \
        --to "shelly@shellyfrank.com" \
        --cc "jeremy@intentsolutions.io" \
        --subject "Progress Update" \
        --body "Email body text" \
        --attachment "changelog.pdf"

API key is retrieved from `pass apis/resend-api-key` (GPG encrypted).
"""

import argparse
import base64
import subprocess
import sys
from pathlib import Path

try:
    import resend
except ImportError:
    print("Error: resend package not installed. Run: pip install resend", file=sys.stderr)
    sys.exit(1)


def get_api_key() -> str:
    """Retrieve Resend API key from pass password store."""
    try:
        result = subprocess.run(
            ["pass", "apis/resend-api-key"],
            capture_output=True,
            text=True,
            check=True
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"Error retrieving API key from pass: {e}", file=sys.stderr)
        sys.exit(1)
    except FileNotFoundError:
        print("Error: 'pass' command not found. Install password-store.", file=sys.stderr)
        sys.exit(1)


def read_attachment(filepath: str) -> tuple[str, str]:
    """Read file and return base64 encoded content with filename."""
    path = Path(filepath)
    if not path.exists():
        print(f"Error: Attachment not found: {filepath}", file=sys.stderr)
        sys.exit(1)

    with open(path, "rb") as f:
        content = base64.standard_b64encode(f.read()).decode("utf-8")

    return path.name, content


def send_email(
    to: list[str],
    cc: list[str],
    subject: str,
    body: str,
    attachment_path: str | None = None
) -> dict:
    """Send email via Resend API."""

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

    # Add attachment if provided
    if attachment_path:
        filename, content = read_attachment(attachment_path)
        params["attachments"] = [
            {
                "filename": filename,
                "content": content,
            }
        ]

    # Send
    try:
        response = resend.Emails.send(params)
        return response
    except Exception as e:
        print(f"Error sending email: {e}", file=sys.stderr)
        sys.exit(1)


def main():
    parser = argparse.ArgumentParser(
        description="Send email via Resend API with optional PDF attachment"
    )
    parser.add_argument(
        "--to",
        required=True,
        help="Primary recipient email address"
    )
    parser.add_argument(
        "--cc",
        default="",
        help="CC recipient(s), comma-separated"
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
        default=None,
        help="Path to PDF attachment"
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
        print("[TEST MODE] Redirecting email to jeremy@intentsolutions.io only")
    else:
        to_list = [args.to]
        cc_list = [addr.strip() for addr in args.cc.split(",") if addr.strip()]

    print(f"Sending email...")
    print(f"  To: {', '.join(to_list)}")
    if cc_list:
        print(f"  CC: {', '.join(cc_list)}")
    print(f"  Subject: {args.subject}")
    if args.attachment:
        print(f"  Attachment: {args.attachment}")

    # Send
    response = send_email(
        to=to_list,
        cc=cc_list,
        subject=args.subject,
        body=args.body,
        attachment_path=args.attachment
    )

    print(f"\nEmail sent successfully!")
    print(f"  Message ID: {response.get('id', 'unknown')}")

    return 0


if __name__ == "__main__":
    sys.exit(main())
