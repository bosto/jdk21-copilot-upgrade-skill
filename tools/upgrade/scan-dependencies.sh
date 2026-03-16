#!/usr/bin/env bash
set -e

echo "Scanning pom.xml for relevant dependencies"
grep -R "spring" pom.xml || true
grep -R "redis" pom.xml || true
grep -R "mq" pom.xml || true
grep -R "amazon" pom.xml || true