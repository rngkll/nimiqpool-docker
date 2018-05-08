git submodule init

# Installation steps

First, get the source code and set up all dependecies
```
git clone https://github.com/rngkll/nimiqpool-docker
cd nimiqpool-docker/
git submodule init --remote
```

## Docker

Secondly, go to [docker.com](https://www.docker.com/community-edition) and follow the steps to install Docker. Unless you're on Mac or Windows, you'll need to manually install Docker Compose by following [these steps](https://docs.docker.com/compose/install/).

## Get cerfiticates for the pool

To enable secure connections to your machine, SSL/TLS certificates are needed. [Letsencrypt](https://letsencrypt.org) gives you the ability to get a free certificate, [Certbot](https://certbot.eff.org) is the recommended way to generate a certificate with Letsencrypt.

## Change configuration files.

* Copy server.sample.conf to server.conf and modify as necessary.
* Copy service.sample.conf to service.conf and modify as necessary.
* Copy payout.sample.conf to payout.conf and modify as necessary.

### Generate a self-signed certificate for test
```
openssl req \
       -newkey rsa:2048 -nodes -keyout configs/my.domain.key \
       -x509 -days 365 -out configs/my.domain.cer
```

## deploy the pool

Run `docker-compose up` in the root path of the doc
