// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Privacy.sol";
import {Test, console} from "forge-std/Test.sol";

contract PrivacyTest is Test {
    Privacy public privacyContract;

    address public constant USER = address(2);
    uint256 public constant STARTING_USER_BALANCE = 10 ether;

    function setUp() public {

        privacyContract = new Privacy();

        vm.deal(USER, STARTING_USER_BALANCE);
    }

    function run() external{
        vm.prank(USER);
        vm.startBroadcast();
        bytes32 myKey = vm.load(address(privacyContract), bytes32(uint256(5)));
        privacyContract.unlock(bytes16(myKey));
        vm.stopBroadcast();
    }
}