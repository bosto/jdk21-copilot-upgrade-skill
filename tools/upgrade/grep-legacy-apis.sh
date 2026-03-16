#!/usr/bin/env bash
set -euo pipefail
SEARCH_ROOT="${1:-.}"
grep -RIn --include="*.java" "WebSecurityConfigurerAdapter" "$SEARCH_ROOT" 2>/dev/null || true
grep -RIn --include="*.java" --include="*.xml" --include="*.yml" --include="*.yaml" "springfox\|Docket\|EnableSwagger2" "$SEARCH_ROOT" 2>/dev/null || true
grep -RIn --include="*.java" "com\.amazonaws\." "$SEARCH_ROOT" 2>/dev/null || true
