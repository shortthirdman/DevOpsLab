docker network create elastic

docker run --name es01 --net elastic -p 9200:9200 -p 9300:9300 -it docker.elastic.co/elasticsearch/elasticsearch:8.2.2

docker pull docker.elastic.co/logstash/logstash:8.2.2

docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-reset-password


docker cp es01:/usr/share/elasticsearch/config/certs/http_ca.crt .


docker exec -it es01 /usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s node

docker run -e ENROLLMENT_TOKEN="<token>" --name es02 --net elastic -it docker.elastic.co/elasticsearch/elasticsearch:8.2.2


docker run -e ES_JAVA_OPTS="-Xms1g -Xmx1g" -e ENROLLMENT_TOKEN="<token>" --name es02 -p 9201:9200 --net elastic -it docker.elastic.co/elasticsearch/elasticsearch:8.2.2


bin/elasticsearch-keystore show xpack.security.http.ssl.keystore.secure_password


bin/elasticsearch-keystore show xpack.security.transport.ssl.keystore.secure_password