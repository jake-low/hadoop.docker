FROM alpine:3.3
MAINTAINER Jake Low <jake.low@isilon.com>

USER root

RUN apk --update add \
  bash \
  openjdk7-jre \
  rsync

ARG version

# download and extract hadoop
RUN wget http://archive.apache.org/dist/hadoop/common/hadoop-$version/hadoop-$version.tar.gz \
  && tar xzf hadoop-$version.tar.gz \
  && rsync -av hadoop-$version/ / \
  && rm -rf hadoop-$version \
  && rm -f hadoop-$version.tar.gz

# create hadoop groups and users
RUN addgroup hadoop && addgroup supergroup
RUN adduser -D -G hadoop hdfs && adduser -D -G hadoop yarn
RUN adduser hdfs supergroup && adduser yarn supergroup

# set java home, path, and hadoop env variables
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH $JAVA_HOME/bin:$PATH
ENV HADOOP_CONF_DIR /etc/hadoop
ENV HADOOP_LIBEXEC_DIR /libexec

USER hdfs

RUN hdfs namenode -format

VOLUME ["/tmp"]
