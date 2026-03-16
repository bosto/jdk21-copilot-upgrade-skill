#!/usr/bin/env python3
from pathlib import Path
import argparse
def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--report", required=True)
    p.add_argument("--output", required=True)
    a = p.parse_args()
    report = Path(a.report).read_text(encoding="utf-8", errors="ignore")
    body = "\\n".join([
        "## JDK 21 Upgrade Assessment", "",
        "- Review attached artifacts",
        "- Check javax, legacy API, middleware, and runtime findings", "",
        "### Excerpt", "```text", report[:2500], "```"
    ])
    Path(a.output).write_text(body, encoding="utf-8")
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
