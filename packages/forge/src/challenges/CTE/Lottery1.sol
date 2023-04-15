pragma solidity ^0.8.0;

import {ChallengeFactory} from "../ChallengeFactory.sol";
import {GuessTheNumberChallenge} from "./Lottery1Challenge.sol";

contract FactoryGuessTheNumberChallenge is ChallengeFactory {
    uint256 public constant override deployValue = 0;
  
    function deploy(address player) external payable override returns (address[] memory) {
        require(msg.value == deployValue, "Deploy value is incorrect");
        address[] memory contracts = new address[](1);
        contracts[0] = address(new GuessTheNumberChallenge());
        return contracts;
    }

    function contractNames() external view override returns (string[] memory) {
        string[] memory names = new string[](1);
        names[0] = "GuessTheNumberChallenge";
        return names;
    }

    function isComplete(address[] memory challenges) external view override returns (bool) {
      return GuessTheNumberChallenge(challenges[0]).isComplete();
          
    }

    function title() external view override returns (string memory) {
        return "CTE Lottery #1";
    }

    function name() external view override returns (string memory) {
        return "Guess the number";
    }

    function description() external view override returns (string memory) {
        return "Guess the number challenge";
    }
}
