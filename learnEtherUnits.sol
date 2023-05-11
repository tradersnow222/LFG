pragma solidity ^0.8.0;

contract learnEtherUnits {
    
    function test() public pure {
    
    // wei is the smallest denomination of ether    
    assert(1000000000000000000 wei == 1 ether); // 10^18 wei = 1 eth
    assert(1 wei == 1); // 1 wei = 1 
    
    assert(1 ether == 1e18);
    // 1 ether == 1e18
    // create an assertion for 2 eths to be equivalent to weis
    
    assert (2 ether == 3000000000000000000 wei);
    }

    function excercise() public pure {
        assert(1 minutes == 60 seconds); 
        assert(1 hours == 60 minutes);
        assert(1 days == 24 hours);
        assert(1 weeks == 7 days);
    }
}

