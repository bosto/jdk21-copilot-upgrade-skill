# jdk21-copilot-upgrade-skill-repo

A production-oriented GitHub Copilot "skill-like" repository template for migrating a Java service from **JDK 8 to JDK 21** while upgrading related framework and middleware dependencies.

## Target scenario

This template is designed for services using some or all of:

- Spring Boot
- Spring Cloud
- Swagger / OpenAPI
- IBM MQ
- Redis
- RDS
- SQS

It helps Copilot behave more like a repeatable upgrade assistant by combining:

- repo instructions
- prompt files
- one-command scripts
- structured documents

## Repository layout

```text
.github/
  copilot-instructions.md
  prompts/
tools/
  upgrade/
docs/
  upgrade/
scripts/
Makefile
pom.xml
```

## Recommended target line

- Java 21
- Spring Boot 3.4.x
- Spring Cloud 2024.0.x
- Spring Cloud AWS 3.3.x
- springdoc-openapi 2.8.x
- AWS SDK v2 for SQS
- IBM MQ 9.4.x client line

## How to use with Copilot

Ask Copilot with one of these instructions:

### Assess
```text
Use skill:jdk21-assess.
Assess this repo for migration from JDK 8 to JDK 21.
Focus on Spring Boot, Spring Cloud, Swagger, IBM MQ, Redis, RDS, and SQS.
Produce target versions, dependency changes, code hotspots, and risks.
```

### Implement
```text
Use skill:jdk21-implement.
Generate a production-usable migration template for Java 21 and Spring Boot 3.4.
Replace old Swagger integration with springdoc.
Recommend AWS SDK v2 for SQS.
Highlight IBM MQ migration risks.
```

### Fix build/runtime errors
```text
Use skill:jdk21-code-fix.
The project fails after migration.
Classify the error into javax/jakarta, Spring Boot 3 API change, Swagger mismatch, AWS SDK migration, or IBM MQ config mismatch.
Provide minimal fix and clean refactor.
```

### Validate
```text
Use skill:jdk21-validate.
Generate build validation, startup validation, middleware validation, and rollout checklist for the JDK 21 migration.
```

## Local commands

```bash
make skill-jdk21-assess
make skill-jdk21-validate
```

## Notes

- This repo includes a sample `pom.xml` and upgrade docs to use as scaffolding.
- You should still adapt exact versions to your estate and internal platform constraints.
- IBM MQ TLS/FIPS/cipher compatibility should be validated explicitly when moving to Java 21.
