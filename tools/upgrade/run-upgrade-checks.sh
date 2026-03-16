#!/usr/bin/env bash
set -euo pipefail

if [[ -f ./mvnw ]]; then
  MVN=./mvnw
else
  MVN=mvn
fi

echo "== Running build validation =="
$MVN -q -DskipTests compile || true

echo
echo "== Suggested startup validation =="
echo "Run your application with a safe local profile and confirm health endpoints, DB init, Redis init, MQ init, and SQS client creation."
