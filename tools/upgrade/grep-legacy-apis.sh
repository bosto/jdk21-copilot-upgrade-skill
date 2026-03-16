#!/usr/bin/env bash
set -euo pipefail

echo "== Spring Security legacy API scan =="
grep -RIn --include="*.java" "WebSecurityConfigurerAdapter" src || true

echo
echo "== Swagger / Springfox scan =="
grep -RIn --include="*.java" --include="*.xml" --include="*.yml" "springfox\|Docket\|EnableSwagger2" src . || true

echo
echo "== AWS SDK v1 scan =="
grep -RIn --include="*.java" "com\.amazonaws\." src || true

echo
echo "== Illegal reflective access / removed JDK APIs suspects =="
grep -RIn --include="*.java" "sun\.\|com\.sun\.\|Unsafe\|javax\.xml\.bind\|JAXB" src || true
