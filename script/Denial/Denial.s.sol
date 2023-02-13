// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/Denial/Attacker.sol";
import "src/Denial/Denial.sol";

contract DenialScript is Script {
    Denial public denial;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        denial = Denial(payable(0xbaAe431a33700672cF2B58A0d5c5E5d9A73C2f6E));
        vm.startBroadcast(deployerPrivateKey);
        Attacker attacker = new Attacker(0xbaAe431a33700672cF2B58A0d5c5E5d9A73C2f6E);
        denial.setWithdrawPartner(address(attacker));
    }
}
