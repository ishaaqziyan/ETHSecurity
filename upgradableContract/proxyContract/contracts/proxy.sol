// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Storage.sol";

contract Proxy is Storage {

  address currentAddress;


  constructor(address _currentAddress)  {
    owner = msg.sender;
    currentAddress = _currentAddress;
  }
  function upgrade(address _newAddress) public {
    require(msg.sender == owner);
    currentAddress = _newAddress;
  }

  //FALLBACK FUNCTION.
  fallback ()external  payable  {
    address implementation = currentAddress;
    require(currentAddress != address(0));
    bytes memory data = msg.data;

    

    //DELEGATECALL EVERY FUNCTION CALL
    assembly {
      let result := delegatecall(gas(), implementation, add(data, 0x20), mload(data), 0, 0)
      let size := returndatasize()
      let ptr := mload(0x40)
      returndatacopy(ptr, 0, size)
      switch result
      case 0 {revert(ptr, size)}
      default {return(ptr, size)}
    }
  }
}