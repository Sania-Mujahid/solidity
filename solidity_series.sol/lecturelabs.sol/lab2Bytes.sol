// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17; 
contract darray {
uint256[] myarray;

function addtoarray(uint256 number) public returns (uint256, uint256)
{
myarray.push(number);
return (number, myarray.length);
}
function getarrayvalue(uint256 index) public view returns (uint256){
return myarray[index];
 }
 function popValue() public	{
myarray.pop();
 }
 function deleteItem(uint256 index) public	{

delete myarray[index];
 }
 }