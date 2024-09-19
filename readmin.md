###   Initializing the Geth Database 初始化 Geth 数据库
```
./geth init --datadir data genesis.json
```
### 当使用 --datadir data 启动 Geth 时，将使用 genesis.json 中定义的创世区块
```
./geth --datadir data --networkid 15
```
### 启动节点 并打开控制台
```
./geth --datadir data --networkid 15 console
./geth --datadir data --networkid 15 console 2> out.log
./geth --datadir data --networkid 15 --unlock "0x76f32f9a78B53754758369980F692Dc0cee28868" console 2> out.log


./geth --datadir data --networkid 15 --unlock "0x76f32f9a78B53754758369980F692Dc0cee28868" --password ./pwd.txt console 2> out.log

```


### 1. 生成账户
```bash
./clef init
#生成的种子在 C:\Users\jackluo\AppData\Roaming\Signer\masterseed.json
./clef --keystore ./masterseed.json
./clef --chainid 15 --keystore ./masterseed.json
./clef --chainid 15 --keystore ./data/keystore
```
###
#  生成账户
```bash
./clef --chainid 15 --keystore ./data/keystore newaccount
```
### 启动节点
```
./geth --datadir data --networkid 15 --http.port 8545 --unlock "0xFF7490A35c8802132D922dd4D8f0D04af16F6B1A" --password ./pwd.txt console 2> out.log
./geth --datadir data --networkid 15 --rpcport 8547 --ws --ws.port=8546 --http.port=8545 --rpccorsdomain "*" --port 1718 --nodiscover --nat "any" --rpcapi "eth,net,web3,personal" console 2> out.log

./geth --http --http.addr 0.0.0.0 --nodiscover --datadir data --networkid 15  --port 30303 --http.api "personal,eth,net,web3,admin,ethash,miner" --http.port 8545 --http.corsdomain "*"  --ipcdisable  --miner.gaslimit 2000000000 --allow-insecure-unlock --unlock "0xFF7490A35c8802132D922dd4D8f0D04af16F6B1A" --password ./pwd.txt  console 2>out.log


```



# --datadir 后面跟的是你指定的工作目录
# --identity 后面跟的是你的区块链标识，随便写
# --networkid 后面跟的是你的网络id，这个是区别区块链网络的关键
# --port 和 --rpcport 你随便给一个就行，别跟在用的端口重复就行
# --nodiscover 不去发现节点
# 2>output.log 输出到这个日志里面
# --rpc --rpcport=8547 ：开启RPC连接方式，并设置端口为8547
# --ws --wsport=8546 ：开启WebSocket连接方式，并设置端口为8546
# --http.port=8548 ： http连接，端口为8548
# --rpccorsdomain="*" ：RPC允许所有跨域连接，这个设置主要是为了Remix在线连接本地开发网络
# console ：Geth启动后仍可接收命令行命令，如不开启又需要使用命令行也可以通过geth attach ipc:\\.\pipe\geth.ipc方式连接到当前节点
# --ipcpath ./datachain/geth.ipc
# --rpcapi "eth,admin,web3,net,personal"  不加的话，很多rpc api是无法使用的



### 挖矿
```
#设置矿工地址
miner.setEtherbase(eth.accounts[0])
#启动挖矿
miner.start()
#停止挖矿
miner.stop()
```
### 查看账户余额
```
eth.getBalance(eth.accounts[0])
```

### 转帐
```bash
eth.sendTransaction({from:eth.accounts[0],to:"0x540E61C21eE9efb85Bc74b39eaee037A10b9791b",value:web3.toWei(5,'ether')})
miner.start()
miner.stop()
```
### 查看余额
```
eth.getBalance(eth.accounts[0])
eth.getBalance(eth.accounts[1])
```



### eth 常用命令
```
#查看账户
eth.accounts
#查看账户余额
eth.getBalance(eth.accounts[0])
#查看当前区块号
eth.blockNumber
#查看当前区块
eth.getBlock(eth.blockNumber)
#查看当前区块的交易
eth.getBlock(eth.blockNumber).transactions
#Wei 换换算成以太币 1 ether = 10^18 wei
web3.fromWei(eth.getBalance(eth.accounts[0]),'ether')
#以太币转换成 Wei
web3.toWei(1,'ether')
#转帐
eth.sendTransaction({from:eth.accounts[0],to:eth.accounts[1],value:web3.toWei(1,'ether')})

#查看当前区块的交易数量
eth.getBlockTransactionCount(eth.blockNumber)
#查看当前区块的区块大小
eth.getBlock(eth.blockNumber).size
#查看当前区块的区块大小

#查看交易详情 txhash
eth.getTransaction(txhash)
#查看交易回执
eth.getTransactionReceipt(txhash)
#查看当前gas价格
eth.gasPrice
#查看当前网络ID
eth.netVersion
#查看当前网络ID
net.version
#查看当前网络ID
admin.nodeInfo.protocols.eth.network
#查看当前网络ID
admin.nodeInfo.protocols.eth.config.chainId
```
### 查看当前节点信息
```
admin.nodeInfo
```
### 查看当前节点连接的节点
```
admin.peers
```
### 查看当前节点连接的节点
```
admin.peers
```
### 查看当前节点连接的节点
```
admin.peers
```
### 查看当前节点连接的节点
```
admin.peers
```
### 查看当前节点连接的节点
```
admin.peers
```
### 查看当前节点连接的节点
```
admin.peers
```