// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Storage{
    uint256 number;

    function getNumber() internal view returns(uint){
        return number;

    }
    
    function setNumber(uint256 _number) internal{
        number=  _number;

    }
}
