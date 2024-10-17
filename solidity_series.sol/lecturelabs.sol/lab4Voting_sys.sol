// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    // Define an enum for voting options
    enum VoteOption { Yes, No }

    // Variable to store the vote
    VoteOption public vote;

    // Constructor to initialize vote to No by default
    constructor() {
        vote = VoteOption.No;
    }

    // Function to vote Yes
    function voteYes() public {
        vote = VoteOption.Yes;
    }

    // Function to vote No
    function voteNo() public {
        vote = VoteOption.No;
    }

    // Function to get the current vote status
    function getCurrentVote() public view returns (string memory) {
        if (vote == VoteOption.Yes) {
            return "Yes";
        } else {
            return "No";
        }
    }
}
