# DegenTokenFinal
This project is used to deploy the Degen Token into the Avalanche Fuji Testnet. The deployed contract can then be seen Snowtrace to check all of its transactions.

# Description
The project was made via Remix. It uses Metamask as the bridge for the token, Openzepplin for the functions of ERC20, and Snowtrace to check the deployed contract's transactions. The functions used are as follows: minttokens, burntokens, redeemtokens, getbalance / balanceof, and transfertokens.

# Minttokens
This function is used to mint tokens into the account. The owner is the only one that has access to the function, thus having the OnlyOwner modifier.

# Burntokens
The function is used to erase all tokens that the user decides not to use.

# Redeemtokens
This function is used to use the user's tokens to redeem items. The items in question are displayed by calling the StoreItems variable. Their prices are displayed via calling the ItemPrices variable.

# Getbalance / balanceof
These functions are used to check the balance of the accounts in Degen Tokens. Getbalance checks the current user's tokens while balanceof requires an address input that displays its balance once entered.

# Transfertokens
This function is used to transfer a part of the sender's tokens to the receiver. It uses two addresses, the sender and receiver's, and the value to be transferred.

# Source Code
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    string public StoreItems = "Items to be redeemed: 1. Degen Official NFT 2. Degen Official Watch 3. Degen Official Twitter Emote";
    string public ItemPrices = "Item Prices: 1. Degen Official NFT (1 Degen Token) 2. Degen Official Watch (5 Degen Tokens) 3. Degen Official Twitter Emote (10 Degen Tokens)";

    
    constructor() ERC20("Degen", "DGN") {}

    function minttokens(address to, uint256 amount) public onlyOwner {
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

    function redeemtokens(uint256 _value) external{
        require(balanceOf(msg.sender) >= _value, "Not enough Degen Tokens");
        _burn(msg.sender, _value);
        if(_value == 1){
            console.log("You have redeemed the Degen Official NFT!");
        }
        else if(_value == 5){
            console.log("You have redeemed the Degen Official Watch!");
        }
        else if(_value == 10){
            console.log("You have redeemed the Degen Official Twitter Emote!");
        }
    }
}
```

# Video Presentation
This is a demo of the deployed contract with its code: https://www.loom.com/share/e502d62ce3b04517bde7ed627f769727?sid=b1eb5e6d-6b4b-42b7-a59e-2035d3c28848
