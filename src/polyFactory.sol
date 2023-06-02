// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./polyPool.sol";

contract POLYFactory {
    // existing implementation of a pool contract
    POLYPool public immutable poolImplementation;

    constructor(address _poolImplementation) {
        poolImplementation = POLYPool(_poolImplementation);
    }
}