docker volume create --name sonarqube_data
docker volume create --name sonarqube_logs
docker volume create --name sonarqube_extensions

docker run -d --stop-timeout 3600 --name sonarqube -p 9000:9000 --network default-net --restart on-failure -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -e SONAR_JDBC_URL=jdbc:mysql://mysql80:3306/sonarqube -e SONAR_JDBC_USERNAME=root -e SONAR_JDBC_PASSWORD=AdminMay2022 -v sonarqube_data:/opt/sonarqube/data -v sonarqube_extensions:/opt/sonarqube/extensions -v sonarqube_logs:/opt/sonarqube/logs sonarqube:9.4.0-community