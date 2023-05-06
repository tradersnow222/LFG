pragma solidity ^0.8.18;

contract learnMapping {

    // KEY and VALUE - 
    // - key can be string uint or bool 
    // - value can be anything

    mapping(address => uint) public myMap;

        function getAddress(address _addr) public view returns(uint) {
            return myMap[_addr];
        }

        function setAddress(address _addr, uint _i) public {
            myMap[_addr] = _i;
        }

        function removeAddress(address _addr) public {
            delete myMap[_addr];
        }
 }

// EXERCISE:
    // 0. Create a unique data type as a struct called Movie and give it the string properties: title and diretor.
    // 1. Create a map called movie which takes a uint as a key and Movie as a value 
    // 2. create a function called addMovie which takes three inputs, movie id, title and director which 
    // assigns a value of an integer to a movie added back to the movie map. It should include a title and director name.
    // 3. Deploy the contract and update the movie information to the movie map with our favorite movies! 

contract movieMap {

    struct Movie {
        string title;
        string director;
    }
    mapping(uint => Movie) public movie;
    mapping(address => mapping(uint => Movie)) public  myMovie;

       function addMovie(uint id, string memory title, string memory director) public {
        movie[id] = Movie(title, director);
       }

        function addMyMovie(uint id, string memory title, string memory director) public {
        myMovie[msg.sender][id] = Movie(title, director);

        /* msg.sender = global variable, accessible throughout solidity which captures the address that
        is calling the contract
        */
}
        }

//EXERCISE #2 - Nested Mapping:

/*
Observe the following contract which has functionality to remove a spender address paired with an owner address:

pragma solidity ^0.8.0;
 
contract allowance {
 
    //this function removes the spenders allowance
    function remove(address _addrOwner, address _addrSpender) public {
        delete allowance[_addrOwner][_addrSpender];
    }
}
Your assignment is to build out the rest of the contract functionality. 

- Create a Contract, using nested mapping, to pair two contract addresses together (an address owner and an address spender) 
with a value of integers to keep track of their index.

- Once you have successfully set up the map, add additional contract functionality so that 
the contract can pair up new addresses together (owner and spender) as well as retrieve their mapping value.
*/

