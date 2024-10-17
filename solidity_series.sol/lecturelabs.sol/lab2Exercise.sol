// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ArrayOperations {
    uint[] public arr;  // Declare a dynamic array

    // Function to get the length of the array
    function getLength() public view returns (uint) {
        return arr.length;
    }

    // Function to add a value to the array
    function pushValue(uint _value) public {
        arr.push(_value);  // Adds the value to the array and increases its length
    }

    // Function to remove the last value from the array
    function popValue() public {
        require(arr.length > 0, "Array is already empty");
        arr.pop();  // Removes the last element and decreases the length
    }

    // Function to delete a specific element at index _index
    function deleteValue(uint _index) public {
        require(_index < arr.length, "Index out of bounds");
        delete arr[_index];  // Sets the value at index _index to its default value (0 for uint)
    }

    // Function to delete the entire array
    function deleteArray() public {
        delete arr;  // Deletes the array, converting it into an empty dynamic array
    }

    // Function to return the entire array
    function getArray() public view returns (uint[] memory) {
        return arr;  // Returns the dynamic array
    }

    // Function to get a specific element at index _index
    function getElement(uint _index) public view returns (uint) {
        require(_index < arr.length, "Index out of bounds");
        return arr[_index];  // Returns the value at the specified index
    }
}
