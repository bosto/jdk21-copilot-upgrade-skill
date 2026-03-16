#!/usr/bin/env bash
set -euo pipefail

SEARCH_ROOT="${1:-.}"

echo "== Spring Security legacy API scan =="
grep -RIn --include="*.java" "WebSecurityConfigurerAdapter" "$SEARCH_ROOT" 2>/dev/null || true

echo
echo "== Swagger / Springfox scan =="
grep -RIn --include="*.java" --include="*.xml" --include="*.yml" --include="*.yaml" "springfox\|Docket\|EnableSwagger2" "$SEARCH_ROOT" 2>/dev/null || true

echo
echo "== AWS SDK v1 scan =="
grep -RIn --include="*.java" "com\.amazonaws\." "$SEARCH_ROOT" 2>/dev/null || true

echo
echo "== Internal / removed API suspects =="
grep -RIn --include="*.java" "sun\.\|com\.sun\.\|Unsafe\|javax\.xml\.bind\|JAXB" "$SEARCH_ROOT" 2>/dev/null || true
