// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;
contract DYNAMICArray{
    //dynamic array
    string[] public arr2;
     // Function to fill the array with your complete name
    function fillarr2() public {
    // fill the array with your complete name
        arr2.push("Sania");
        arr2.push("Mujahid");
        arr2.push("Dewaan");
    }
    //function to get the length of arr2
   function getlength() public view returns(uint)
   {
return arr2.length;
   } 
   //Using pop(), remove the last name (Dewaan)
    function removeLastName() public {
        require(arr2.length > 0, "Array is empty");
        arr2.pop();
    }
    function getarr2() public view returns (string memory)
    {
         require(arr2.length > 0, "Array is empty");
        return arr2[0];
    }
    }
