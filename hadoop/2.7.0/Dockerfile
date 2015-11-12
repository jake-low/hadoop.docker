FROM centos:6
MAINTAINER Jake Low <jake.low@isilon.com>

USER root

# install dev tools and java
RUN yum install -y \
    java-1.8.0-openjdk* \
    krb5-workstation \
    tar \
    wget \
    which

# download and extract hadoop
RUN wget -O - \
    http://archive.apache.org/dist/hadoop/common/hadoop-2.7.0/hadoop-2.7.0.tar.gz \
    | tar -xzpo --strip-components 1 -C /

# create hadoop groups and users
RUN groupadd hadoop
RUN groupadd supergroup
RUN useradd -g supergroup -G hadoop hdfs
RUN useradd -g supergroup -G hadoop yarn

# set java home, path, and hadoop env variables
ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0
ENV PATH $JAVA_HOME/bin:$PATH
ENV HADOOP_CONF_DIR /etc/hadoop
ENV HADOOP_LIBEXEC_DIR /libexec

RUN su hdfs -c "hdfs namenode -format"
