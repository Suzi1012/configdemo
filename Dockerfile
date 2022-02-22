FROM openjdk:8

EXPOSE 8080

COPY ./target/*.jar app.jar

ADD server.crt /usr/local/share/ca-certificates/server.crt

RUN chmod 644 /usr/local/share/ca-certificates/server.crt && update-ca-certificates

ENV TZ=Asia/Kolkata

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD ["java","-jar","app.jar"]
