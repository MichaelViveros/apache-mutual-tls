# Apache Mutual TLS

https://hub.docker.com/r/mviveros/apache-mutual-tls

This image contains an Apache server configured with Mutual TLS which will allow your server to do client authentication in addition to server authentication.

[![Docker Pulls](https://img.shields.io/docker/pulls/mviveros/apache-mutual-tls.svg)](https://hub.docker.com/r/mviveros/apache-mutual-tls)


## Setup
1. Put your certs in `./certs/`:
* `server.crt` and `server.key` - server certificate and key used for server authentication
* `ca.crt` - trusted root CA your server will allow client certificates signed by
2. Set the environment variables:
* `ALLOWED_CLIENT_S_DN` - allowed client certificate subject domain name, client certificates from other domains will result in a `403`
* `VERIFY_DEPTH` (optional) - maximum client certificate chain length, defaults to `2` which will allow client certificates signed by one intermediate CA, set to `1` to only allow client certificates signed by the trusted root CA
3. Run it:
```
docker run -p 443:443 --env ALLOWED_CLIENT_S_DN=example.com -v `pwd`/certs/:/usr/local/apache2/conf/certs mviveros/apache-mutual-tls
```

## Test
Assuming you have client certs in `client.crt`/`client.key` and `ca_server.crt` contains the CA your server certificate is signed by, you can test it with:
```
curl -v --cert client.crt --key client.key --cacert ca_server.crt https://localhost:443
```

## Links
* To see which specific configs were used to setup client authentication, check out commit [3d8b6cd](https://github.com/MichaelViveros/apache-mutual-tls/commit/3d8b6cd77cc04a1e4ad4807039cb991af1aa04bc)
* Docs - https://httpd.apache.org/docs/2.4/ssl/ssl_howto.html#accesscontrol

## Coming Soon
* support for adding a proxy header for client subject domain name
