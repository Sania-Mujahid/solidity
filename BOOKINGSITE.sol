// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

contract BOOKINGsite {
    enum bookingtype {bus, cinema, airline, railway, cricket}
    
    struct user {
        uint256 userid;
        string name;
        uint8 age;
        string contactdetails;
    }
    
    struct busbooking {
        string busorigin;
        string busnumber;
        string busdestination;
        uint256 dateofjourney;
        uint8 seatnumber;
    }
    
    struct cinemabooking {
        string moviename;
        string cinemahall;
        uint256 showtime;
        uint8 seatnumber;
    }
    
    struct airlinebooking {
        string flightnumber;
        string origin;
        string destination;
        uint256 dateofJourney;
        string seatclass;            
    }
    
    struct railwaybooking {
        string trainnumber;
        string origin;
        string destination;
        uint256 dateofJourney;
        uint8 seatnumber;
    }
    
    struct cricketbooking {
        string matchdetails;
        string stadium;
        uint256 matchdate;
        uint8 seatnumber;
    }
    
    struct booking {
        uint256 bookingid;
        bookingtype Bookingtype;
        user User;
        busbooking Busbooking;
        cinemabooking Cinemabooking;
        airlinebooking Airlinebooking;
        railwaybooking Railwaybooking;
        cricketbooking Cricketbooking;
    }
    
    uint256 private bookingCounter;
    mapping(uint256 => booking) public bookings;
    
    function bookBusTicket( 
        uint256 _userid, 
        string memory _name, 
        uint8 _age, 
        string memory _contactdetails, 
        string memory _busnumber, 
        string memory _origin, 
        string memory _destination, 
        uint256 _dateofjourney, 
        uint8 _seatnumber
    ) public {
        bookingCounter++;
        user memory newuser = user({
            userid: _userid,
            name: _name,
            age: _age,
            contactdetails: _contactdetails
        });
        
        busbooking memory newBusbooking = busbooking({
            busorigin: _origin,
            busnumber: _busnumber,
            busdestination: _destination,
            dateofjourney: _dateofjourney,
            seatnumber: _seatnumber
        });
        
        booking memory newbooking = booking({
            bookingid: bookingCounter,
            Bookingtype: bookingtype.bus,
            User: newuser,
            Busbooking: newBusbooking,
            Cinemabooking: cinemabooking("", "", 0, 0),
            Airlinebooking: airlinebooking("", "", "", 0, ""),
            Railwaybooking: railwaybooking("", "", "", 0, 0),
            Cricketbooking: cricketbooking("", "", 0, 0)
        });
        
        bookings[bookingCounter] = newbooking;
    }
    function bookcinematicket(
    uint256 _userid,               
    string memory _name,            
    uint8 _age,                     
    string memory _contactdetails,  
    string memory _moviename,       
    string memory _cinemahall,    
    uint256 _showtime,              
    uint8 _seatnumber             
) public {
    bookingCounter++;
    user memory newuser=user({
         userid: _userid,
        name: _name,
        age: _age,
        contactdetails: _contactdetails
    });
    cinemabooking memory newcinemabooking=cinemabooking({
    moviename:_moviename,       
    cinemahall: _cinemahall,    
    showtime:_showtime,              
    seatnumber:_seatnumber      
    });
    booking memory newbooking=booking({
        bookingid: bookingCounter,
        Bookingtype:bookingtype.cinema,
        User:newuser,
        Busbooking: busbooking("", "", "", 0, 0),
            Cinemabooking: newcinemabooking,
            Airlinebooking:airlinebooking("", "", "", 0, ""),
            Railwaybooking: railwaybooking("", "", "", 0, 0),
            Cricketbooking: cricketbooking("", "", 0, 0)
    });
    bookings[bookingCounter]=newbooking;

}
    function bookairlineticket(
        uint256 _userid,
        string memory _name,
        uint8 _age,
        string memory contactdetails,
        string memory _flightnumber,
        string memory _origin,
        string memory _destination,
        uint256 _dateofJourney,
        string memory _seatclass 
    ) public {
        bookingCounter++;
        user memory newuser = user({
            userid: _userid,
            name: _name,
            age: _age,
            contactdetails: contactdetails
        });
        
        airlinebooking memory newairlinebooking = airlinebooking({
            flightnumber: _flightnumber,
            origin: _origin,
            destination: _destination,
            dateofJourney: _dateofJourney,
            seatclass: _seatclass
        });
        
        booking memory newbooking = booking({
            bookingid: bookingCounter,
            Bookingtype: bookingtype.airline,
            User: newuser,
            Busbooking: busbooking("", "", "", 0, 0),
            Cinemabooking: cinemabooking("", "", 0, 0),
            Airlinebooking: newairlinebooking,
            Railwaybooking: railwaybooking("", "", "", 0, 0),
            Cricketbooking: cricketbooking("", "", 0, 0)
        });
        
        bookings[bookingCounter] = newbooking;
    }
    
    function bookrailwayticket(
        uint256 _userid,
        string memory _name,
        uint8 _age,
        string memory _contactdetails,
        string memory _trainnumber,
        string memory _origin,
        string memory _destination,
        uint256 _dateofJourney,
        uint8 _seatnumber
    ) public {
        bookingCounter++;
        user memory newuser = user({
            userid: _userid,
            name: _name,
            age: _age,
            contactdetails: _contactdetails
        });
        
        railwaybooking memory newrailwaybooking = railwaybooking({
            trainnumber: _trainnumber,
            origin: _origin,
            destination: _destination,
            dateofJourney: _dateofJourney,
            seatnumber: _seatnumber
        });
        
        booking memory newbooking = booking({
            bookingid: bookingCounter,
            Bookingtype: bookingtype.railway,
            User: newuser,
            Busbooking: busbooking("", "", "", 0, 0),
            Cinemabooking: cinemabooking("", "", 0, 0),
            Airlinebooking: airlinebooking("", "", "", 0, ""),
            Railwaybooking: newrailwaybooking,
            Cricketbooking: cricketbooking("", "", 0, 0)
        });
        
        bookings[bookingCounter] = newbooking;
    }
    
    function bookcricketticket(
        uint256 _userid,
        string memory _name,
        uint8 _age,
        string memory _contactdetails,
        string memory _matchdetails,
        string memory _stadium,
        uint256 _matchdate,
        uint8 _seatnumber
    ) public {
        bookingCounter++;
        user memory newuser = user({
            userid: _userid,
            name: _name,
            age: _age,
            contactdetails: _contactdetails
        });
        
        cricketbooking memory newcricketbooking = cricketbooking({
            matchdetails: _matchdetails,
            stadium: _stadium,
            matchdate: _matchdate,
            seatnumber: _seatnumber
        });
        
        booking memory newbooking = booking({
            bookingid: bookingCounter,
            Bookingtype: bookingtype.cricket,
            User: newuser,
            Busbooking: busbooking("", "", "", 0, 0),
            Cinemabooking: cinemabooking("", "", 0, 0),
            Airlinebooking: airlinebooking("", "", "", 0, ""),
            Railwaybooking: railwaybooking("", "", "", 0, 0),
            Cricketbooking: newcricketbooking
        });
        
        bookings[bookingCounter] = newbooking;
    }
}
