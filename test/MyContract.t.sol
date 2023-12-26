// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import  {MyContract} from "../src/MyContract.sol";
import {Test} from "forge-std/Test.sol";


contract MyContractTest is Test {
    MyContract exampleContract = new MyContract();

    function testIsAlwaysZeroUnit() public {
        uint256 data = 0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }
}