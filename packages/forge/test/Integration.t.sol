// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import {Badges1155} from "src/Badges1155.sol";
import {ChallengeManager} from "src/challenges/ChallengeManager.sol";

import {FactoryGuessTheNumberChallenge} from "src/challenges/CTE/Lottery1.sol";

import {ECDSA} from "openzeppelin-contracts/contracts/utils/cryptography/ECDSA.sol";

contract IntegrationTest is Test {
    Badges1155 badge;
    ChallengeManager challengeManager;

    FactoryGuessTheNumberChallenge challenge1;

    address deployer = makeAddr("deployer");

    address minter;
    uint256 minterKey;

    address player = makeAddr("player");

    function setUp() public {
        (minter, minterKey) = makeAddrAndKey("minter");

        vm.startPrank(deployer);
    
        // lets deploy the badge ERC1155
        badge = new Badges1155();

        // lets add the minter
        badge.addMinter(minter);

        // lets deploy the challenge manager
        challengeManager = new ChallengeManager();

        // now lets deploy the challenges
        challenge1 = new FactoryGuessTheNumberChallenge();

        vm.stopPrank();
    }

    
    function testMint() public {
        // user have to deploy a challenge
        vm.startPrank(player);
        challengeManager.deployChallenge(address(challenge1));


        address[] memory deployedContracts = challengeManager.getChallengesInstances(player, address(challenge1));
        
        // 0xcF9F374922476C09607b9dcFF1fCA397BABE0b0C deterministic address of deployed contract
        assertEq(deployedContracts[0], 0xcF9F374922476C09607b9dcFF1fCA397BABE0b0C, "challenge should be deployed at exepcted address");

        assertEq(challengeManager.checkChallenge(player, address(challenge1)), false, "challenge should not be complete");
        
        // lets break the challenge
        vm.expectRevert("Challenge has not been pass");
        challengeManager.breakChallenge(address(challenge1));

        // ok now lets try to breakit again, but first solve it
        address(deployedContracts[0]).call(abi.encodeWithSignature("guess(uint8)", 42));

        challengeManager.breakChallenge(address(challenge1));

        vm.stopPrank();

        // ok we pass the challenge now the backend will gives us thhe signature to mint the badge

        
        bytes32 hash = keccak256(
            abi.encodePacked(
                address(badge),
                address(challenge1),
                player,
                bytes32(bytes(challenge1.title())),
                bytes32(bytes(challenge1.name())),
                bytes32(bytes(challenge1.description()))
            )
        );
        bytes32 message = ECDSA.toEthSignedMessageHash(hash);

        (uint8 v, bytes32 r, bytes32 s) = vm.sign(minterKey, message);
        bytes memory signature = abi.encodePacked(r, s, v);

        assertEq(badge.balanceOf(player, 1), 0, "player should not have the badge");



        // lets mint the badge, this transaction could be send by anyone, probably the player will sent it, but we could be mint it
        badge.mint(
            player,
            address(challenge1),
            bytes32(bytes(challenge1.title())),
            bytes32(bytes(challenge1.name())),
            bytes32(bytes(challenge1.description())),
            signature
        );

        assertEq(badge.balanceOf(player, 1), 1, "player should have the badge");

        
        console.log(badge.uri(1));
        
    }
}
