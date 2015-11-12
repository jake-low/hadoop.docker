FROM hadoop:2.7.0
MAINTAINER Jake Low <jake.low@isilon.com>

USER root

# download hive
RUN wget -O - \
    http://archive.apache.org/dist/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz \
    | tar -xz --strip-components 1 -C /

# create hadoop groups and users
RUN useradd -g hadoop hive

# set permissions on hadoop dir
# RUN chown -R hive:hadoop /tmp/hive
# RUN chmod -R g+u /tmp/hive
