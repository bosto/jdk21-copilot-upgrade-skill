#!/usr/bin/env bash
set -euo pipefail
SEARCH_ROOT="${1:-.}"
echo "== javax import scan =="
grep -RIn --include="*.java" --include="*.kt" "import javax\." "$SEARCH_ROOT" 2>/dev/null || true
echo
echo "== javax package usage =="
grep -RIn --include="*.java" --include="*.kt" "javax\.validation\|javax\.servlet\|javax\.persistence\|javax\.annotation\|javax\.jms" "$SEARCH_ROOT" 2>/dev/null || true
