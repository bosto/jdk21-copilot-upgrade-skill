# Compatibility Matrix

Fill in the **Current** column from your real project before using this as a sign-off artifact.

| Area | Current | Target | Notes |
|---|---|---|---|
| Java | 8 | 21 | Runtime and compiler upgrade |
| Spring Boot | TBD | 3.x supported line | Validate exact alignment with your platform |
| Spring Cloud | TBD | matching supported line | Must align with chosen Boot line |
| Swagger | TBD | supported OpenAPI approach | Replace obsolete integrations |
| IBM MQ Client | TBD | supported client line | Validate TLS / cipher / messaging package assumptions |
| Redis | TBD | supported Spring Data Redis line | Validate serializers and connection config |
| RDS Driver | TBD | supported driver line | Validate datasource, pool, SSL, timezone |
| SQS SDK | TBD | supported SDK line | Prefer consistent SDK usage across modules |
| Build Plugins | TBD | Java 21-compatible line | surefire, failsafe, jacoco, container build |
