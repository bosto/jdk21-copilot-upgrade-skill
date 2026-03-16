package com.example.app.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "app.mq")
public class MqProperties {
    private String queueManager;
    private String channel;
    private String connName;
    private String user;
    private String password;
    private boolean tlsEnabled;
    private String cipherSuite;

    public String getQueueManager() { return queueManager; }
    public void setQueueManager(String queueManager) { this.queueManager = queueManager; }
    public String getChannel() { return channel; }
    public void setChannel(String channel) { this.channel = channel; }
    public String getConnName() { return connName; }
    public void setConnName(String connName) { this.connName = connName; }
    public String getUser() { return user; }
    public void setUser(String user) { this.user = user; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public boolean isTlsEnabled() { return tlsEnabled; }
    public void setTlsEnabled(boolean tlsEnabled) { this.tlsEnabled = tlsEnabled; }
    public String getCipherSuite() { return cipherSuite; }
    public void setCipherSuite(String cipherSuite) { this.cipherSuite = cipherSuite; }
}
