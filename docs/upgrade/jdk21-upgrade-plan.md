# JDK 8 to JDK 21 Upgrade Plan

## Objective
Migrate the service from JDK 8 to JDK 21 and align the app stack with a supported Spring Boot 3.x line.

## Scope
- JDK runtime
- Spring Boot / Spring Cloud
- Swagger/OpenAPI
- IBM MQ
- Redis
- RDS driver + datasource validation
- SQS integration
- build plugins
- CI/CD runtime images
- startup and integration validation

## Suggested PR sequence
1. Build + version alignment
2. javax/jakarta and framework code changes
3. middleware integration updates
4. validation, canary, rollback prep

## Risks
- javax to jakarta package migration
- Spring Cloud / Boot mismatch
- Swagger library replacement
- AWS SDK v1 to v2 migration
- IBM MQ TLS/FIPS/cipher config behavior changes
- CI runtime not actually using Java 21
