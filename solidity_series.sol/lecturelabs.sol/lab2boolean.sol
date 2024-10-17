
   // SPDX-License-Identifier: MIT
   // compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.0;

contract ANDGate {

    // Function to simulate AND gate logic using boolean values
    function andGate(bool A, bool B) public pure returns (bool) {
        // Return the result of A AND B
        return A && B;
    }
}


