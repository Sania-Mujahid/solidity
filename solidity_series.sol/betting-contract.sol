// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BettingContract {
    enum BettingState { Open, Closed, Resolved }
    enum Team { TeamA, TeamB }
    
    struct Bet {
        uint amount;
        Team team;
    }
    
    address public owner;
    BettingState public currentState;
    Team public winningTeam;
    mapping(address => Bet) public bets;
    
    event BetPlaced(address indexed bettor, uint amount, Team team);
    event BetResolved(Team winningTeam);
    event Withdrawal(address indexed bettor, uint amount);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner.");
        _;
    }
    
    constructor() {
        owner = msg.sender;
        currentState = BettingState.Open;
    }
    
    function placeBet(Team _team) external payable {
        require(currentState == BettingState.Open, "Betting is not open.");
        require(msg.value > 0, "Bet amount must be greater than zero.");
        
        // Save user's bet
        bets[msg.sender] = Bet(msg.value, _team);
        
        emit BetPlaced(msg.sender, msg.value, _team);
    }
    
    function withdraw() external {
        require(currentState == BettingState.Resolved, "Betting is not resolved yet.");
        Bet memory userBet = bets[msg.sender];
        
        require(userBet.amount > 0, "No bet placed.");
        
        if (userBet.team == winningTeam) {
            uint amountToWithdraw = userBet.amount * 2;  // Simple doubling logic for winners
            bets[msg.sender].amount = 0;  // Reset the user's bet amount to prevent re-entry
            payable(msg.sender).transfer(amountToWithdraw);
            
            emit Withdrawal(msg.sender, amountToWithdraw);
        } else {
            revert("You did not win.");
        }
    }
    
    function resolve(Team _winningTeam) external onlyOwner {
        require(currentState == BettingState.Closed, "Betting is not closed.");
        winningTeam = _winningTeam;
        currentState = BettingState.Resolved;
        
        emit BetResolved(_winningTeam);
    }
    
    function closeBetting() external onlyOwner {
        require(currentState == BettingState.Open, "Betting is not open.");
        currentState = BettingState.Closed;
    }
}
