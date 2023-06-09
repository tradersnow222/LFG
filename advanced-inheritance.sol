pragma solidity >=0.7.0 <0.9.0;


/*
Observe: The contract in Solidity is similar to a Class in C++ - a blueprint for an object 

Classes can inherit and so can contracts!

    Constructor − A special function declared with constructor keyword which will be 
    executed once per contract and is invoked when a contract is created.
    
    Exercise: 
    Create two contracts: A and B
    1. Contract A should have a state var called innerVal initialized to 100.
    2. Create a fully accessible function called innerAddTen which returns 10 to any given input
    3. Contract B should inherit from contract A 
    4. Contract B should have a function called outerAddTen which returns 
    the calucaltion from innerAddTen function in Contract A to any given input
    5. Create a function in contract B which returns the value of innerVal from contract A
    6. Compile and successfully deploy the contract and test the results.
    */


contract A {
    uint innerVal = 100;

    function innerAddTen(uint val) public pure returns(uint) {
        return val + 10;

    }

}

contract B is A {

    function outerAddTen(uint val) public pure returns(uint) {
        return innerAddTen(val);
    }

    function getInnerVal() public view returns(uint) {
        return A.innerVal;
    }

}

