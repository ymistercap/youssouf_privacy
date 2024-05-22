// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "src/Privacy.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";

contract PrivacyDeploy is Script {
    function run() external {
        vm.startBroadcast();

        bytes32[3] memory initData = [
            keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender, uint256(1))),
            keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender, uint256(2))),
            keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender, uint256(3)))
        ];

        Privacy privacyInstance = new Privacy(initData);
        console.log("Privacy deployed at:", address(privacyInstance));
        vm.stopBroadcast();
    }
}
