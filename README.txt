
## Logstash Docker

This repository contains **Dockerfile** of [Logstash](https://www.elastic.co/products/logstash) and other scripts
for [Docker](https://www.docker.com/)'s.

### Base Docker Image

* [openjdk:8-jre](https://hub.docker.com/_/openjdk/)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Pull image from Docker hub(https://hub.docker.com/):

```docker pull oisis/docker-logstash```

3. Alternatively build an image from [Dockerfile](https://github.com/oisis/docker-logstash):

```docker build oisis/logstash .```

### Usage

* Run with Elasticsearch address:
```
docker run -d --name logstash -e ELASTICSEARCH_ADDR=elasticsearch:9200 \
  oisis/logstash
```

### Supported variables:

- `LS_INPUT_PORT`: Port to listen for requests
- `ELASTICSEARCH_ADDR`: Elasticsearch host address
- `ELASCTICSEARCH_INDEX`: Elasticsearch index to create and write
- `ELASTICSEARCH_USER`: Username to login to Elasticsearch(basic auth)
- `ELASTICSEARCH_PASSWD`: Password to login to Elasticsearch(basic auth)
