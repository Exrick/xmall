FROM bitnami/tomcat:7

RUN rm -rf /opt/bitnami/tomcat/webapps/
ADD ./xmall-search-service/target/xmall-search-service-1.0-SNAPSHOT.war /opt/bitnami/tomcat/webapps/ROOT.war
