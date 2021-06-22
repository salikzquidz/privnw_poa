# Setup a Consortium/Private network

### Specifications for this setup
- Platform : Ethereum
- Client : Go-Ethereum (Geth) version 1.10.3-stable __https://geth.ethereum.org/downloads/__
- Architecture : amd64
- Go Version : go1.16.3
- OS : linux
- Consensus Model : Clique proof-of-authority
- Nodes : 1 bootnode, 1 sealer node, 1 peer

### Configurable setup (for new user + most settings must be unique)
-   Network name
-   Chain Id, _refer to [https://chainlist.org/]_
-   _Other Geth CLI options including http port, http address http cors domain, ipc, bootnodes etc_

> Below listed the steps need to be taken to correctly configure the setup

1.  Create 3 directories for different nodes (bootnode, sealer, and peer)
    * Chaindata will go under the subdirectory 'data' (only for node1 and node2)
2.  Create accounts:
    * geth --datadir ./node1/data account new
    * geth --datadir ./node2/data account new
3. Run the puppeth tool to generate the genesis.json file
4. Initialize node1 and node2
    ```
    cd node1 && geth --datadir ./data init ../genesis.json
    cd node2 && geth --datadir ./data init ../genesis.json
    ```
5. Setup bootnode
    * Generate a node key
    ```
    bootnode -genkey boot.key
    ```
    * Start using private key filename
    ```
    bootnode -nodekey "./boot.key"
    ```
    > After run second command, take note the enode echoed. It looks something like this
    _"enode://83cab5439021f0dcad5a12faa2c628c212bc072d78d2ebf5dd80c3cdd0d625f262bbac924492f5e0c0ce1140fdbfc569dfa5893615e386395bca2f61f551b722@127.0.0.1:0?discport=30301"_
    
6. Launch the node1 and node2 including the enode value of the bootnode created. Example of command template is as follows
    > geth --networkid <<value>> --mine --datadir "./data"  --port  <<port number>> --ipcdisable --syncmode full --http --http.corsdomain "*" --http.port <<value>> --unlock <<public address of node1 without "0x">> --password <<password filename (e.g: password.txt)>> --bootnodes '<<enode>>'  console

> To reuse this setup and configure from the very start, feel free to clean the following folders

1. node1\data\geth
2. node1\data\keystore
3. node2\data\geth
4. node2\data\keystore
5. bootnode\boot.key
6. privnw-harmony.json
7. privnw.json
8. node1\password.txt
9. node2\password.txt
10. node1\launch.sh
11. node2\launch.sh