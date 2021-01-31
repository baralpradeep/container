FROM ubuntu
RUN groupadd -g 1001 dtsusers && \
    useradd -m -u 22610 -g dtsusers  xccuser
RUN apt-get -y update &&\
	apt-get -y install nfs-common &&\
	mkdir /home/xccuser &&\
	chmod ugo+rwx /home/xccuser
#ADD entrypoint.sh .
COPY .  /usr/local/share/XCC
RUN chown -R xccuser.dtsusers /usr/local/share/XCC
USER xccuser
ENV XCC_HOME=/usr/local/share/XCC
ENV JAVA_HOME=/usr/local/share/XCC/jdk.x64-sunX
ENV JRE_HOME=/usr/local/share/XCC/jdk.x64-sunX
ENV TOMCAT_HOME=/usr/local/share/XCC/Tomcat.XCC
ENV http_proxy="http://cmh-repo-001.lbidts.com:80"
ENV https_proxy="http://cmh-repo-001.lbidts.com:80"
#RUN /usr/local/share/XCC/Tomcat.PMM/bin/startup.sh
#ENTRYPOINT /usr/local/share/XCC/Tomcat.PMM/bin/startup.sh && /bin/bash
#ENTRYPOINT /usr/local/share/XCC/PEMJ/XCC_PEMj-start.sh && /bin/bash
ENTRYPOINT /usr/local/share/XCC/entrypoint.sh
ENTRYPOINT /usr/local/share/XCC/Tomcat.XCC/bin/startup.sh && /bin/bash
