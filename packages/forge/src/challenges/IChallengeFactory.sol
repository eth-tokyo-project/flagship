// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Interface for CTF organisers to use when creating a singular challenge level factory.
///        The factory deploys a fresh version of the level per player.
interface IChallengeFactory {
    // @notice create challenges contract
    function deploy(address player) external payable returns (address[] memory);
    
    // @notice return msg.value that must be satisfied when deploying the challenge
    function deployValue() external view returns (uint256);

    // @notice return name of the contract challenges
    function contractNames() external view returns (string[] memory);

    /// @notice Will true if player has complete the challenge
    function isComplete(address[] calldata) external view returns (bool);

    // @notice return name for rendering the nft
    function name() external view returns (string memory);

    // @notice return title for rendering the nft
    function title() external view returns (string memory);

    // @notice return name for rendering the nft
    function description() external view returns (string memory);
}