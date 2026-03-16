package com.example.demo.config;

import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.spi.DocumentationType;

public class LegacySwaggerConfig {
    public Docket api() { return new Docket(DocumentationType.SWAGGER_2); }
}
