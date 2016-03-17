# Secure Hadoop cluster

This is a composition for a Hadoop cluster with the following security features enabled:

- mutual authentication in all protocols
- on-the-wire cryptography enabled for both the RPC and data-transfer protocols
- SSL enabled for the HTTP interfaces

# Usage

Before you can run `docker-compose up`, you need to bring the KDC container and create a database.

```
kdb5_util create -s -r LOCALDOMAIN
```

After that, add some Kerberos principals. In this example, you'll need:

- `hdfs/namenode.localdomain@LOCALDOMAIN`
- `hdfs/datanode.localdomain@LOCALDOMAIN`
- `yarn/resourcemanager.localdomain@LOCALDOMAIN`
- `yarn/nodemanager.localdomain@LOCALDOMAIN`
- `HTTP/namenode.localdomain@LOCALDOMAIN`
- `HTTP/datanode.localdomain@LOCALDOMAIN`
- `HTTP/resourcemanager.localdomain@LOCALDOMAIN`
- `HTTP/nodemanager.localdomain@LOCALDOMAIN`

You should export the `nodemanager` and `resourcemanager` principals into a `yarn.keytab` and the `namenode` and `datanode` principals into an `hdfs.keytab`, both in `/etc/security/keytab`. This is a volume that the other containers will mount when they start. This is how we provide them with access to the needed keys.

You'll also need to generate SSL certificates. See `create-ssl-cert.sh` for an example of how to do this. Each host needs its own certs.
