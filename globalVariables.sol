pragma solidity ^0.8.0;

contract LedgerBalance {

mapping(address => uint) balance;

function updatesBalance(uint newBalance) public {
    balance[msg.sender] = newBalance;
}

}

contract updated {

    function updateBalance() public {
        LedgerBalance ledgerBalance = new LedgerBalance();
        ledgerBalance.updatesBalance(30);
    }
}

//testing out some other common global variables:

contract simpleStorage {

    uint storedData;

    function set(uint x) public {
        //storedData = x;
        //storedData = block.difficulty;
        //storedData = block.timestamp;
        storedData = block.number;
    }

    function get() public view returns (uint) {
        return storedData;
    }

}
