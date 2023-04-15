// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {MockSouldbound1155} from "./mocks/MockSouldbound1155.sol";

contract SoulboundTest is Test {
    MockSouldbound1155 public token1155;

    function setUp() public {
        token1155 = new MockSouldbound1155();
    }

    function testSoulboundTokenShouldRevertOnTransfer() public {
        address bob = makeAddr("bob");
        address alice = makeAddr("alice");

        // lets mint a token to bob
        token1155.mint(bob, 1, 1);

        vm.startPrank(bob);

        bytes4 expectedErr = bytes4(abi.encodeWithSignature("errSoulboundToken()"));

        vm.expectRevert(expectedErr);
        token1155.safeTransferFrom(bob, alice, 1, 1, "");

        vm.expectRevert(expectedErr);
        token1155.setApprovalForAll(alice, true);

        uint256[] memory tokens = new uint256[](1);
        uint256[] memory amounts = new uint256[](1);
        tokens[0] = 1;
        amounts[0] = 1;

        vm.expectRevert(expectedErr);
        token1155.safeBatchTransferFrom(bob, alice, tokens, amounts, "");
    }
}
