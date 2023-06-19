// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./polyPool.sol";

contract POLYFactory {

    
    constructor() {
        
    }

    function createNewPool() external returns (address pool) {
        bytes memory bytecode = type(POLYPool).creationCode;

        assembly {
            pool := 
        }
    }
}