// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MyContract} from "../src/MyContract.sol";
import {Test,console} from "forge-std/Test.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";

contract MyContractTest is Test {
    MyContract exampleContract;

    function setUp() public {
        exampleContract = new MyContract();
        targetContract(address(exampleContract));
    }

    function testIsAlwaysZeroUnit() public {
        uint256 data = 0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    function testWrongIsAlwaysZeroUint() public {
        uint256 data = 2;
        exampleContract.doStuff(data);
        assertFalse(exampleContract.shouldAlwaysBeZero() == 0);
    }

    function testIsAlwaysZeroFuzz(uint256 randomData) public {
        exampleContract.doStuff(randomData);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    function testIsAlwaysZeroUintManyCalls() public {
        uint256 data = 7;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);

        data = 0;
        exampleContract.doStuff(data);
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }

    function invariant_testAlwaysReturnsZero() public {
        assert(exampleContract.shouldAlwaysBeZero() == 0);
    }


}

