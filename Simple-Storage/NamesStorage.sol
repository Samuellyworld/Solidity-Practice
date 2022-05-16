// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract namesStorage {
  string StoreName;

  function setName(string memory y) public {
      StoreName = y;
  }

  function getName() public view returns(string memory) {
      return StoreName;
  }
}