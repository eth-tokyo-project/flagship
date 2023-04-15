// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "solmate/tokens/ERC1155.sol";

/// @title A extension of the ERC1155 token standard that prevents the token from being transferred
/// @dev Just a simple soulbound token that can't be transferred
abstract contract SoulBound1155 is ERC1155 {
    error errSoulboundToken();

    function setApprovalForAll(address, bool) public virtual override {
        revert errSoulboundToken();
    }

    function safeTransferFrom(address, address, uint256, uint256, bytes calldata) public virtual override {
        revert errSoulboundToken();
    }

    function safeBatchTransferFrom(address, address, uint256[] calldata, uint256[] calldata, bytes calldata)
        public
        override
    {
        revert errSoulboundToken();
    }
}
