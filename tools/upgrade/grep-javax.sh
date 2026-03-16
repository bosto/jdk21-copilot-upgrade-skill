#!/usr/bin/env bash
set -euo pipefail

echo "== javax import scan =="
grep -RIn --include="*.java" --include="*.kt" "import javax\." src || true

echo
echo "== javax validation / servlet / persistence usage =="
grep -RIn --include="*.java" --include="*.kt" "javax\.validation\|javax\.servlet\|javax\.persistence\|javax\.annotation" src || true
