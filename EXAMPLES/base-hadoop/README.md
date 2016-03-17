# Basic Hadoop 2.7 cluster

This directory defines a scalable Hadoop cluster. It runs YARN and HDFS. You
can attach a client to it and run YARN applications (such as a MapReduce job).

### Usage

This cluster can be spun up using [compose](https://github.com/docker/compose).

Four containers are defined:
- `namenode`
- `datanode`
- `resourcemanager`
- `nodemanager`

The `namenode` and `resourcemanager` containers are singleton services, so their `scale` should always be 1. The `datanode` and `nodemanager` services can be scaled to whatever number (>0) you wish, independent of one another.

See the `docker-compose.yaml` file for more information.

### Configuration

All containers mount their configuration files from the `etc/hadoop` directory
provided. Simply edit the files there to configure your cluster. See the Hadoop
documentation for specifics.
