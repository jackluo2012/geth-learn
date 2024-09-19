/**
 * @title Coin
 * @author 
 * @notice 发行的代币合约
 */
pragma  solidity ^0.8.0;

contract Coin {
    // The keyword "public" makes it possible
    // to read data from the blockchain
    // 定一个造币者地址
    address public minter;
    // 一个地址对应一个余额
    mapping (address => uint) public balances;

    // Events allow light clients to react to changes
    // to the blockchain by filtering for them.
    event Sent(address from, address to, uint amount);

    // This is the constructor whose code is
    // run only when the contract is created.
    // 定义一个总量
    constructor(uint initialSupply) {
        balances[msg.sender] = initialSupply;
        // minter = msg.sender;
    }
    // // 调用此方法就可以发币
    // function mint(address receiver, uint amount) public {
    //     // 只能是 minter 调用
    //     require(msg.sender == minter);
    //     balances[receiver] += amount;
    // }

    error InsufficientBalance(uint requested, uint available);
    // 转账
    function send(address receiver, uint amount) public returns (bool success) {
        if (amount > balances[msg.sender]) {
            revert InsufficientBalance(amount, balances[msg.sender]);
        }
        require(balances[msg.sender] >= amount);
        require(balances[receiver] + amount >= balances[receiver]);
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
        return true;
    }
    
}