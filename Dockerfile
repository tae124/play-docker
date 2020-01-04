FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y unzip zip curl
RUN curl -s "https://get.sdkman.io" | bash
RUN bash -c ' \
    source "$HOME/.sdkman/bin/sdkman-init.sh" && \
    sdk install java 8.0.232-amzn && \
    sdk use java 8.0.232-amzn && \
    sdk install sbt 1.0.4 && \
    sdk use sbt 1.0.4 && \
    sdk install scala 2.12.4 && \    
    sdk use scala 2.12.4'
ENV JAVA_HOME /root/.sdkman/candidates/java/current
ENV PATH $PATH:$JAVA_HOME/bin:/root/.sdkman/candidates/sbt/current/bin:/root/.sdkman/candidates/scala/current/bin
EXPOSE 9000