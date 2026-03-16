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

def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--root", required=True)
    p.add_argument("--apply", action="store_true")
    a = p.parse_args()
    root = Path(a.root)
    changed = []
    for path in root.rglob("*.java"):
        text = path.read_text(encoding="utf-8", errors="ignore")
        new = text
        for old, rep in REPLACEMENTS.items():
            new = new.replace(old, rep)
        if new != text:
            changed.append(str(path))
            if a.apply:
                path.write_text(new, encoding="utf-8")
    print("mode:", "apply" if a.apply else "preview")
    print("changed_files:", len(changed))
    for c in changed:
        print(c)
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
