FROM debian:9.9-slim
MAINTAINER Nick Patel <nick@rads.io>

# SSHD Server
# To Build: docker build -t np43/sshd .
# To Run:   docker run -d -p 8088:80 -p 4438:443 -p 2222:22 --name server1 np43/sshd
# Connect:  docker exec -it server1 /bin/bash
# To get this info run: docker run --rm np43/sshd /getinfo.sh



ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	    && apt-get -q -y dist-upgrade \
	    && apt-get -q -y install --no-install-recommends openssh-server pwgen apt-utils \
	    && apt-get clean \
	    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir -p /var/run/sshd
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
ADD set_root_pw.sh /set_root_pw.sh
ADD superupdate.sh /superupdate.sh
ADD getinfo.sh /getinfo.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh
EXPOSE 22
CMD ["/run.sh"]
