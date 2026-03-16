# Copilot Upgrade Skills

This repository provides a set of reusable "skills" to guide Copilot when performing a JDK8 → JDK21 migration.

## skill:jdk21-assess

Scan repository for:

- javax usage
- springfox usage
- AWS SDK v1 usage
- Spring Boot version

Commands:

make skill-jdk21-assess

## skill:jdk21-validate

Validate:

- Java runtime
- Maven build
- integration assumptions

Commands:

make skill-jdk21-validate