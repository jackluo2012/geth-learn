// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.8.17;
contract Ballot {
    //选民结构体
    struct Voter {
        uint weight;//权重，用来表示投票权
        bool voted;//是否已经投票
        address delegate;//委托投票
        uint vote;//投票的提案编号
    }
    //提案结构体
    struct Proposal {
        uint voteCount;//投票数
    }
    //合约创建者，即主席
    address public chairperson;
    // 投票人信息
    mapping(address => Voter) public voters;
    // 多个提案
    Proposal[] public proposals;

    constructor(uint proposalCount) {
        // 主持人就是合约创建者
        chairperson = msg.sender;
        voters[chairperson].weight = 1;
        // 初始化提案
        for (uint i = 0; i < proposalCount; i++) {
            proposals.push(Proposal({voteCount: 0}));
        }
    }
    // 主席可以给别人投票权
    function giveRightToVote(address voter) external {
        require(
            msg.sender == chairperson,
            "Only chairperson can give right to vote."
        );
        require(
            !voters[voter].voted,
            "The voter already voted."
        );
        require(voters[voter].weight == 0);
        voters[voter].weight = 1;
    }
    // 把自己的投票权委托给别人
    function delegate(address to) external {
        // 要存储的投票人
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "You already voted.");
        require(to != msg.sender, "Self-delegation is disallowed.");
        // 如果委托的人也委托了别人，就继续找下去
        // address(0) 是一个空地址，如果找到空地址，就说明没有委托人
        // 委托人不能委托自己
        while (voters[to].delegate != address(0) && voters[to].delegate != msg.sender) {
            // to 是被委托人,再找他的委托人，所以是while
            to = voters[to].delegate;

            require(to != msg.sender, "Found loop in delegation.");
        }
        //确定已经投票了
        sender.voted = true;
        // 代理 给了别人
        sender.delegate = to;
        // 代理人的权重增加
        Voter storage delegate_ = voters[to];
        if (delegate_.voted) {
            // 如果被委托人已经投票了，那么他的提案的投票数增加
            proposals[delegate_.vote].voteCount += sender.weight;
        } else {
            // 如果被委托人还没有投票，那么他的权重增加
            delegate_.weight += sender.weight;
        }
    }
    // 投票
    function vote(uint proposal) external {
        Voter storage sender = voters[msg.sender];
        require(sender.weight != 0, "Has no right to vote");
        require(!sender.voted, "Already voted.");
        require(proposal < proposals.length, "Invalid proposal.");
        sender.voted = true;
        sender.vote = proposal;
        proposals[proposal].voteCount += sender.weight;
    }
    // 计算提案的胜者
    function winningProposal() public view returns (uint winningProposal_) {
        uint winningVoteCount = 0; // 初始化为0
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal_ = p;
            }
        }
    }
}