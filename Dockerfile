FROM ubuntu:18.04

#update the repo
RUN apt-get -y update && apt-get -y upgrade

#install jdk and wget and git
RUN apt-get -y install openjdk-8-jdk wget git

#install curl
RUN apt-get -y install curl

#install maven and nano
RUN apt-get -y install nano maven

#Create a data directory
RUN mkdir -p /data/

#Switching data
WORKDIR /data

#perform git clone 
RUN git clone https://github.com/krishtambe/CloudProject.git

#Switch to CloudProject directory
WORKDIR /data/CloudProject

#Use maven package
RUN mvn package

#Switch to CloudProject/target directory
WORKDIR /data/CloudProject/target/

#create direcory
RUN mkdir /usr/local/tomcat

#Download tomcat8
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.90/bin/apache-tomcat-8.5.90.tar.gz -O /tmp/tomcat.tar.gz

#Copy file to temp and extract
RUN cd /tmp && tar xvfz tomcat.tar.gz

#Copy files from tmp to /usr/local dir
RUN cp -Rv /tmp/apache-tomcat-8.5.90/* /usr/local/tomcat/

#Copy the war file
RUN cp /data/CloudProject/target/CloudProject.war /usr/local/tomcat/webapps

#Expose the 8080 port
EXPOSE 8080

#Default port to execute the entrypoint
CMD ["--port 8080"]

#Run the tomcat server
CMD /usr/local/tomcat/bin/catalina.sh run

#Set default enrty point
ENTRYPOINT /bin/bash
