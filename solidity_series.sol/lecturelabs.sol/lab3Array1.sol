// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Fixedsize{
     //fixed array of size 4
    uint[4] public arr1;
    constructor() {
        // Convert the 0th and 3rd element of arr1 into 2 and 10 respectively
        arr1[0] = 2;
        arr1[3] = 10;
    }
    function getarr1() public view returns (uint[4] memory)
    {
        return arr1;
    }
}