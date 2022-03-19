// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract myToken is ERC20{
    uint256 public constant _totalSupply = 1000000 * 10**18; //1 million tokens
    uint256 public constant Ethpertoken = 0.001 ether;  
     constructor() ERC20("myToken", "MTT"){
    }
    
    function buyToken(address receiver, uint256 amount) public payable{
        require(msg.value > 0, "Send ETH to buy some tokens");
        uint256 amountToBuy = amount*10**18;
        require(amountToBuy <= _totalSupply, "Not Enough Tokens left.");
        _mint(receiver, amountToBuy);
        }
}