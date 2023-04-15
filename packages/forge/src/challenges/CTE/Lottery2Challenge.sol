pragma solidity ^0.8.0;

contract GuessTheSecretNumberChallenge {
    bytes32 answerHash = 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;

    bool public isComplete;

    function guess(uint8 n) external {
        if (keccak256(abi.encode(n)) == answerHash) {
            isComplete = true;
        }
    }
}