### 安装 solc
- solc 是Solidity编译器，用于将Solidity源代码编译为字节码
- npm install -g solc
- 使用是：solcjs --bin --abi xxx.sol

### web3 .js
- Web3 JavaScript app APl
- web3.js 是一个JavaScript API库。要使DApp在以太坊上运行我们可以使用web3.js库提供的web3对象web3.js 通过RPC调用与本地节点通信，它可以用于任何暴露了RPC层的以太坊节点
- web3 包含 eth 对象-web3.eth(专门与以太坊区块链交互)和 shh 对象-web3.shh(用于与 Whisper 交互)