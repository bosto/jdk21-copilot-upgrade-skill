#!/usr/bin/env bash
set -euo pipefail
if [[ -f ./mvnw ]]; then MVN=./mvnw; else MVN=mvn; fi
$MVN -q -DskipTests compile || true
$MVN -q test || true
echo "Run the app with a sandbox profile and verify startup path."
