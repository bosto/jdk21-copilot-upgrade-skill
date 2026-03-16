# JDK21 Copilot Upgrade Skill Repo

Template repository to help migrate enterprise Java services from **JDK 8 → JDK 21** with Copilot-assisted workflows.

## Target stack

- Java 21
- Spring Boot 3.4.x
- Spring Cloud 2024.0.x
- springdoc-openapi
- AWS SDK v2 (SQS)
- Redis
- RDS
- IBM MQ

## Usage

Run assessment:

```bash
make skill-jdk21-assess
```

Run validation:

```bash
make skill-jdk21-validate
```

Use with GitHub Copilot:

```
Use skill:jdk21-assess to analyze this repository for upgrading from JDK 8 to JDK 21.
```