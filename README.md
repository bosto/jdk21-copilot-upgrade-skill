# JDK 21 Upgrade Copilot Skills - Enhanced Edition

A production-oriented repository template for upgrading Java services from **JDK 8 → JDK 21** with **GitHub Copilot-style skills**, upgrade scripts, OpenRewrite support, CI checks, and middleware review playbooks.

## Designed for services using

- Spring Boot
- Spring Cloud
- Swagger / OpenAPI
- IBM MQ
- Redis
- RDS
- SQS
- Maven / Jenkins / Docker-based delivery pipelines

## What's new in this enhanced edition

- More granular skills:
  - `skill:jdk21-assess`
  - `skill:jdk21-implement`
  - `skill:jdk21-code-fix`
  - `skill:jdk21-validate`
  - `skill:spring-boot-cloud-align`
  - `skill:middleware-compatibility-review`
- OpenRewrite starter configuration for framework and `javax`→`jakarta` migration
- PR comment generator from local scan output
- GitHub Actions workflow that uploads artifacts and prepares a summary
- More detailed docs:
  - PR slicing plan
  - rollback and canary checklist
  - middleware compatibility worksheet
  - Jenkins / Docker runtime alignment checklist
- Better sample project with intentionally legacy dependencies and code

## Quick start

```bash
make skill-jdk21-assess
make skill-jdk21-implement
make skill-jdk21-validate
make ci-check
make rewrite-jakarta-preview
```
