resource "confluent_connector" "source" {
  environment {
    id = confluent_environment.demo-conn.id
  }
  kafka_cluster {
    id = confluent_kafka_cluster.basic.id
  }

  config_sensitive = {}

  config_nonsensitive = {
    "connector.class": "HttpSink",
    "input.data.format": "JSON",
    "name": "HttpSink",
    "kafka.auth.mode": "KAFKA_API_KEY",
    "kafka.api.key": confluent_api_key.app-manager-kafka-api-key.id
    "kafka.api.secret": confluent_api_key.app-manager-kafka-api-key.secret
    "http.api.url": "http://75.118.149.10:8080/main.jsp",
    "request.method": "POST",
    "tasks.max": "1",
    "topics": "orders"
  }
}
