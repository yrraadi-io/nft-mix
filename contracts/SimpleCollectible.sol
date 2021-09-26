// SPDX-License-Identifier: MIT
pragma solidity 0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SimpleCollectible is ERC721 {
    uint256 public tokenCounter;
    mapping(uint256 => string) public tokenIdToOwner;
    constructor () public ERC721 ("Dogie", "DOG"){
        tokenCounter = 0;
    }

    function createCollectible(string memory tokenURI) public returns (uint256) {
        uint256 newItemId = tokenCounter;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }
    function assignOwner(uint256 tokenId, string memory ownerName) public {
        tokenIdToOwner[tokenId] = ownerName;
    }
    function returnOwnerName(uint256 tokenId) public view returns (string memory){
        return tokenIdToOwner[tokenId];
    }

}
