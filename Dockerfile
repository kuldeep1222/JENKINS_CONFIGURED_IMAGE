FROM redhat/ubi8


RUN dnf install -y java-openjdk wget git \
 && wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo \
 && rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key \
 && dnf install -y jenkins
 


EXPOSE 8080

CMD ["java -jar $(find / -name jenkins.war | head -n 1)","echo 'JENKINS RUNNING INSIDE THE CONTAINER'"]






