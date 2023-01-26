// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/King/Attacker.sol";
import "src/King/King.sol";

contract KingScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        Attacker attacker = new Attacker{value: 0.001 ether + 1}(payable(address(0x27c37F5184d4A92adcf1Eb68C2A7b5a810a47b17)));
    }
}
