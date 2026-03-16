#!/usr/bin/env bash
set -euo pipefail
SEARCH_ROOT="${1:-.}"
echo "== Dockerfile Java runtime hints =="
grep -RIn --include="Dockerfile" "FROM " "$SEARCH_ROOT" 2>/dev/null || true
grep -RIn --include="Dockerfile" "java" "$SEARCH_ROOT" 2>/dev/null || true
echo
echo "== Jenkins runtime hints =="
grep -RIn --include="Jenkinsfile" "jdk\|java\|mvn\|maven" "$SEARCH_ROOT" 2>/dev/null || true
