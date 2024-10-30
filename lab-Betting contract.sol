// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;
contract Bettingcontract{
    enum bettingstate{open,closed,resolved}
    bettingstate public state;
    uint8 public winningteam;
struct  Bet{
    uint amount;
    uint8 team;
}
mapping (address=>Bet) public bets;
event BetPlaced(address indexed user, uint amount, uint8 team);
    event BetResolved(uint8 winningteam);
function placebet(uint8 _team) external payable {
    require(state==bettingstate.open,"sorry betting is currently closed");
    require(msg.value>0,"betting amount must be grater than 0");
    require(_team==0 || _team==1 ||_team==2,"invalid team selection");
    bets[msg.sender]=Bet({
        amount:msg.value,
        team:_team
    });
emit BetPlaced(msg.sender, msg.value, _team);
}
function setwinningteam(uint8 _team) external {
    require(state==bettingstate.open,"betting is closed");
    require(_team==0 || _team==1,"invalid team");
    winningteam=_team;
    state=bettingstate.resolved;
    emit BetResolved(_team);
}
function withdraw() external payable {
    require(state==bettingstate.resolved,"beting is not resolved.. in process");
    Bet storage userbet=bets[msg.sender];
    require(userbet.amount>0,"no any bet available");
    require(userbet.team==winningteam,"you did not bet on any winning team ");
    uint winnings=userbet.amount* 3;
    userbet.amount=0;
    payable (msg.sender).transfer(winnings);
}
}