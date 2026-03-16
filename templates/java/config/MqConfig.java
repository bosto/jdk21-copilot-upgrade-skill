package com.example.app.config;

import com.ibm.mq.jms.MQQueueConnectionFactory;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@EnableConfigurationProperties(MqProperties.class)
public class MqConfig {

    @Bean
    public MQQueueConnectionFactory mqQueueConnectionFactory(MqProperties props) throws Exception {
        MQQueueConnectionFactory factory = new MQQueueConnectionFactory();
        factory.setQueueManager(props.getQueueManager());
        factory.setChannel(props.getChannel());
        factory.setConnectionNameList(props.getConnName());
        if (props.isTlsEnabled()) {
            factory.setSSLCipherSuite(props.getCipherSuite());
        }
        return factory;
    }
}
