// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;
contract events{
    event deposit(address indexed _from,bytes32 indexed _id,uint _value);
    function Deposit(bytes32 _id) public payable {
        emit deposit(msg.sender,_id,msg.value);

    }
}