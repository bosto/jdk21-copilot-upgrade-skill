# Custom Implementation Runbook

## Phase 1 - Baseline
- 导出当前 pom 和 dependency tree
- 确认 Java / Maven / Jenkins / Docker 运行时
- 跑 assessment，生成 upgrade-report

## Phase 2 - Build and Framework
- 先升级 Java / compiler / surefire / pipeline runtime
- 再升级 Spring Boot / Spring Cloud
- 再替换 Swagger(Springfox → Springdoc)

## Phase 3 - Middleware
- MQ：检查 client line、TLS/cipher、listener / JMS package
- Redis：检查 serializer、timeout、读写兼容
- RDS：检查 driver、pool、SSL、timezone
- SQS：检查 SDK v1 → v2 或统一抽象层

## Phase 4 - Source Refactor
- javax → jakarta
- Spring config / validation / servlet 相关 API 改造

## Phase 5 - Validation
- build / test
- actuator / startup
- middleware smoke checks
- canary
- rollback
