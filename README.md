# JDK 21 Upgrade Copilot Skills

A full repository template for running a **JDK 8 → JDK 21** application upgrade with **GitHub Copilot-style skills**, repo instructions, prompt files, repeatable scripts, and CI checks.

This template is designed for Java services that may use:

- Spring Boot
- Spring Cloud
- Swagger / OpenAPI
- IBM MQ
- Redis
- RDS
- SQS

## What this repo gives you

- A **skill-like structure** for Copilot and other coding agents
- Upgrade prompts for assess / implement / code-fix / validate
- Dependency and code scanners
- `javax` → `jakarta` rewrite starter
- CI checks for upgrade drift
- Upgrade planning docs
- A sample Maven module to test the workflow

## Directory structure

```text
.github/
  copilot-instructions.md
  prompts/
  workflows/

skills/
  jdk21-assess/
  jdk21-implement/
  jdk21-code-fix/
  jdk21-validate/

tools/
  upgrade/
  rewrite/

docs/
  upgrade/

scripts/
sample-project/
Makefile
pom.xml
```

## Quick start

### 1. Assess
```bash
make skill-jdk21-assess
```

### 2. Implement plan
```bash
make skill-jdk21-implement
```

### 3. Validate environment
```bash
make skill-jdk21-validate
```

### 4. Run CI-style checks locally
```bash
make ci-check
```

## Suggested Copilot prompts

### Assess
```text
Use skill:jdk21-assess.
Analyze this repository for migrating from JDK 8 to JDK 21.
Focus on Spring Boot, Spring Cloud, Swagger, IBM MQ, Redis, RDS, and SQS.
Return dependency changes, code hotspots, risks, and migration phases.
```

### Implement
```text
Use skill:jdk21-implement.
Generate concrete pom.xml, configuration, and refactor steps for migrating this service to Java 21.
Prefer supported starters and remove obsolete libraries.
```

### Code fix
```text
Use skill:jdk21-code-fix.
Classify the current error into javax/jakarta migration, Spring Boot 3 API change, Swagger mismatch, AWS SDK mismatch, IBM MQ mismatch, or Java 21 incompatibility.
Provide a minimal fix and a cleaner long-term refactor.
```

### Validate
```text
Use skill:jdk21-validate.
Create a rollout-ready validation plan, including build checks, startup checks, integration checks, and rollback triggers.
```

## Notes

This repo is intentionally **tool-agnostic**:
- GitHub Copilot can use repo instructions and prompt files
- Claude Code can use the `skills/` folders as a discoverable catalog
- Cursor or other agents can use the same commands and docs
