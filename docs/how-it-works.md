# How it Works

A mining pool is composed of multiple components:
* Pool server
* Pool service
* Payout
* Database
* Website
* Metrics server

# Data Flow

The server will inform the miners about the current conditions to participate in mining, like
* Information on the new block (body hash, difficulty, ...)
* The extra data to be used (usually a short text snippet identifying the pool, e.g. the pool's name)
* The fee being charged by the pool (by default 1%)
* And how often the miners should send so called shares (more below)

Miners can be `nano` and `smart` clients. 
A smart client will actually retrieve the current block by listing to the blockchain network itself 
instead of waiting for the server.

Then, according to the information/requirements sent by the server before, 
the miners will start producing hashes for the new bock.
On a regular basis, the miners will send a share.
A share is the most "difficult" hash each miner found in the last period of time (by default five seconds).
The difficulty is related to how many leading zeros a suitable hash has.
The more zeros it has the rarer it is, thus, it is a proof that the miner, in average, worked hard to find it.
All the shares are stored in a database.

Once a block has been mined successfully (i.e. the pool won the race of finding a hash that is difficult enough), 
the `Pool Service` will retrieve the latest shares sent by the miners (by default the last 1'000).

According to these shares, the `Pool Service` will calculate how much each miner has contributed to mining this block.
The result (contribution per miner) will be stored in the database again.

On a regular basis, the `Pool Payout` will sum up the contributions and calculate how much NIM each miner should receive 
according to the retrieved block reward and transaction fees minus the pool fee and the transaction fee for the payout.
After the miner has been collected a certain amount of NIM (by default 50 NIM), an automatic payout will be triggered.

# Monitoring

Additionally, the pool setup contains monitoring components (work in progress). 
The `Metrics Server` will provide metrics that can be shown on the mining pool's website, 
for example: total hashing power, number of miners, last mined block, average payout.
To see what metrics are available, point your browser to your mining pool's domain and add `/metrics`.
The metrics will also be used to monitor the entire setup and restart components on demand and trigger notifications.

# Website

Your mining pool installation will come with a default website.
You can find it in the `site` folder in the root directory.
Have a look at the dummy website's HTML code to understand how metrics are embedded.
You can change the website completely according to your needs.
