# JDK 21 Upgrade Copilot Skills - Enterprise Edition

这是一个更贴近真实企业 Java 微服务升级项目的模板仓库，目标是帮助你把 **JDK 8 → JDK 21** 升级过程拆成可执行、可审查、可回滚的工作流。

## 重点增强

这一版相比增强版，继续往前推了一层：

- 增加了 **更贴近真实项目的 Maven 升级骨架**
- 增加了 **Spring Boot / Spring Cloud / Springdoc / IBM MQ / Redis / RDS / SQS** 的模板
- 增加了 **application.yml 升级模板**
- 增加了 **OpenRewrite 配置模板**
- 增加了 **GitHub Actions 企业版示例**
- 增加了 **升级实施 Runbook**
- 增加了 **风险登记册**
- 增加了 **升级前后 pom 对照模板**
- 增加了 **中间件专项验证脚本骨架**

## 适用场景

适合这种服务：

- Java 8 老服务
- Spring Boot 2.x / Spring Cloud 老版本
- Swagger / Springfox
- IBM MQ
- Redis
- PostgreSQL / MySQL / MariaDB / RDS
- SQS
- Jenkins + Docker + Maven

## 推荐使用方式

```bash
make skill-jdk21-assess
make skill-spring-boot-cloud-align
make skill-middleware-compatibility-review
make generate-pr-comment
```

## 新增 templates 目录

- `templates/maven/enterprise-service-pom.xml`
- `templates/maven/pom-before-after-example.md`
- `templates/maven/openrewrite-pom-snippet.xml`
- `templates/config/application-jdk21-template.yml`
- `templates/config/application-middleware-checklist.yml`
- `templates/github-actions/jdk21-upgrade-enterprise-check.yml`

## 你最可能会先看的文件

- `docs/upgrade/enterprise-runbook.md`
- `docs/upgrade/risk-register.md`
- `templates/maven/enterprise-service-pom.xml`
- `templates/config/application-jdk21-template.yml`
