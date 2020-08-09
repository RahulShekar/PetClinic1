FROM openjdk:11.0.3-jre-slim-stretch
VOLUME /tmp
ADD target/spring-petclinic-*.jar /petclinic.jar
EXPOSE 8080
RUN bash -c 'touch /petclinic1.jar'
ENTRYPOINT ["java","-jar","/petclinic1.jar"]
