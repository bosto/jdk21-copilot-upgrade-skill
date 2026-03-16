# Compatibility Matrix

| Area | Current | Target | Notes |
|---|---|---|---|
| Java | 8 | 21 | Runtime and compiler upgrade |
| Spring Boot | TBD | 3.4.x | Requires Java 17+ |
| Spring Cloud | TBD | 2024.0.x | Must align with Boot 3.4.x |
| Spring Cloud AWS | TBD | 3.3.x | Compatible with Boot 3.4 / Cloud 2024.0 |
| Swagger | springfox / old swagger | springdoc-openapi 2.8.x | Replace old integration |
| IBM MQ Client | TBD | 9.4.x | Check TLS/FIPS/cipher impacts |
| AWS SDK for SQS | v1 / mixed | v2 | Prefer SqsClient |
| Redis | TBD | BOM-managed | Check serializer / lettuce config |
| RDS Driver | TBD | BOM-managed latest supported | Validate datasource + pool config |
