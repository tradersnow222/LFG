// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; 

contract SimpleStorage {
    // uints get initialized to 0 if no assignment is given
    uint256 myFavoriteNumber;

    struct Person{
        uint256 favoriteNumber;
        string name; 
    }
    //dynamic array
    Person[] public listOfPeople;    
    mapping(string => uint256) public nameToFavoriteNumber;

    // AllowedList (Caleb & Matt)
    address constant ADDRESS_ONE = 0x410e08B3e64aAc18AE18F2c5066D26e848AC8B9C;
    address constant ADDRESS_TWO = 0xdd1A802c630c6571316acC136790f9857f8337E3;

    // Modifier to restrict access
    modifier onlyAllowedAddresses() {
        require(msg.sender == ADDRESS_ONE || msg.sender == ADDRESS_TWO, "Not allowed to call this function");
        _;
    }

    function store(uint _favoriteNumber) public onlyAllowedAddresses {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return myFavoriteNumber + 1;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public onlyAllowedAddresses {
        listOfPeople.push(Person(_favoriteNumber, _name));
    }
}
