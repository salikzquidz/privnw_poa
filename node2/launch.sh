geth --networkid 30059 --nousb --datadir "./data" --bootnodes 'enode://3ee566c9067ea7b03ef1a135d5df4a8b12a3855a09f97ce0bf7dd53ba331f03fae2b5ab0e6f5bc7b17a5585719fe4f3c566d45e7b6f27bd813a86842888868d2@127.0.0.1:0?discport=30310' --syncmode full --port 30312 --miner.gasprice 0 --miner.gastarget 470000000000 --http --http.addr localhost --http.port 8546 --http.api admin,eth,miner,net,txpool,personal,web3,clique --mine --allow-insecure-unlock --unlock "0x08a801cf9fb513b968ee29542ac9b7d82931c38e" --password password.txt --ipcdisable console