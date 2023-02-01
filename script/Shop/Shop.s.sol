// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/Shop/Attacker.sol";

contract KingScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        Attacker attacker = new Attacker(0x0DeC868a3819e99BeB1aC428d708D23324C509e6);
        attacker.attack();
    }
}
