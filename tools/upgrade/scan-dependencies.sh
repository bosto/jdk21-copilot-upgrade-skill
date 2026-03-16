#!/usr/bin/env bash
set -euo pipefail

SEARCH_ROOT="${1:-.}"

echo "== Java / Maven settings =="
grep -R "<java.version>" "$SEARCH_ROOT" 2>/dev/null || true
grep -R "maven-compiler-plugin" "$SEARCH_ROOT" 2>/dev/null || true
grep -R "maven-surefire-plugin" "$SEARCH_ROOT" 2>/dev/null || true
grep -R "spring-boot" "$SEARCH_ROOT" 2>/dev/null || true
grep -R "spring-cloud" "$SEARCH_ROOT" 2>/dev/null || true

echo
echo "== Relevant dependencies =="
grep -R "springfox\|springdoc\|swagger\|com.ibm.mq\|redis\|lettuce\|jedis\|spring-data-redis\|aws-java-sdk\|software.amazon.awssdk\|spring-cloud-aws\|postgresql\|mysql\|mariadb" "$SEARCH_ROOT" 2>/dev/null || true

echo
echo "== Build / packaging hints =="
grep -R "jacoco-maven-plugin\|maven-failsafe-plugin\|jib-maven-plugin\|spring-boot-maven-plugin\|dockerfile" "$SEARCH_ROOT" 2>/dev/null || true
