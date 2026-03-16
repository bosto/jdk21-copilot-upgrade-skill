#!/usr/bin/env bash
set -euo pipefail

echo "== Java / Maven settings =="
grep -R "<java.version>" pom.xml . || true
grep -R "maven-compiler-plugin" pom.xml . || true
grep -R "spring-boot" pom.xml . || true
grep -R "spring-cloud" pom.xml . || true

echo
echo "== Potentially relevant dependencies =="
grep -R "springfox\|springdoc\|swagger\|com.ibm.mq\|redis\|lettuce\|jedis\|spring-data-redis\|aws-java-sdk\|software.amazon.awssdk\|spring-cloud-aws\|mysql\|postgresql\|mariadb" pom.xml . || true

echo
echo "== Surefire / Failsafe / JaCoCo / Docker hints =="
grep -R "maven-surefire-plugin\|maven-failsafe-plugin\|jacoco-maven-plugin\|dockerfile\|jib-maven-plugin\|spring-boot-maven-plugin" pom.xml . || true
