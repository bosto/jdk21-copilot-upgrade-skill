#!/usr/bin/env python3
from pathlib import Path
import argparse

def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--input", required=True)
    p.add_argument("--output", required=True)
    a = p.parse_args()
    text = Path(a.input).read_text(encoding="utf-8", errors="ignore")
    out = "\n".join([
        "# Middleware Compatibility Report", "",
        "## Review Notes",
        "- Check compatibility with Java 21 and the chosen Spring family.",
        "- Check serializers, TLS/SSL settings, pool settings, listener initialization, and startup order.", "",
        "## Raw Scan", "```text", text[:6000], "```"
    ])
    Path(a.output).write_text(out, encoding="utf-8")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
