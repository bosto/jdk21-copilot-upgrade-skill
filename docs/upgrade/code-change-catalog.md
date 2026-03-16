# Code Change Catalog

## Common source-level migrations

### javax -> jakarta
- javax.validation.* -> jakarta.validation.*
- javax.servlet.* -> jakarta.servlet.*
- javax.persistence.* -> jakarta.persistence.*
- javax.annotation.* -> jakarta.annotation.*

### Swagger
- remove springfox Docket config
- replace with springdoc-openapi starter configuration

### AWS SQS
- com.amazonaws.services.sqs.* -> software.amazon.awssdk.services.sqs.*

### Spring Security
- remove WebSecurityConfigurerAdapter if present
- move to SecurityFilterChain bean style

### Java 21 / removed APIs
- remove dependencies on sun.* / com.sun.*
- inspect JAXB assumptions
- inspect reflective access and internal APIs
