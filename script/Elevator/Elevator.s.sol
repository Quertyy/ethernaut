// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/Elevator/Attacker.sol";

contract ElevatorScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        Attacker attacker = new Attacker(0xD4A07530648F475211A865521088505130Fa828b);
        attacker.attack();
    }
}
