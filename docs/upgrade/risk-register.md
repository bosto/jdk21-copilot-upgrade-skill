# Risk Register

| ID | Risk | Impact | Mitigation |
|---|---|---|---|
| R1 | javax→jakarta 迁移遗漏 | 编译失败 / 启动失败 | 扫描 + rewrite + review |
| R2 | Spring Boot / Cloud 版本不匹配 | 启动失败 | 先做 version alignment |
| R3 | Swagger 旧集成不可用 | 文档接口失败 | 替换为 supported OpenAPI |
| R4 | IBM MQ TLS/cipher 配置不兼容 | 消息链路失败 | 专项验证 |
| R5 | Redis serializer 行为变化 | 缓存读写异常 | sandbox 验证 |
| R6 | RDS driver / pool 行为变化 | 数据库连接异常 | startup + query smoke |
| R7 | SQS SDK 混用 | 消费/发送异常 | 统一 SDK 风格 |
| R8 | Jenkins / Docker 仍使用旧 JDK | pipeline/runtime 假成功 | runtime hints 检查 |
