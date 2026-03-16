#!/usr/bin/env python3
from pathlib import Path
import argparse

def read_text(path: Path) -> str:
    if not path.exists():
        return ""
    return path.read_text(encoding="utf-8", errors="ignore")

def count_hits(text: str, needle: str) -> int:
    return text.count(needle)

def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--dependency-report", required=True)
    parser.add_argument("--javax-report", required=True)
    parser.add_argument("--legacy-report", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()

    dep = read_text(Path(args.dependency_report))
    javax = read_text(Path(args.javax_report))
    legacy = read_text(Path(args.legacy_report))

    sections = []
    sections.append("# Upgrade Report")
    sections.append("")
    sections.append("## Executive Summary")
    sections.append("- This report summarizes likely migration hotspots for a JDK 8 → JDK 21 upgrade.")
    sections.append("- Treat this as an input to planning, not as a final approval artifact.")
    sections.append("")
    sections.append("## Signals Detected")
    sections.append(f"- javax references: {count_hits(javax, 'javax')}")
    sections.append(f"- springfox/swagger legacy references: {count_hits(legacy.lower(), 'springfox') + count_hits(legacy.lower(), 'swagger')}")
    sections.append(f"- AWS SDK v1 references: {count_hits(legacy, 'com.amazonaws')}")
    sections.append(f"- Spring Security legacy references: {count_hits(legacy, 'WebSecurityConfigurerAdapter')}")
    sections.append(f"- IBM MQ references: {count_hits(dep.lower(), 'com.ibm.mq')}")
    sections.append("")
    sections.append("## Recommended Next Steps")
    sections.append("1. Align Java runtime and build plugins with Java 21.")
    sections.append("2. Align framework versions in a dedicated PR.")
    sections.append("3. Replace obsolete Swagger and SDK integrations.")
    sections.append("4. Migrate `javax` imports to `jakarta` where required.")
    sections.append("5. Validate middleware startup and rollout safety.")
    sections.append("")
    sections.append("## Raw Inputs")
    sections.append("### Dependency Scan")
    sections.append("```text")
    sections.append(dep[:4000])
    sections.append("```")
    sections.append("")
    sections.append("### javax Scan")
    sections.append("```text")
    sections.append(javax[:4000])
    sections.append("```")
    sections.append("")
    sections.append("### Legacy API Scan")
    sections.append("```text")
    sections.append(legacy[:4000])
    sections.append("```")

    Path(args.output).write_text("\n".join(sections), encoding="utf-8")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
