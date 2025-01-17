### Solidity是什么
- Solidity 是一门面向合约的、为实现智能合约而创建的高级编程语言。这门语言受到了C++，Python 和Javascript 语言的影响，设计的目的是能在以太坊虚拟机(EVM)上运行。
- Solidity 是静态类型语言，支持继承、库和复杂的用户定义类型等特性。
- 内含的类型除了常见编程语言中的标准类型，还包括address等以太坊独有的类型，Solidity源码文件通常以.sol作为扩展名
- 目前尝试 Solidity编程的最好的方式是使用 Remix。Remix是一个基于Web浏览器的IDE，它可以让你编写 Solidity智能合约，然后部署并运行该智能合约。

### Solidity语言特性
- Solidity的语法接近于JavaScript，是一种面向对象的语言。但作为一种真正意义上运行在网络上的去中心合约，它又有很多的不同:
- 以太坊底层基于帐户，而不是 UTXO，所以增加了一个特殊的address的数据类型用于定位用户和合约账户。
- 语言内嵌框架支持支付。提供了payable等关键字，可以在语言层面直接支持支付。
- 使用区块链进行数据存储。数据的每一个状态都可以永久存储，所以在使用时需要确定变量使用内存，还是区块链存储，
- 运行环境是在去中心化的网络上，所以需要强调合约或函数执行的调用的方式。
- 不同的异常机制。一旦出现异常，所有的执行都将会被回撤，这主要是为了保证合约执行的原子性，以避免中间状态出现的数据不一致。

### Solidity源码和智能合约
- Solidity 源代码要成为可以运行在以太坊上的智能合约需要经历
如下的步骤:

- 用 Solidity编写的智能合约源代码需要先使用编译器编译为字节码(Bytecode)，编译过程中会同时产生智能合约的二进制接口规范(Application BinaryInterface，简称为ABI)
- 通过交易(Transaction)的方式将字节码部署到以太坊网络每次成功部署都会产生一个新的智能合约账户;
- 使用 Javascript编写的 DApp 通常通过 web3.js+ABI去调用智能合约中的函数来实现数据的读取和修改。

### Solidity编译器
Remix
- Remix是一个基于Web浏览器的 SolidityIDE;可在线使用而无需安装任何东西
- http://remix.ethereum.org
- solcjs
- solc是 Solidity源码库的构建目标之一，它是 Solidity的命令行编译器
- 使用 npm 可以便捷地安装Solidity 编译器 solcjs
- npm install -g solc
- solcjs编译器支持编译 Solidity源码，并输出可读的ABI和字节码
![alt text](./images/image.png)


### 合约代码解读
event Sent(address from, address to, uint amount);
- 声明了一个“事件”(event)，它会在send 函数的最后一行触发
- 用户可以监听区块链上正在发送的事件，而不会花费太多成本。一旦它被发出，监听该事件的listener都将收到通知
- 所有的事件都包含了from，to和amount三个参数，可方便追踪事务
emit Sent(msg.sender, receiver, amount);
- 触发Sent事件，并将参数传入