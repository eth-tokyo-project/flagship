pragma solidity ^0.8.0;

contract GuessTheNumberChallenge {
    uint8 private answer = 42;
    bool public isComplete;
    
    function guess(uint8 n) public payable {
        if (n == answer) {
          isComplete = true;
        }
    }
}