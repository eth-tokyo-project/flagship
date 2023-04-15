// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {IChallengeFactory} from "./ChallengeFactory.sol";

contract ChallengeManager {
    event Deployed(address indexed player, address indexed challengeFactory, address[] challengeContracts);

    mapping(address => mapping(address => address[])) public challenges;
    mapping(address => mapping(address => bool)) public userChallengeBreak;

    /// @dev each time a challenge has been pass it will increament challengeBreaks counter for the challenge
    /// @dev points for each whitelisted challenge will be measure as 1ether / challengeBreaks[]
    mapping(address => uint256) public challengeBreaks;
    mapping(address => bytes32) public usernames;

    event ChallengeBreak(address indexed challenge, address indexed user, uint256 breakTimes);
    event SetUsername(address indexed user, bytes32 _name);

    constructor() {}

    function deployChallenge(address _challengeFactory) external payable {
        address[] memory _challengeContracts = ChallengeFactory(_challengeFactory).deploy{value: msg.value}(msg.sender);

        challenges[msg.sender][_challengeFactory] = _challengeContracts;

        emit Deployed(msg.sender, _challengeFactory, _challengeContracts);
    }

    function breakChallenge(address _challengeFactory) external {
        require(!userChallengeBreak[msg.sender][_challengeFactory], "You have pass this challenge");
        require(checkChallenge(msg.sender, _challengeFactory), "Challenge has not been pass");

        userChallengeBreak[msg.sender][_challengeFactory] = true;
        uint256 breakTimes;
        unchecked {
            breakTimes = ++challengeBreaks[_challengeFactory];
        }

        emit ChallengeBreak(_challengeFactory, msg.sender, breakTimes);
    }

    function setUsername(bytes32 _name) external {
        usernames[msg.sender] = _name;
        emit SetUsername(msg.sender, _name);
    }

    function getChallengesInstances(address user, address _challengeFactory) external view returns (address[] memory) {
        return challenges[user][_challengeFactory];
    }

    function checkChallenge(address user, address _challengeFactory) public view returns (bool) {
        if (challenges[user][_challengeFactory].length == 0) {
            return false;
        }

        return ChallengeFactory(_challengeFactory).isComplete(challenges[user][_challengeFactory]);
    }
}