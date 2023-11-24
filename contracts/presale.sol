//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "./YourToken.sol"; // Import your ERC20 token contract

contract Presale {
    YourToken public token;
    address public admin;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    mapping(address => uint256) public balances;
    bool public saleActive;

    event TokensPurchased(address indexed buyer, uint256 amount);

    constructor(address _tokenAddress, uint256 _tokenPrice) {
        token = YourToken(_tokenAddress);
        admin = msg.sender;
        tokenPrice = _tokenPrice;
        saleActive = true;
    }

    function buyTokens(uint256 _numberOfTokens) public payable {
        require(saleActive, "Sale is not active");
        require(msg.value == _numberOfTokens * tokenPrice, "Incorrect token amount or price");

        uint256 allowance = token.allowance(token.tokenOwner(), address(this));
        require(allowance >= _numberOfTokens, "Token allowance not enough");

        require(token.transferFrom(token.tokenOwner(), msg.sender, _numberOfTokens), "Token transfer failed");

        tokensSold += _numberOfTokens;
        balances[msg.sender] += _numberOfTokens;

        emit TokensPurchased(msg.sender, _numberOfTokens);
    }

    function endSale() public {
        require(msg.sender == admin, "Only admin can end the sale");
        saleActive = false;
        // Transfer remaining tokens to admin or burn them
    }
}
