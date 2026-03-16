#!/usr/bin/env bash
set -euo pipefail

echo "== Runtime versions =="
java -version
mvn -version

echo
echo "== Environment sanity =="
echo "JAVA_HOME=${JAVA_HOME:-unset}"
echo "MAVEN_OPTS=${MAVEN_OPTS:-unset}"
