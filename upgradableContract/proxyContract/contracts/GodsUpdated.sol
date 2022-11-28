
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Storage.sol";

contract GodsUpdated is Storage {

  modifier onlyOwner() {
    require(msg.sender == owner); 
    _;
  }


  constructor()  {
    initalize(msg.sender);
  }

  function initalize(address _owner) public{
    require(!_initialized);
    owner= _owner;
    _initialized = true;
  }

  function getNumberOfGods() public view returns(uint256) {
    return _uintStorage["Gods"];
  }
  function setNumberOfGods(uint256 toSet) public onlyOwner {
    _uintStorage["Gods"] = toSet;
  }

}