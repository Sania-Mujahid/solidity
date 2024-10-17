// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // Enum to represent voting status
    enum VotingStatus { Open, Closed }

    // State variables
    address public owner;
    VotingStatus public status;
    string[] public candidates;
    mapping(string => uint) public votesReceived;
    mapping(address => bool) public voters;

    // Constructor to initialize the contract
    constructor(string[] memory _candidates) {
        owner = msg.sender; // Address of the contract deployer
        status = VotingStatus.Closed; // Voting status is initially Closed
        candidates = _candidates; // List of candidates
    }

    // Modifier to restrict access to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    // Function to start voting, only the owner can call this
    function startVoting() public onlyOwner {
        status = VotingStatus.Open;
    }

    // Function to end voting, only the owner can call this
    function endVoting() public onlyOwner {
        status = VotingStatus.Closed;
    }

    // Function to vote for a candidate
    function vote(string memory candidate) public {
        require(status == VotingStatus.Open, "Voting is not open.");
        require(!voters[msg.sender], "You have already voted.");
        require(isValidCandidate(candidate), "Invalid candidate.");

        votesReceived[candidate] += 1;
        voters[msg.sender] = true;
    }

    // Function to check if the candidate is valid
    function isValidCandidate(string memory candidate) public view returns (bool) {
        for (uint i = 0; i < candidates.length; i++) {
            if (keccak256(abi.encodePacked(candidates[i])) == keccak256(abi.encodePacked(candidate))) {
                return true;
            }
        }
        return false;
    }

    // Function to get the total votes for a candidate
    function getTotalVotes(string memory candidate) public view returns (uint) {
        require(isValidCandidate(candidate), "Invalid candidate.");
        return votesReceived[candidate];
    }

    // Function to get voting results
    function getVotingResults() public view returns (string[] memory, uint[] memory) {
        uint[] memory results = new uint[](candidates.length);
        for (uint i = 0; i < candidates.length; i++) {
            results[i] = votesReceived[candidates[i]];
        }
        return (candidates, results);
    }
}
