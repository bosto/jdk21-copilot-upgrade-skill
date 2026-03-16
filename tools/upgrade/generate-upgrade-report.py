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
        "# Upgrade Report",
        "",
        "## Executive Summary",
        "- This customized report is tuned for Boot/Cloud + MQ + Redis + RDS + SQS migration work.",
        "",
        "## Key Signals",
        f"- javax references: {count(javax, 'javax.')}",
        f"- Swagger / Springfox legacy references: {count(legacy, 'springfox', 'swagger')}",
        f"- AWS SDK v1 references: {count(legacy, 'com.amazonaws') + count(middleware, 'amazonsqs')}",
        f"- IBM MQ references: {count(middleware, 'com.ibm.mq', 'mqqueueconnectionfactory')}",
        f"- Redis references: {count(middleware, 'redistemplate', 'lettuce', 'jedis')}",
        f"- RDS / JDBC references: {count(middleware, 'datasource', 'hikari', 'postgresql', 'mysql', 'mariadb')}",
        f"- SQS references: {count(middleware, 'sqsclient', 'amazonsqs', 'queuemessagingtemplate', 'sqstemplate')}",
        "",
        "## Recommended PR Order",
        "1. Java 21 + plugin + pipeline runtime",
        "2. Spring Boot / Cloud alignment",
        "3. Swagger → Springdoc and SDK cleanup",
        "4. MQ / Redis / RDS / SQS config and startup fixes",
        "5. javax → jakarta and remaining source refactors",
        "6. Validation, canary, rollback",
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
