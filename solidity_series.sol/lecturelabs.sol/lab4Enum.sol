// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Weekdays {
    // Define an enum for the days of the week
    enum Day { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

    // Variable to store the current day
    Day public currentDay;

    // Setter functions for each day of the week
    function setMonday() public {
        currentDay = Day.Monday;
    }

    function setTuesday() public {
        currentDay = Day.Tuesday;
    }

    function setWednesday() public {
        currentDay = Day.Wednesday;
    }

    function setThursday() public {
        currentDay = Day.Thursday;
    }

    function setFriday() public {
        currentDay = Day.Friday;
    }

    function setSaturday() public {
        currentDay = Day.Saturday;
    }

    function setSunday() public {
        currentDay = Day.Sunday;
    }

    // Function to get the current day as a string
    function getCurrentDay() public view returns (string memory) {
        if (currentDay == Day.Sunday) {
            return "Holiday";
        }
        if (currentDay == Day.Monday) {
            return "Monday";
        }
        if (currentDay == Day.Tuesday) {
            return "Tuesday";
        }
        if (currentDay == Day.Wednesday) {
            return "Wednesday";
        }
        if (currentDay == Day.Thursday) {
            return "Thursday";
        }
        if (currentDay == Day.Friday) {
            return "Friday";
        }
        if (currentDay == Day.Saturday) {
            return "Saturday";
        }
        return ""; // Default case (this should never be hit)
    }
}
