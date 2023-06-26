pragma solidity >=0.7.0 <0.9.0;

// Examples:

//base 
abstract contract X {

    //since the function has no implementations, it is marked 'virtual'
    function y() public view virtual returns(string memory);

}

//derived
contract Z is X {
    function y() public override view virtual returns(string memory) {
        return 'hello';
    }
}

//technically the contract is still abstract, since at least 1 function has no body
contract Member {
    string name;
    uint age = 38;

    //because function setName has no body, the contract is abstract
    function setName() public view virtual returns(string memory){}

    function returnAge() public view returns(uint) {
        return age;
    }
}

//derived
contract Teacher is Member {
        function setName() public pure override returns(string memory){
        return 'Gordon';
        }
}


/*
Exercise:
1. Create an abstract base contract called Calculator with a read only public function that returns integers 
2. Create a derived contract called Test which derives the Calculator contract and can calculate 1 + 2 and return the result 
*/

//base
contract Calculator {
    function addIntegers() public virtual view returns(uint){}
}

//derived
contract Test is Calculator {
    function addIntegers() public override pure returns(uint){
            uint a = 1;
            uint b = 2;
            uint result;
            result = a + b;
            return result;
        }

}

//note to self: the method I used above (without labeling as Abstract, generally will cost more in gas, since execution is involved)
