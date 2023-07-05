FROM jenkins/jenkins
USER root
RUN apt update && apt install sudo -y && usermod -aG sudo jenkins && echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER jenkins
RUN sudo apt install docker.io -y && sudo apt install lsb-release -y 
RUN sudo chown jenkins:jenkins /etc/apt/sources.list.d
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN sudo curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg