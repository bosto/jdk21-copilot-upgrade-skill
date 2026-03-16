# JDK 8 → JDK 21 Upgrade Plan

## Objective
Upgrade the service runtime, framework stack, middleware libraries, and build pipeline to a Java 21-compatible state.

## Suggested phases

### Phase 1 - Baseline and assessment
- inventory frameworks and middleware
- export dependency tree
- inspect CI, Docker, and runtime image Java version
- scan for `javax`, legacy Swagger, legacy AWS SDK, and internal JDK APIs

### Phase 2 - Build and framework alignment
- update Java version
- update Maven compiler / surefire / failsafe / jacoco
- align Spring Boot / Spring Cloud family
- remove obviously obsolete libraries

### Phase 3 - Source changes
- `javax` → `jakarta`
- validation, servlet, persistence, annotation package updates
- security configuration updates
- Swagger / OpenAPI config updates
- SDK / middleware API updates

### Phase 4 - Integration validation
- DB connectivity
- Redis serialization and health
- MQ initialization and messaging path
- SQS client init / send / receive path
- actuator / health / smoke tests

### Phase 5 - Rollout
- canary release
- log / metric watch window
- rollback triggers
- post-release regression checklist
