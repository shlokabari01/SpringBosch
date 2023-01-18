FROM openjdk
 
 
COPY ./target/Springboot*.jar /usr/app/Springboot.jar
 
 
WORKDIR /usr/app
 
 
EXPOSE 3000
 
 
ENTRYPOINT ["java","-jar","Springboot.jar"]

