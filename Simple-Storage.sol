// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; 

contract SimpleStorage {

    // uints get initialized to 0 if no assignment is given
    uint256 public favoriteNumber;

    function store(uint _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

     function retrieve() public view returns(uint256){
         return favoriteNumber + 1;
     }
}

