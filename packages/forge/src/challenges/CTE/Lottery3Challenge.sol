pragma solidity ^0.8.19;

contract GuessTheRandomNumberChallenge {
    uint8 private answer;

    bool public isComplete;

    constructor() {
      _setRandomAnswer();
    }

    function _setRandomAnswer() internal {
      answer = uint8(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))));
    }

    function guess(uint8 n) public {
        if (n == answer) {
          isComplete = true;
        } else {
          _setRandomAnswer();
        }
    }
}
