*We absolutely recommend to install the mining pool on Linux (not Windows or Mac).*
Thus, we will only describe how to install on Debian Linux (minimal) below.

# Installation steps

First, install dependencies:

```
apt update
apt install git
```

Then Docker by following the steps on [docker.com](https://www.docker.com/community-edition#/download) and Docker Compose by following [these steps](https://docs.docker.com/compose/install/).

Next, add a user dedicated to run the mining pool via docker (you can leave all the fields like "full name", "room number", and so empty):

```
adduser --disabled-password pooladmin
adduser pooladmin docker
```

Finally, switch to the new user, get the source code, and build it:

```
su pooladmin
cd
git clone https://github.com/rngkll/nimiqpool-docker
cd nimiqpool-docker/
git submodule init
git submodule update --remote
```

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

Install certbot from Let's Encrypt and run it (putting your registered domain name in place):

```
apt-get install certbot -t stretch-backports
certbot certonly --standalone -d <your domain name>
```

## Change configuration files

Copy the configuration examples to your config directory:

```
cp mining-pool/*.sample.conf configs/
```

Adjust each `.sample.conf` and save them as `.conf`.

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

