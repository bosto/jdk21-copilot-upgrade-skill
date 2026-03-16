# Compatibility Matrix

| Area | Current | Candidate Target | Validation Focus |
|---|---|---|---|
| Java runtime | 8 | 21 | Runtime, CI, Docker, Jenkins |
| Maven plugins | TBD | Java 21-capable | compile, test, code coverage |
| Spring Boot | TBD | supported 3.x line | startup and actuator |
| Spring Cloud | TBD | matching supported line | bootstrap/config/client behavior |
| Swagger/OpenAPI | TBD | supported OpenAPI path | docs endpoint and config |
| IBM MQ | TBD | supported client line | TLS, cipher, JMS package, listener init |
| Redis | TBD | supported starter/client | serializer, timeout, cluster/sentinel settings |
| RDS driver | TBD | supported driver line | pool, SSL, timezone, startup migration path |
| SQS | TBD | supported SDK line | client init, listener/send/receive path |
