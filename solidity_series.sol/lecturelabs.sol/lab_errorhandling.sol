// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;
contract Account{
    uint256 public balnace;
    constructor(){
        balnace=0;
        }
        function deposit(uint256 amount) public {
            require(amount>0,"amount must be positive");
             require(balnace+amount>=balnace,"overflow");
             balnace=amount+balnace;
        }
        function withdraw(uint256 amount) public {
            require(amount>0,"amount must be positive");
            require(balnace>=amount,"you canot do that");
            balnace=amount-balnace;
        }

        }
