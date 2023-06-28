// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

/*
Exercise: Interfaces with Uniswap (Decentralized Exchange)
In Uniswap each Uniswap smart contract, or pair, manages a liquidity pool made up of reserves of two ERC-20 tokens!
In this exercise you are going to use the IDE to speak to Uniswap and get the reserves of a Uniswap pair of your choosing :0 

These are the instructions in order to complete this exercise:
1. Create two interfaces which each hold separate function signatures which you must look up in the Solidity docs V2 
2. One interface will be called UniswapV2Factory which will contain the function signature that gets pairs.
3. Another interface will be called UniswapV2Pair with will contain the function signature to get reserve values. 
4. Create a contract which contains addresses of the paired tokens you choose as well as the factory address.
5. Within the contract make a function which can successfully get the pair of your tokens and set it to a single address
6. Use that address to get the reserve values and finally return the reserve values 
7. Switch to Mainnet and connect MetaMask but DO NOT deploy the contract (or you will spend money!!!)
8. From the Mainnet manually go through the steps of retrieving the values without deploying or spending gas!
9. Post your results of the reserve values in our Discord community and celebrate beacuse you have seriously earned it! 
10. Good luck! 
*/


interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns (address pair);
    }

interface UniswapV2Pair {
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract myContract {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private tokenA = 0x111111111117dC0aa78b770fA6A738034120C302;
    address private tokenB = 0xdAC17F958D2ee523a2206206994597C13D831ec7;

    function getReserveValues() external view returns (uint112, uint112) {
        address pair = UniswapV2Factory(factory).getPair(tokenA, tokenB);
        (uint112 reserve0, uint112 reserve1,) = UniswapV2Pair(pair).getReserves();
        return(reserve0, reserve1);
    }
}

/* Proof of successful test deployment: <https://ibb.co/Z1CXJyf>


------------------------------------------------------------------------------------------------
Practice:

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {
        function count() external view returns(uint);
        function increment() external;
}

contract MyContract {
        function incrementCounter(address _counter) external {
            ICounter(_counter).increment();
        }
        function getCount(address _counter) external view returns(uint) {
            return ICounter(_counter).count();
        }
}

*/


