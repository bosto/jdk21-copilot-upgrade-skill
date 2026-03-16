# Risk Register

| ID | Risk | Impact | Mitigation |
|---|---|---|---|
| C1 | javax→jakarta 漏改 | 编译或启动失败 | 扫描 + rewrite + review |
| C2 | Spring Boot / Cloud 不匹配 | 启动失败 | 先做对齐 PR |
| C3 | Swagger 旧配置失效 | 文档不可用 | 改用 springdoc |
| C4 | MQ TLS/cipher 变化 | MQ 链路失败 | sandbox 专项验证 |
| C5 | Redis serializer 变化 | 缓存兼容性问题 | read/write smoke |
| C6 | RDS driver/pool 变化 | DB 初始化失败 | startup/query smoke |
| C7 | SQS SDK 风格混用 | 消息发送/消费异常 | 统一 v2 风格 |
| C8 | Jenkins / Docker 仍用旧 JDK | pipeline/runtime 假成功 | runtime checks |
