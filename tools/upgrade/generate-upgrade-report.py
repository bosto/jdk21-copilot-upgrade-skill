#!/usr/bin/env python3
from pathlib import Path
import argparse

def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8", errors="ignore") if path.exists() else ""

def count(text: str, *needles: str) -> int:
    lower = text.lower()
    return sum(lower.count(n.lower()) for n in needles)

def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--dependency-report", required=True)
    p.add_argument("--javax-report", required=True)
    p.add_argument("--legacy-report", required=True)
    p.add_argument("--middleware-report", required=True)
    p.add_argument("--runtime-report", required=True)
    p.add_argument("--output", required=True)
    a = p.parse_args()
    dep = read_text(Path(a.dependency_report))
    javax = read_text(Path(a.javax_report))
    legacy = read_text(Path(a.legacy_report))
    middleware = read_text(Path(a.middleware_report))
    runtime = read_text(Path(a.runtime_report))
    lines = [
        "# Upgrade Report", "",
        "## Executive Summary",
        "- This report highlights likely hotspots in an enterprise JDK 8 → JDK 21 migration.",
        "- Use it for PR slicing, risk review, rollout planning, and rollback preparation.", "",
        "## Key Signals",
        f"- javax references: {count(javax, 'javax.')}",
        f"- Springfox / Swagger legacy references: {count(legacy, 'springfox', 'swagger')}",
        f"- AWS SDK v1 references: {count(legacy, 'com.amazonaws') + count(middleware, 'amazonsqs')}",
        f"- IBM MQ references: {count(middleware, 'com.ibm.mq', 'mqqueueconnectionfactory')}",
        f"- Redis references: {count(middleware, 'redistemplate', 'lettuce', 'jedis')}",
        f"- RDS/JDBC references: {count(middleware, 'datasource', 'hikari', 'postgresql', 'mysql', 'mariadb')}",
        f"- SQS references: {count(middleware, 'sqsclient', 'amazonsqs', 'queuemessagingtemplate', 'sqstemplate')}",
        "",
        "## Suggested PR Slices",
        "1. Build tooling + Java 21 baseline",
        "2. Spring family alignment + obsolete library replacement",
        "3. Middleware / SDK changes",
        "4. Source refactors and startup fixes",
        "5. Canary / rollback preparation",
        "",
        "## Runtime Hints",
        "```text",
        runtime[:2500],
        "```",
    ]
    Path(a.output).write_text("\\n".join(lines), encoding="utf-8")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
