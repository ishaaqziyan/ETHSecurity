// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./Storage.sol";

contract God is Storage {
    function getNumberOfGods() public view returns (uint256) {
        return Storage.getNumber();
    }

    function setNumberOfGods(uint256 toSet) public {
        Storage.setNumber( toSet);
    }

}