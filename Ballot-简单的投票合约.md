### Ballot --一个简单的投票合约
- 电子投票的主要问题是如何将投票权分配给正确的人员以及如何防止被操纵。这个合约展示了如何进行委托投票同时，计票又是自动和完全透明的
- 为每个(投票)表决创建一份合约，然后作为合约的创造者--即主席，将给予每个独立的地址以投票权
- 地址后面的人可以选择自己投票，或者委托给他们信任的人来投票
- 在投票时间结束时，winningProposal()将返回获得最多投票的提案