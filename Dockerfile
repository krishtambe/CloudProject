FROM ubuntu:18.04

#update the repo
RUN apt-get -y update && apt-get -y upgrade
#install jdk and wget and git
RUN apt-get -y install openjdk-8-jdk wget git
#install curl
RUN apt-get -y install curl
#create direcory
RUN mkdir /usr/local/tomcat
#Download tomcat8
RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.90/bin/apache-tomcat-8.5.90.tar.gz -O /tmp/tomcat.tar.gz
#Copy file to temp and extract
RUN cd /tmp && tar xvfz tomcat.tar.gz
#Copy files from tmp to /usr/local dir
RUN cp -Rv /tmp/apache-tomcat-8.5.90/* /usr/local/tomcat/
#Expose the 8080 port
EXPOSE 8080
#Run the tomcat 
CMD /usr/local/tomcat/bin/catalina.sh run
