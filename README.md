Docker alpine-postfix
============
Docker image with alpine distribution and packages:
* postfix
* postfix-pcre
* cyrus-sasl-login
* ca-certificates

Quick Start
===========

```bash
cp -p example/02-account.example example/02-account.sh
```

* Update username/password in example/02-account.sh

* Launch container
```bash
docker run -d -v $(pwd)/spool-postfix:/var/spool/postfix -v $(pwd)/example/:/docker-entrypoint.d/ --name mail mnival/alpine-postfix
```

* By default, Postfix only accepts connections from its IP, you can also use 03-mynetworks.example who will accept connections on the IP with a mask 24. For use :
```bash
cp -p example/03-mynetworks.example example/03-mynetworks.sh
```

* Relaunch your container

Interfaces
===========

Ports
-------
	No port is published by default to avoid any risk. Depending on the configuration you set up, it may be necessary to publish ports.

Volumes
-------
* /var/spool/postfix/

Maintainer
==========
Please submit all issues/suggestions/bugs via
https://github.com/mnival/alpine-postfix
