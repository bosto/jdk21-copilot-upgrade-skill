#!/usr/bin/env bash
set -euo pipefail
if [[ -f ./mvnw ]]; then MVN=./mvnw; else MVN=mvn; fi
$MVN -q -DskipTests compile || true
echo
$MVN -q test || true
echo
echo "Validate actuator, DB, Redis, MQ, SQS startup paths in a sandbox profile."
