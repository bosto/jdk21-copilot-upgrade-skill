# Code Change Catalog

## Common source migrations

### javax → jakarta
- `javax.validation.*` → `jakarta.validation.*`
- `javax.servlet.*` → `jakarta.servlet.*`
- `javax.persistence.*` → `jakarta.persistence.*`
- `javax.annotation.*` → `jakarta.annotation.*`
- `javax.jms.*` → `jakarta.jms.*` when applicable

### Swagger / OpenAPI
- remove old Swagger config patterns
- replace with a supported OpenAPI starter and config style

### Spring Security
- remove older inheritance-based config when present
- prefer newer bean-driven configuration style

### AWS SDK
- identify mixed SDK usage
- converge on a single supported approach per service

### Java 21 concerns
- remove `sun.*` and other internal API dependencies
- inspect reflective access assumptions
- inspect JAXB and removed Java EE assumptions
