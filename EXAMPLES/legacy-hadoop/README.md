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

The containers that are spawned expect to be able to resolve each other (forward + reverse DNS) over the network. This is best accomplished by running compose with `--x-network-driver bridge`. As an alternative, you can run a DNS container like [docker-spy](https://github.com/iverberk/docker-spy) and edit the YAML file to give each container a `dns` and `dns_search` field.

See the `docker-compose.yaml` file for more information.
