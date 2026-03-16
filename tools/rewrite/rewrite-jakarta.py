#!/usr/bin/env python3
from pathlib import Path
import argparse

REPLACEMENTS = {
    "import javax.validation.": "import jakarta.validation.",
    "import javax.servlet.": "import jakarta.servlet.",
    "import javax.persistence.": "import jakarta.persistence.",
    "import javax.annotation.": "import jakarta.annotation.",
    "import javax.jms.": "import jakarta.jms.",
}

def process_file(path: Path, apply: bool) -> tuple[bool, str]:
    original = path.read_text(encoding="utf-8", errors="ignore")
    updated = original
    changed = False
    for old, new in REPLACEMENTS.items():
        if old in updated:
            updated = updated.replace(old, new)
            changed = True
    if changed and apply:
        path.write_text(updated, encoding="utf-8")
    return changed, str(path)

def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", required=True)
    parser.add_argument("--apply", action="store_true")
    args = parser.parse_args()

    root = Path(args.root)
    if not root.exists():
        print(f"root not found: {root}")
        return 1

    changed_files = []
    for path in root.rglob("*.java"):
        changed, file_name = process_file(path, args.apply)
        if changed:
            changed_files.append(file_name)

    print("Rewrite mode:", "apply" if args.apply else "preview")
    print("Changed files:", len(changed_files))
    for f in changed_files:
        print(f)
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
