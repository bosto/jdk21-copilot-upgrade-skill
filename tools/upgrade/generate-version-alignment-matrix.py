#!/usr/bin/env python3
from pathlib import Path
import argparse

CONTENT = """# Version Alignment Matrix

| Area | Current | Candidate Target | Notes |
|---|---|---|---|
| Java runtime | 8 | 21 | Update CI, Docker, Jenkins too |
| Maven compiler plugin | TBD | Java 21-capable | Use release=21 |
| Surefire / Failsafe | TBD | Java 21-capable | Validate tests in CI |
| Spring Boot | TBD | supported 3.x line | Must match chosen Cloud line |
| Spring Cloud | TBD | matching supported line | Avoid cross-family mismatch |
| Swagger/OpenAPI | TBD | supported OpenAPI approach | Remove legacy Swagger integration |
| IBM MQ | TBD | supported client line | Validate JMS package and TLS assumptions |
| Redis | TBD | supported starter/client | Validate serializers and timeouts |
| RDS driver | TBD | supported driver line | Validate pool and SSL/timezone |
| SQS SDK | TBD | supported SDK line | Avoid mixed SDK styles |
"""
def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--output", required=True)
    a = p.parse_args()
    Path(a.output).parent.mkdir(parents=True, exist_ok=True)
    Path(a.output).write_text(CONTENT, encoding="utf-8")
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
