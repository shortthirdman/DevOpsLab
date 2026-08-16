SPRING_CLOUD_DATAFLOW=2.9.2
SPRING_CLOUD_SKIPPER=2.8.2
wget https://repo.spring.io/release/org/springframework/cloud/spring-cloud-dataflow-server/$SPRING_CLOUD_DATAFLOW/spring-cloud-dataflow-server-$SPRING_CLOUD_DATAFLOW.jar
wget https://repo.spring.io/artifactory/release/org/springframework/cloud/spring-cloud-dataflow-server/$SPRING_CLOUD_DATAFLOW/spring-cloud-dataflow-server-$SPRING_CLOUD_DATAFLOW.jar
wget https://repo.spring.io/release/org/springframework/cloud/spring-cloud-dataflow-shell/$SPRING_CLOUD_DATAFLOW/spring-cloud-dataflow-shell-$SPRING_CLOUD_DATAFLOW.jar
wget https://repo.spring.io/release/org/springframework/cloud/spring-cloud-skipper-server/$SPRING_CLOUD_SKIPPER/spring-cloud-skipper-server-$SPRING_CLOUD_SKIPPER.jar

docker run -d --hostname rabbitmq --name rabbitmq -p 15672:15672 -p 5672:5672 rabbitmq:3.7.14-management

java -jar spring-cloud-skipper-server-2.8.2.jar
java -jar spring-cloud-dataflow-server-2.9.2.jar
java -jar spring-cloud-dataflow-server-2.9.2.jar --spring.cloud.skipper.client.serverUri=https://192.51.100.1:7577/api
java -jar spring-cloud-dataflow-shell-2.9.2.jar


#https://www.baeldung.com/spring-cloud-data-flow-batch-processing
#https://dataflow.spring.io/docs/batch-developer-guides/batch/data-flow-spring-batch/
#https://dataflow.spring.io/docs/installation/local/manual/
#https://dataflow.spring.io/docs/installation/local/docker/
#https://dataflow.spring.io/docs/recipes/batch/batch-only-mode/
#https://dataflow.spring.io/docs/recipes/batch/sftp-to-jdbc/
#https://docs.spring.io/spring-cloud-dataflow/docs/current/reference/htmlsingle/#configuration-local-rdbms