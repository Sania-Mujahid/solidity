// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;
contract Array {
    int[4] public array;//fixed size array
    /*
    1.push() canot be used with fixed array
    2.multiple arguments using single push()
    3.Return types "memory,calldata" must be used
    4.mismatch return types
    */
    function ipush() public {
        array[0] = -5;  // Manually assign values to the fixed-size array
        array[1] = 0;
        array[2] = 5;//only one argument at a time even in dynamic arry
        array[3] = 10;
    }

    function get() public view returns (int[4] memory) {  // Return fixed-size array with the memory
    // keyword
        return array;
    }

    function getlength() public view returns (uint)//length canot be negative so it must have 
    //return type uin instead of in
     { 
         // Return the length of the fixed-size array
        return array.length;
    }
}
