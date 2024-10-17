// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17; 
contract eventticket{
uint256 public numberoftickets;
uint256 public ticprice;
uint256 public ticketamount;
uint256 public ticstarttime;
uint256 public ticendtime;
uint256 public timerange;
string public message ="buy your first event ticket";
constructor(uint256 _ticprice)
{
    ticprice=_ticprice;
    ticstarttime=block.timestamp;
    ticendtime=block.timestamp + 7 days;
    timerange=(ticendtime-ticstarttime)/60/60/24;
}
function buyticket(uint256 _value) public returns(uint256 ticketid){
    numberoftickets++;
    ticketamount +=_value;
    ticketid=numberoftickets;
    }
    function gettotalamount() public view returns(uint256){
        return ticketamount;
    }
}