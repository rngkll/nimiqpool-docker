git submodule init

# Installation steps

## Docker

You need docker and docker-compose to run the pool.


## Get cerfiticates for the pool

You need a way to get SSL/TLS certificates, [Letsencrypt](https://letsencrypt.org) gives you the ability to get a free certificate, [Certbot](https://certbot.eff.org) is the recommended way to generate a certificate with Letsencrypt.

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
