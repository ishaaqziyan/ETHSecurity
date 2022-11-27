pragma solidity ^0.8.0;


contract Fundraiser{
    
    mapping  (address => uint) balances;
    
    function contribute() public payable{
        balances[msg.sender] += msg.value;
    }
    
    function  public withdraw(){
        if(balances[msg.sender] == 0){
            throw;
        }
        
        balances[msg.sender] = 0;
        msg.sender.call.value(balances[msg.sender])();
    }
    
    function getFunds() returns (uint){
        return address(this).balance;
    }
    
}