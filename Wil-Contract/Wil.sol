// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Will {
  // we want to create a smart contract which shows a will
  // check if grandfather has passed away, how much inheritence;
  address owner;
  uint fortune;
  bool deceased;

  //constructor is a special type of function
  //payable is a keyword that follows the function to send and receive ether

  constructor () payable public {
      owner = msg.sender; //msg.sender represent address that is  being called
      fortune = msg.value; //msg.value tells us how much ether is being sent
      deceased = false;
   }

 // create a modifier so that only who can call the contract is the owner
   modifier onlyOwner {
     require(msg.sender == owner);
      _;
   }

 //create modifer so that we only allocate funds if grandfather is deceased
  modifier mustBeDeceased {
    require(deceased == true);
     _;
  }

  //list of family wallets
  address payable [] familyWallets;

  // map through inheritance
  mapping(address => uint) inheritance;

  //set inheritance for each address
  function setInheritance ( address payable wallet, uint amount) public {
    //to add wallet to the familywallets
     familyWallets.push(wallet);
     inheritance[wallet] = amount;
  }

}