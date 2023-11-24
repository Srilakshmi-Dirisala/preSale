// YourToken.sol
//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract YourToken is ERC20 {
    address public tokenOwner; // Store the owner/deployer address

    constructor() ERC20("YourFToken", "YTK") {
        tokenOwner = msg.sender; // Assign the deployer's address as the owner
        _mint(msg.sender, 1000000000000000000000000); // Mint 1,000,000 tokens and assign to the deployer
    }

    // Add other functions as needed
}

