// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {SvgRender} from "src/SvgRender.sol";
import {Badges1155} from "src/Badges1155.sol";
import {ECDSA} from "openzeppelin-contracts/contracts/utils/cryptography/ECDSA.sol";

/**
 * // JS sample
 *     const signer = new ethers.Wallet(KEY-minterKey);
 *
 *     const hashed = ethers.utils.solidityKeccak256(
 *         ['address', 'address', 'address', 'bytes32', 'bytes32', 'bytes32'],
 *         [
 *         contractAddress,
 *         challenge,
 *         player,
 *         title,
 *         challengeName,
 *         challengeDescription
 *         ]);
 *
 *     const signature = await wallet.signMessage(ethers.utils.arrayify(hashed))
 */

contract SoulboundTest is Test {
    Badges1155 badge;

    address deployer = makeAddr("deployer");

    address minter;
    uint256 minterKey;

    address challenge = makeAddr("challenge");
    address player = makeAddr("player");

    function setUp() public {
        (minter, minterKey) = makeAddrAndKey("minter");

        vm.startPrank(deployer);
        badge = new Badges1155();

        badge.addMinter(minter);

        vm.stopPrank();
    }

    function testBadUri() public {
        vm.expectRevert("challenge does not exist");
        console.log(badge.uri(2));
    }

    function testMint() public {
        // the hash to claim the badge is;
        // badge contract address
        // challenge address (will be used to verify the challenge id)
        // the player address (will receive the nft)
        // the title (recommended, CTF grup name #number), example "Ethernaut #1"
        // the challenge name
        // the challenge description

        bytes32 hash = keccak256(
            abi.encodePacked(
                address(badge),
                challenge,
                player,
                bytes32("Ethernaut #1"),
                bytes32("Fallback"),
                bytes32("Drain the contract to win")
            )
        );
        bytes32 message = ECDSA.toEthSignedMessageHash(hash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(minterKey, message);
        bytes memory signature = abi.encodePacked(r, s, v);

        assertEq(badge.balanceOf(player, 1), 0, "player should not have the badge");

        // lets mint the badge
        badge.mint(
            player,
            challenge,
            bytes32("Ethernaut #1"),
            bytes32("Fallback"),
            bytes32("Drain the contract to win"),
            signature
        );

        assertEq(badge.balanceOf(player, 1), 1, "player should have the badge");

        vm.expectRevert(bytes4(abi.encodeWithSignature("errCantMintMoreThanOnce()")));
        badge.mint(
            player,
            challenge,
            bytes32("Ethernaut #1"),
            bytes32("Fallback"),
            bytes32("Drain the contract to win"),
            signature
        );

        vm.expectRevert(bytes4(abi.encodeWithSignature("errWrongSignature()")));
        badge.mint(
            address(this),
            challenge,
            bytes32("Ethernaut #1"),
            bytes32("Fallback"),
            bytes32("Drain the contract to win"),
            signature
        );
        vm.expectRevert(bytes4(abi.encodeWithSignature("errWrongSignature()")));
        badge.mint(
            address(this),
            challenge,
            bytes32("Ethernaut #1"),
            bytes32("Fallback"),
            bytes32("Drain the contract to win"),
            signature
        );

        console.log(badge.uri(1));
    }
}
