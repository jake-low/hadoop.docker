#!/bin/sh

keytool -genkeypair -keystore /etc/security/ssl/keystore \
-alias `hostname` -dname "CN=`hostname -f` O=Hadoop" \
-storepass changeme -keypass changeme

keytool -exportcert -keystore /etc/security/ssl/keystore \
-alias `hostname` -storepass changeme -file tmp.cert

keytool -importcert -keystore /etc/security/ssl/truststore \
-alias `hostname` -storepass changeme -file tmp.cert \
-noprompt

rm tmp.cert
