// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract OKHalf is ERC1155, Ownable {

    string public name = "OK Half";
    string public symbol = "OKHALF";

    constructor(address initialOwner)
        ERC1155("https://jigsaw-fam.github.io/ok-half/json/")
        Ownable(initialOwner)
    {}

    // metadata
    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }
    function tokenURI(uint tokenId) public view returns (string memory) {
        return string.concat(uri(0), Strings.toString(tokenId), ".json");
    }

    // mint
    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }
    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
