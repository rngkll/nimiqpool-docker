*We absolutely recommend to install the mining pool on Linux (not Windows or Mac).*
Thus, we will only describe how to install on Linux below.

# Installation steps

First, get the source code and set up all dependecies
```
git clone https://github.com/rngkll/nimiqpool-docker
cd nimiqpool-docker/
git submodule init
git submodule update
```

## Docker

Secondly, go to [docker.com](https://www.docker.com/community-edition#/download) and follow the steps to install Docker. 

```
sudo adduser nimiqpool
sudo adduser nimiqpool docker
```

You'll need to manually install Docker Compose by following [these steps](https://docs.docker.com/compose/install/).

## Get Cerfiticates for the Pool

### For Testing

Generate a self-signed certificate for test:

```
openssl req \
       -newkey rsa:2048 -nodes -keyout configs/my.domain.key \
       -x509 -days 365 -out configs/my.domain.cer
```

### For Production

To enable secure connections to your machine, SSL/TLS certificates are needed. 
[Letsencrypt](https://letsencrypt.org) gives you the ability to get a free certificate, 
[Certbot](https://certbot.eff.org) is the recommended way to generate a certificate with Letsencrypt.

$$$ copy desc from 'how to install a miner' or refer there

## Change configuration files

Copy the configuration examples to your config directory:
```
cp mining-pool/*.sample.conf configs/
```

And rename each of them from `.sample.conf` to `.conf`.

## Adjust configuration

$$$ TODO: avoid duplication of config files first!

## Deploy the pool

Reboot your server. Yes, do it.

And finally, run `docker-compose up` from within the `nimiqpool-docker` directory.
Starting first time will produce error message because parts of the code need to finish compiling first.
Once you see output similiar to the lines below:

```
server_1   | [5/5] Building fresh packages...
...        | ...
server_1   | Done in 43.35s.
```

Stop the pool miner system with `Ctrl+c` and restart with `docker-compose up`.
After the next start, you should see the server synchronizing with the blockchain:

```
server_1   | [I 23:49:56] Node: Now at block: 1100
...        | ...
server_1   | [I 00:03:22] Node: Blockchain full-consensus established in 818.055s.
server_1   | [I 00:03:22] PoolServer: Started server on port 8444
```

If you noticed any errors, restart the system again, you pool mining system is fully initialized now.

