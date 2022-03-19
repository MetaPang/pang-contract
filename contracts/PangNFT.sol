//SPDX-License-Identifier: MIT
pragma solidity 0.5.16;

import "@openzeppelin/contracts/token/ERC721/ERC721Full.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721Mintable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721Burnable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721Pausable.sol";

contract PangNFT is ERC721Full, ERC721Mintable, ERC721Burnable, ERC721Pausable {
  constructor() ERC721Full("PangPang", "BPP") public {}

  function safeMint(address to, uint256 tokenId, string memory uri) public onlyMinter returns (bool) {
    _safeMint(to, tokenId);
    _setTokenURI(tokenId, uri);
    return true;
  }
}