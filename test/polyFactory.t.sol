// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/polyFactory.sol";

contract POLYFactoryTest is Test {
    // a user would first mint a pool
    // then store assets, then configure the pool
    // users can then use the ui to buy sell and trade but cant provide on an existing pool
    POLYFactory public factory;

    // function setUp() public {
    //     counter = new Counter();
    //     counter.setNumber(0);
    // }

    // function testIncrement() public {
    //     counter.increment();
    //     assertEq(counter.number(), 1);
    // }

    // function testSetNumber(uint256 x) public {
    //     counter.setNumber(x);
    //     assertEq(counter.number(), x);
    // }
}
