// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "src/Telephone/Attack.sol";

contract TelephoneScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Attacker attacker = new Attacker(0xa75030A6a1Cc5a102136C13f682792235Ea37A86);
    }
}
