// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

import "hardhat/console.sol";

import "../token/ERC721/ERC721.sol";
import "../GSN/GSNRecipient.sol";
import "../GSN/GSNRecipientSignature.sol";

/**
 * @title ERC721GSNRecipientMock
 * A simple ERC721 mock that has GSN support enabled
 */
contract ERC721GSNRecipientMock is ERC721, GSNRecipient, GSNRecipientSignature {
    constructor(string memory name, string memory symbol, address trustedSigner)
        public
        ERC721(name, symbol)
        GSNRecipientSignature(trustedSigner)
    { }

    function mint(uint256 tokenId) public {
        _mint(Context._msgSender(), tokenId);
    }

    function Context._msgSender() internal view override(Context, GSNRecipient) returns (address payable) {
        return GSNRecipient.Context._msgSender();
    }

    function _msgData() internal view override(Context, GSNRecipient) returns (bytes memory) {
        return GSNRecipient._msgData();
    }
}
