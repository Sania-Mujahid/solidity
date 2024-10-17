// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BookingSite {
    enum BookingType { Bus, Cinema, Railway, Airline, Cricket }

    uint public userIdCounter = 1;
    mapping(address => string) public username;
    mapping(address => uint) public userIds;
    mapping(address => uint) public anonymousIds;
    mapping(address => BookingType[]) public userTicket;

    function createAccount(string memory name, uint randomNumber) public {
        require(userIds[msg.sender] == 0, "User already registered");
        username[msg.sender] = name;
        userIds[msg.sender] = userIdCounter;
        anonymousIds[msg.sender] = userIdCounter + randomNumber;
        userIdCounter++;
    }

    function bookTicket(BookingType ticketType) public {
        require(isRegistered(), "User not registered");
        userTicket[msg.sender].push(ticketType);
    }

    function getAnonymousId() public view returns (uint) {
        require(isRegistered(), "User not registered");
        return anonymousIds[msg.sender];
    }

    function getTicketCount() public view returns (uint) {
        require(isRegistered(), "User not registered");
        return userTicket[msg.sender].length;
    }

    function getUserDetails() public view returns (uint, string memory, uint) {
        require(isRegistered(), "User not registered");
        return (userIds[msg.sender], username[msg.sender], anonymousIds[msg.sender]);
    }

    function isRegistered() public view returns (bool) {
        return userIds[msg.sender] != 0;
    }
}
