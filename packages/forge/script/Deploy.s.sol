// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/Script.sol";

import {Badges1155} from "src/Badges1155.sol";
import {ChallengeManager} from "src/challenges/ChallengeManager.sol";
import {FactoryGuessTheNumberChallenge} from "src/challenges/CTE/Lottery1.sol";
import {FactoryGuessTheSecretNumberChallenge} from "src/challenges/CTE/Lottery2.sol";
import {FactoryGuessTheRandomNumberChallenge} from "src/challenges/CTE/Lottery3.sol";

contract DeployScript is Script {
    // this is defined in  lib/forge-std/src/Base.sol:30:5:
    // CREATE2_FACTORY = 0x4e59b44847b379578588920cA78FbF26c0B4956C;


    function setUp() public {}

    function run() public returns(address badge, address challengeManager, address challenge1, address challenge2, address challenge3) {
        /*
        is create2 working anvil??
        if(CREATE2_FACTORY.code.length == 0) {
            vm.etch(CREATE2_FACTORY, hex"7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe03601600081602082378035828234f58015156039578182fd5b8082525050506014600cf3");
        }
        */
        vm.startBroadcast();


        // lets deploy the badge ERC1155
        Badges1155 _badge = new Badges1155();
        badge = address(_badge);

        // lets add the minter, replace with a real address
        _badge.addMinter(0xbAd10f26d17276F6CA39dAdf397A398394570FE8 /*makeAddr("minter")*/);

        // lets deploy the challenge manager
        challengeManager = address(new ChallengeManager());

        // now lets deploy the challenges
        challenge1 = address(new FactoryGuessTheNumberChallenge());
        challenge2 = address(new FactoryGuessTheSecretNumberChallenge());
        challenge3 = address(new FactoryGuessTheRandomNumberChallenge());

        /*
        TODO create 2
        
        bytes32 salt = 0x29A;
        bytes memory data = bytes.concat(salt, FactoryGuessTheNumberChallenge.creationCode);
        CREATE2_FACTORY.call(data);
        console2.logBytes(address(0xc0fFeE0925e2b93b24eF8B2f7C2adE3dd15Ee8e8).code);
        */

    }
    
}

