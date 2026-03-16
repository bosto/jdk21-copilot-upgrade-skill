#!/usr/bin/env bash
set -euo pipefail
SEARCH_ROOT="${1:-.}"
grep -RIn --include="Dockerfile" "FROM " "$SEARCH_ROOT" 2>/dev/null || true
grep -RIn --include="Jenkinsfile" "jdk\|java\|mvn\|maven" "$SEARCH_ROOT" 2>/dev/null || true
