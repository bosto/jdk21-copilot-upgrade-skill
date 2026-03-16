#!/usr/bin/env python3
from pathlib import Path
import argparse
def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--input", required=True)
    p.add_argument("--output", required=True)
    a = p.parse_args()
    text = Path(a.input).read_text(encoding="utf-8", errors="ignore")
    body = "\\n".join([
        "# Middleware Compatibility Report",
        "",
        "## Focus Areas",
        "- IBM MQ TLS / cipher / listener init",
        "- Redis serializer and timeout",
        "- RDS driver / pool / SSL / timezone",
        "- SQS SDK style and client init",
        "",
        "## Raw Scan",
        "```text",
        text[:6000],
        "```"
    ])
    Path(a.output).write_text(body, encoding="utf-8")
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
