// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    string public StoreItems = "Items to be redeemed: 1. Degen Official NFT 2. Degen Official Watch 3. Degen Official Twitter Emote";
    constructor() ERC20("Degen", "DGN") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() override public pure returns (uint8){
        return 0;
    }

    function getBalance() external view returns (uint256){
        return this.balanceOf(msg.sender);
    }

    function transfertokens(address _receiver, uint256 _value) external{
        require(balanceOf(msg.sender) >= _value, "Not enough Degen Tokens");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _receiver, _value);
    } 

    function burntokens(uint256 _value) external{
        require(balanceOf(msg.sender) >= _value, "Not enough Degen Tokens");
        approve(msg.sender, _value);
        _burn(msg.sender, _value);
    }
}