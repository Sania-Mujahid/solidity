// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;
contract payables{
    address payable public owner;
    constructor(){
        owner=payable (msg.sender);
    }
    function getbalance() public view returns (uint){
        return address(this).balance;
    }
    function tranferether(address payable _to,uint _amount)  public {
        require(msg.sender == owner, "Only owner can transfer funds");
        require(address(this).balance >= _amount, "Insufficient contract balance");
        _to.transfer(_amount);
    }
}