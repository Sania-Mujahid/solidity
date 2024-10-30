// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

contract BettingContract {
    // Define betting states using enum
    enum BettingState { Open, Closed, Resolved }
    BettingState public state;
    
    // Owner of the contract
    address public owner;
    
    // Store the winning team
    uint8 public winningTeam;
    
    // Betting struct to store bet details
    struct Bet {
        uint amount;
        uint8 team;
    }
    
    // Mapping to track user bets
    mapping(address => Bet) public bets;
    
    // Events for logging important actions
    event BetPlaced(address indexed user, uint amount, uint8 team);
    event BetResolved(uint8 winningTeam);
    event WinningsWithdrawn(address indexed user, uint amount);
    
    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }
    
    // Constructor to set the owner and initial state
    constructor() {
        owner = msg.sender;
        state = BettingState.Open; // Betting starts in the "Open" state
    }

    // Function to place a bet
    function placeBet(uint8 _team) external payable {
        require(state == BettingState.Open, "Betting is currently closed");
        require(msg.value > 0, "Betting amount must be greater than 0");
        require(_team == 0 || _team == 1, "Invalid team selection");
        
        bets[msg.sender] = Bet({
            amount: msg.value,
            team: _team
        });
        
        emit BetPlaced(msg.sender, msg.value, _team);
    }
    
    // Function for the owner to resolve the bet and declare a winner
    function setWinningTeam(uint8 _team) external onlyOwner {
        require(state == BettingState.Open, "Betting is already closed or resolved");
        require(_team == 0 || _team == 1, "Invalid team");
        
        winningTeam = _team;
        state = BettingState.Resolved;
        
        emit BetResolved(_team);
    }
    
    // Function to withdraw winnings
    function withdrawWinnings() external {
        require(state == BettingState.Resolved, "Betting has not been resolved yet");
        
        Bet storage userBet = bets[msg.sender];
        require(userBet.amount > 0, "You did not place any bet");
        require(userBet.team == winningTeam, "You did not bet on the winning team");
        
        uint winnings = userBet.amount * 3; // 3x payout for winners
        userBet.amount = 0; // Reset the user's bet amount
        
        payable(msg.sender).transfer(winnings);
        
        emit WinningsWithdrawn(msg.sender, winnings);
    }
    
    // Fallback function to prevent accidental ETH transfer
    fallback() external payable {
        revert("Please use placeBet to send ETH");
    }
    
    receive() external payable {
        revert("Direct transfers not allowed, use placeBet");
    }
}
