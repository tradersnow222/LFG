// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

library Search{
    function indexOf(uint[] storage self, uint value) public view returns(uint) {
        for(uint i=0; i<self.length; i++) if(self[i] == value) return i;
    }
}

contract Test{
    uint [] data;
    constructor() {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function isValuePresent(uint val) external view returns(uint) {
        uint value = val;
        uint index = Search.indexOf(data, value);
        return index;
    }
}

/*
The directive using 'A for B'; can be used to attach library functions of library A to a given type B.
These functions will use the caller type as their first parameter (identified using self).

---------
Exercise: 
---------
1. Copy over the library Search and the contract Test below
and rename library Search to Search2 and contract Test to Test2. 

2. Using the A for B library pattern assign the new library to an empty array type 
and
rewrite the code so that we can run the same search hardcoded this time to the value of 4
accordingly.  
*/

library Search2{
    function indexOf(uint[] storage self, uint value) public view returns(uint) {
        for(uint i=0; i<self.length; i++) if(self[i] == value) return i;
    }
}

contract Test2{
    using Search2 for uint[];
    uint [] data;
    constructor() {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function isValuePresent() external view returns(uint) {
        uint value = 4;
        uint index = Search.indexOf(data, value);
        return index;
    }
}
