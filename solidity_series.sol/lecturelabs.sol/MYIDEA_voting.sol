// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    address public owner;  // The contract owner
    bool public votingOpen; // Track if voting is open or closed

    struct Party {
        string name;  // Party name
        uint voteCount;  // Number of votes
    }

    struct Voter {
        bool hasVoted;  // If the voter has voted
        uint votedParty;  // Index of the voted party
        bool hasDelegated;  // If the voter has delegated their vote
        address delegate;  // The person to whom the vote was delegated
    }

    mapping(address => Voter) public voters;  // Store voter details
    Party[] public parties;  // Dynamic array to store party details

    // Constructor to initialize the contract with party names
    constructor(string[] memory partyNames) {
        owner = msg.sender;  // Set the contract creator as the owner

        // Add each party to the parties array
        for (uint i = 0; i < partyNames.length; i++) {
            parties.push(Party(partyNames[i], 0));
        }
    }

    // Function to start or stop voting (only the owner can call this)
    function setVotingStatus(bool _status) public {
        require(msg.sender == owner, "Only the owner can change voting status");
        votingOpen = _status;
    }

    // Function to cast a vote
    function vote(uint partyId) public {
        require(votingOpen, "Voting is not open");
        require(!voters[msg.sender].hasVoted, "You have already voted");

        // Record the vote and update the party's vote count
        voters[msg.sender].hasVoted = true;
        voters[msg.sender].votedParty = partyId;
        parties[partyId].voteCount++;
    }

    // Function to delegate your vote to another person
    function delegateVote(address to) public {
        require(!voters[msg.sender].hasVoted, "You have already voted");
        require(!voters[msg.sender].hasDelegated, "You have already delegated your vote");
        require(to != msg.sender, "You cannot delegate to yourself");

        // Delegate the vote and mark the voter as having delegated
        voters[msg.sender].hasDelegated = true;
        voters[msg.sender].delegate = to;

        // Notify the delegate that they have received a vote delegation
        voters[to].votedParty = voters[to].votedParty;  // Dummy logic to notify
    }

    // Function to cast a delegated vote (only the delegate can use this)
    function castDelegatedVote(uint partyId) public {
        require(voters[msg.sender].delegate != address(0), "You have no delegated votes");

        // Delegatee casts a vote on behalf of the delegator
        address delegator = voters[msg.sender].delegate;
        voters[delegator].hasVoted = true;
        voters[delegator].votedParty = partyId;
        parties[partyId].voteCount++;
    }

    // Function to check the number of votes for a party
    function getVoteCount(uint partyId) public view returns (uint) {
        return parties[partyId].voteCount;
    }

    // Function to check which party a voter has voted for (only the voter can access)
    function viewMyVote() public view returns (string memory) {
        require(voters[msg.sender].hasVoted, "You have not voted yet");
        uint partyId = voters[msg.sender].votedParty;
        return parties[partyId].name;
    }

    // Function to check if the voting is open or closed
    function votingStatus() public view returns (string memory) {
        if (votingOpen) {
            return "Voting is open";
        } else {
            return "Voting is closed";
        }
    }
}
