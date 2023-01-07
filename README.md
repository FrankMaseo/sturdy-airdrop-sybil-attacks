# sturdy-airdrop-sybil-attacks
Identifying addresses that attempted to game the Sturdy Finance airdrop

The method to identify users that attempted to game the airdrop is simple:
1. Take all addresses that made a deposit to Sturdy 
2. Identify their first deposit time
3. Cluster addresses that made their first deposit within the same hour: i.e. all addresses that made a first deposit into sturdy for the first time between 3PM and 4PM on 2022/11/22
4. Flag all wallets that were funded by the same address on the first tx recorded on the network.

This gives us the obvious sybil attackers. 

Some upcoming improvements:
* Grouping funding wallets in case of exchanges (i.e. wallets funded by Binance 1 and Binance 4)
* Clustering on a rolling 1hour basis, to enable flagging wallets that would have made deposits at 6:58, 7:01 and 7:06. Currently we would only flag 2 wallets that deposited at 7:01 and 7:06.
