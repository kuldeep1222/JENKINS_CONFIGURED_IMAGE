FROM redhat/ubi8


RUN dnf install -y java-17-openjdk wget git \
 && wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo \
 && rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key \
 && dnf install -y jenkins
 


EXPOSE 8080


CMD ["sh", "-c", "echo 'JENKINS RUNNING INSIDE THE CONTAINER' && java -jar $(find / -name jenkins.war | head -n 1)"]






