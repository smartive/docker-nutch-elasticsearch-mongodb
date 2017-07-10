# Based on https://raw.githubusercontent.com/apache/nutch/master/docker/Dockerfile

FROM java:8
MAINTAINER smartive AG <hello@smartive.ch>

ENV NUTCH_HOME $HOME/nutch

WORKDIR /root/

# Get the package containing apt-add-repository installed for adding repositories
RUN apt-get update && apt-get install -y software-properties-common

# Install various dependencies
RUN apt-get install -y ant openssh-server vim telnet git rsync curl build-essential

# Set up JAVA_HOME
RUN echo 'export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")' >> $HOME/.bashrc

# Checkout and build the nutch trunk
RUN wget https://github.com/smartive/nutch/archive/feature/es-5.zip && unzip es-5.zip && mv nutch-feature-es-5 nutch_source && cd nutch_source && ant

# Convenience symlink to Nutch runtime local
RUN ln -s nutch_source/runtime/local $NUTCH_HOME

ADD ./startup.sh $HOME/startup.sh
RUN chmod +x $HOME/startup.sh

ENTRYPOINT ["${HOME}/startup.sh"]
