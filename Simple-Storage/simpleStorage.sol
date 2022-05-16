// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// creating a contract that can store data and return the data back;

// step 1 - receive information
// step 2 - store information
// return the information back

contract simpleStorage {
    uint storeData;

  //a function that sets data
  function set(uint x) public {
      storeData = x;
  }

  // a function that gets data
  function get() public view returns(uint) {
      return storeData;
  }
}


// code was ran in IDE ethereum remix