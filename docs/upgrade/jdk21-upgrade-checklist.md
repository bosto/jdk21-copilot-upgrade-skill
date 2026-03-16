# JDK 21 Upgrade Checklist

## Phase 1 - Baseline
- [ ] capture current branch and release tag
- [ ] export dependency tree
- [ ] identify current Spring Boot / Spring Cloud versions
- [ ] identify all middleware integrations
- [ ] identify Docker/Jenkins/build image Java version

## Phase 2 - Version Alignment
- [ ] upgrade parent pom to Spring Boot 3.4.x
- [ ] align Spring Cloud to 2024.0.x
- [ ] align Spring Cloud AWS to 3.3.x if used
- [ ] replace springfox with springdoc-openapi
- [ ] move AWS SDK usages toward v2 where applicable
- [ ] verify IBM MQ client line and config assumptions

## Phase 3 - Code Migration
- [ ] javax -> jakarta changes
- [ ] Spring Security migration if legacy style exists
- [ ] validation annotations package changes
- [ ] servlet / filter / interceptor package changes
- [ ] remove deprecated APIs
- [ ] fix reflection / encapsulation issues

## Phase 4 - Validation
- [ ] clean build
- [ ] unit tests
- [ ] integration tests
- [ ] startup test
- [ ] Redis validation
- [ ] RDS connectivity validation
- [ ] MQ connectivity validation
- [ ] SQS client validation

## Phase 5 - Rollout
- [ ] canary
- [ ] rollback trigger defined
- [ ] metrics and logs dashboard ready
- [ ] post-release smoke tests ready
