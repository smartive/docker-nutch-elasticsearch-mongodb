# Based on https://raw.githubusercontent.com/apache/nutch/master/docker/Dockerfile

FROM java:8
MAINTAINER smartive AG <hello@smartive.ch>

WORKDIR /root/

# Get the package containing apt-add-repository installed for adding repositories
RUN apt-get update && apt-get install -y software-properties-common

# Add the repository that we'll pull java down from.
#RUN add-apt-repository -y ppa:webupd8team/java && apt-get update && apt-get upgrade -y

# Get Oracle Java 1.7 installed
#RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && apt-get install -y oracle-java7-installer oracle-java7-set-default

# Install various dependencies
RUN apt-get install -y ant openssh-server vim telnet git rsync curl build-essential 

# Set up JAVA_HOME
RUN echo 'export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")' >> $HOME/.bashrc

# Checkout and build the nutch trunk
RUN wget https://github.com/apache/nutch/archive/release-1.13.zip && unzip release-1.13.zip && mv nutch-release-1.13 nutch_source && cd nutch_source && ant

# Convenience symlink to Nutch runtime local
RUN ln -s nutch_source/runtime/local $HOME/nutch
