// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

contract MagicNum {

  address public solver;

  constructor() {}

  function setSolver(address _solver) public {
    solver = _solver;
  }

  /*
    ____________/\\\_______/\\\\\\\\\_____        
     __________/\\\\\_____/\\\///////\\\___       
      ________/\\\/\\\____\///______\//\\\__      
       ______/\\\/\/\\\______________/\\\/___     
        ____/\\\/__\/\\\___________/\\\//_____    
         __/\\\\\\\\\\\\\\\\_____/\\\//________   
          _\///////////\\\//____/\\\/___________  
           ___________\/\\\_____/\\\\\\\\\\\\\\\_ 
            ___________\///_____\///////////////__
  */
}

contract Solver {
    function whatIsTheMeaningOfLifeNormal() external pure returns (uint256) {
        return 42;
    }

    function whatIsTheMeaningOfLife() external pure returns (uint256) {
        assembly {
            mstore(0x00, 0x2a) // store 42 at memory address 0x00 //  PUSH1 Ox2a PUSH1 Ox00 MSTORE // 0x602a600052
            return(0x00, 0x20) // return 32 bytes from memory address // 0x00 PUSH1 Ox20 PUSH1 Ox00 RETURN // 0x60206000F3
            // 0x602a60005260206000F3
            // CODECOPY(t,f,s) (destination in memory, current position in code, length of code to copy)
            // CODECOPY(0x00, 0x00, 0x0a)   
        }
    }
}

contract MagicNumberScript is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        MagicNum magicNum = MagicNum(0x378Fbf60B78310b8c1f024fA3Fc90a8B5c64AB70);
        bytes memory data = "\x60\x0a\x60\x0c\x60\x00\x39\x60\x0a\x60\x00\xf3\x60\x2a\x60\x80\x52\x60\x20\x60\x80\xf3";
        address solver;

        assembly {
            solver := create(0, add(data, 0x20), mload(data))
        }
        magicNum.setSolver(solver);
        vm.stopBroadcast();
    }
}
