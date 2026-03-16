#!/usr/bin/env bash
set -euo pipefail

echo "== Runtime versions =="
java -version
echo
mvn -version || true

echo
echo "== Environment =="
echo "JAVA_HOME=${JAVA_HOME:-unset}"
echo "MAVEN_OPTS=${MAVEN_OPTS:-unset}"
