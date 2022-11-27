// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Storage.sol";
contract ProxyGod is Storage {

    address public currentAddress;

    constructor(address _currentAddress) public {
        currentAddress = _currentAddress;
    }

    function upgrade(address _currentAddress) public {
        currentAddress = _currentAddress;
    }

    function getNumberOfGods() public returns (bool, bytes memory){
        (bool res, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("getNumberOfGods()"))));
        return (res, data);
    }
    function setNumberOfGods(uint256 _number) public returns (bool, bytes memory){
        (bool res, bytes memory data) = currentAddress.delegatecall(abi.encodePacked(bytes4(keccak256("setNumberOfGods(uint256)")), _number));
        return (res, data);
    }
}
