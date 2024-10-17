// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    uint[5] public totalVotes; 
    mapping(address => bool) public hasVoted; 
    mapping(address => uint8) public myVote; 

    function vote(uint8 candidateId) public {
        require(!hasVoted[msg.sender], "Already voted");
        require(candidateId >= 1 && candidateId <= 5, "Invalid candidate");

        hasVoted[msg.sender] = true; 
        myVote[msg.sender] = candidateId;
        totalVotes[candidateId - 1]++; 
    }

    function getTotalVotes(uint8 candidateId) public view returns (uint) {
        return totalVotes[candidateId - 1];
    }

    function getMyVote() public view returns (uint8) {
        return myVote[msg.sender];
    }
}
