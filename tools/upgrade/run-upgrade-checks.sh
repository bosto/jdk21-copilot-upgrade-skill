#!/usr/bin/env bash
set -euo pipefail

echo "== Clean verify =="
./mvnw -U -ntp clean verify

echo
echo "== Spring Boot startup dry run hint =="
echo "Run your app with:"
echo "./mvnw spring-boot:run -Dspring-boot.run.profiles=local"
