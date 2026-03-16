#!/usr/bin/env python3
import json
import sys
from pathlib import Path

def main() -> int:
    if len(sys.argv) < 2:
        print("usage: summarize-report.py <path-to-text-report>", file=sys.stderr)
        return 1

    report = Path(sys.argv[1])
    if not report.exists():
        print(f"file not found: {report}", file=sys.stderr)
        return 2

    content = report.read_text(encoding="utf-8", errors="ignore")
    lines = [line.strip() for line in content.splitlines() if line.strip()]
    summary = {
        "report": str(report),
        "line_count": len(lines),
        "first_20_lines": lines[:20],
    }
    print(json.dumps(summary, indent=2, ensure_ascii=False))
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
