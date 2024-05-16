// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC1155/presets/ERC1155PresetMinterPauser.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract OKHalf is ERC1155PresetMinterPauser {

    string public name = "OK Half";
    string public symbol = "OKHALF";
    string private baseURI = "https://jigsaw-fam.github.io/ok-half/json/";

    constructor() ERC1155PresetMinterPauser("") {
        _mint(msg.sender, 1, 1, ""); // Chronicle #329 | MXVE ON
    }

    // mint
    function adminMint(uint256 id, uint256 amount) public virtual {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "admin only");
        mint(_msgSender(), id, amount, "");
    }

    // metadata
    function setBaseURI(string calldata _newBaseURI) external {
        require(hasRole(DEFAULT_ADMIN_ROLE, _msgSender()), "admin only");
        baseURI = _newBaseURI;
    }
    function tokenURI(uint tokenId) public view returns (string memory) {
        return string.concat(baseURI, Strings.toString(tokenId), ".json");
    }

}
