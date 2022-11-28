
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Storage.sol";

contract Gods is Storage {

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  constructor()  {
    owner = msg.sender;
  }

  function getNumberOfGods() public view returns(uint256) {
    return _uintStorage["Gods"];
  }
  function setNumberOfGods(uint256 toSet) public {
    _uintStorage["Godss"] = toSet;
  }

}