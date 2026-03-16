#!/usr/bin/env bash
set -euo pipefail
SEARCH_ROOT="${1:-.}"
grep -RIn "com.ibm.mq\|MQQueueConnectionFactory\|JmsTemplate\|javax.jms\|jakarta.jms" "$SEARCH_ROOT" 2>/dev/null || true
grep -RIn "RedisTemplate\|Lettuce\|Jedis\|spring.data.redis\|RedisConnectionFactory" "$SEARCH_ROOT" 2>/dev/null || true
grep -RIn "DataSource\|Hikari\|postgresql\|mysql\|mariadb\|spring.datasource" "$SEARCH_ROOT" 2>/dev/null || true
grep -RIn "AmazonSQS\|SqsClient\|QueueMessagingTemplate\|SqsTemplate\|aws-java-sdk-sqs\|software.amazon.awssdk.services.sqs" "$SEARCH_ROOT" 2>/dev/null || true
grep -RIn "TLS\|SSL\|cipher\|trustStore\|keyStore" "$SEARCH_ROOT" 2>/dev/null || true
