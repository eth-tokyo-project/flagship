// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title This is the interface for CTF organisers to use when creating a singular challenge level factory.
///        The factory deploys a fresh version of the level per player.
abstract contract ChallengeFactory {
    // @notice create challenges contract
    function deploy(address player) external payable virtual returns (address[] memory);
    
    // @notice return msg.value that must be satisfied when deploying the challenge
    function deployValue() external view virtual returns (uint256);

    // @notice return name of the contract challenges
    function contractNames() external view virtual returns (string[] memory);

    /// @notice Will true if player has complete the challenge
    function isComplete(address[] calldata) external view virtual returns (bool);

    // @notice return title for rendering the nft
    function title() external view virtual returns (string memory);

    // @notice return name for rendering the nft
    function name() external view virtual returns (string memory);

    // @notice return name for rendering the nft
    function description() external view virtual returns (string memory);
}
 