FROM ubuntu
ADD .  /usr/local/share/XCC 
ENV JAVA_HOME=/usr/local/share/XCC/jdk.x64-sunX
ENV JRE_HOME=/usr/local/share/XCC/jdk.x64-sunX
ENV TOMCAT_HOME=/usr/local/share/XCC/Tomcat.PMM
