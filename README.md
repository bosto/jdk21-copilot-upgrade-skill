# JDK 21 Upgrade Copilot Skills（定制版）

这个仓库是一个 **JDK 8 → JDK 21 升级辅助工具箱**，面向典型企业 Java 应用的迁移场景：

- Spring Boot / Spring Cloud 版本对齐
- Swagger(Springfox) → Springdoc
- IBM MQ / Redis / RDS / SQS 中间件兼容性梳理
- `javax.*` → `jakarta.*` 改造
- Maven + Jenkins + Docker 运行时对齐

它的目标不是“一键升级”，而是帮助你 **快速盘点风险、生成升级线索、复用模板并组织分批次 PR**。

---

## 仓库能做什么

### 1) 评估升级风险（Assess）
通过脚本扫描依赖、`javax` 引用、遗留 API 和中间件使用，并输出报告。

- 输出目录：`.upgrade-output/`
- 关键产物：`.upgrade-output/upgrade-report.md`

### 2) 提供实现模板（Implement）
提供可直接参考/迁移的模板：

- `templates/maven/customized-service-pom.xml`
- `templates/config/application-jdk21-custom.yml`
- `templates/java/config/*.java`
- `templates/java/sqs/*.java`
- `templates/docker/Dockerfile.jdk21`
- `templates/jenkins/Jenkinsfile.jdk21`

### 3) 提供验证清单（Validate）
提供运行时检查、升级检查与中间件 smoke checklist，帮助上线前自检。

---

## 快速开始

### 前置条件

- JDK 21（建议本地和 CI 都统一到 21）
- Maven 3.8+
- Python 3（用于生成报告）
- Bash 环境

### 1. 生成升级评估报告

```bash
make skill-jdk21-assess
```

该命令会依次执行依赖扫描、`javax` 扫描、遗留 API 扫描、中间件扫描，并最终汇总报告。

### 2. 生成 Boot/Cloud 版本对齐矩阵

```bash
make skill-spring-boot-cloud-align
```

输出：`.upgrade-output/version-alignment.md`

### 3. 中间件兼容性专项扫描

```bash
make skill-middleware-compatibility-review
```

输出：`.upgrade-output/middleware-report.md`

### 4. 执行验证检查

```bash
make skill-jdk21-validate
```

会触发：

- `tools/upgrade/verify-runtime.sh`
- `tools/upgrade/run-upgrade-checks.sh`
- `tools/upgrade/check-docker-jenkins-runtime.sh`
- `tools/upgrade/middleware-smoke-template.sh`

---

## 推荐升级路径（建议按 PR 分批）

可参考：`docs/upgrade/custom-pr-plan.md`

1. Java 21 + Maven 插件 + Jenkins/Docker runtime 对齐
2. Spring Boot / Spring Cloud 版本族对齐
3. Swagger → Springdoc；SQS SDK 风格统一
4. MQ / Redis / RDS 配置与启动链路修复
5. `javax` → `jakarta` 与剩余源码改造
6. 验证、灰度、回滚说明

实施细节可见：`docs/upgrade/custom-implementation-runbook.md`

---

## 目录说明

- `skills/`：各类升级技能定义（assess / implement / validate 等）
- `tools/upgrade/`：扫描与报告脚本
- `tools/rewrite/`：源码改写工具（如 `rewrite-jakarta.py`）
- `templates/`：可复用配置/代码模板
- `docs/upgrade/`：升级 runbook、PR 计划、smoke 清单
- `sample-service/`、`sample-project/`：示例工程

---

## 常用命令速查

```bash
# 风险评估
make skill-jdk21-assess

# 实施参考提示（模板入口）
make skill-jdk21-implement

# 运行验证
make skill-jdk21-validate

# javax -> jakarta（预览）
make rewrite-jakarta-preview

# javax -> jakarta（应用到 sample-service）
make rewrite-jakarta

# 基于 upgrade-report 生成 PR 注释草稿
make generate-pr-comment
```

---

## 注意事项

- 本仓库偏向“迁移导航 + 模板沉淀”，不是替代业务回归测试。
- 中间件（MQ/Redis/RDS/SQS）升级需要结合你们的生产配置、网络与权限策略做实测。
- 建议把扫描结果与 `docs/upgrade/middleware-smoke-checklist.md` 一起纳入上线门禁。
