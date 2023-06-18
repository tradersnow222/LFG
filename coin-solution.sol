pragma solidity >=0.7.0 <0.9.0;

// Only the creator can mint coins
// Anyone can send coins to each other without registering (only need address & amount)

contract Coin {
    //the keyword public is making the variables here accessible from other contracts
    address public minter;
        mapping(address => uint) public balances;
    uint public totalSupply;

        event Sent(address from, address to, uint amount);

        // constructor only runs upon deployment
        constructor() {
            minter = msg.sender;
            totalSupply = 100;
        }

        // make new coins and send them to an address
        // make sure only an owner can send the coins
        function mint(address receiver, uint amount) public {
            require(msg.sender == minter); // only allow contract creator to mint
            balances[receiver] += amount; // increase receiver balance
            totalSupply += amount; // increase the total supply

        }

        // send any amount of coins to an existing address
        
        error insufficientBalance(uint request, uint available);
        
       function send(address receiver, uint amount) public {
        if (amount > balances[msg.sender])
            revert insufficientBalance({
                request: amount,
                available: balances[msg.sender]
            });

        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);

        }
}
