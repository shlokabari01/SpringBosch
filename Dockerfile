FROM openjdk
 
 
COPY ./target/Springboot*.jar /usr/app/Springboot.jar
 
 
WORKDIR /usr/app
 
 
EXPOSE 8080
 
 
ENTRYPOINT ["java","-jar","Springboot.jar"]

