// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

import "./Token.sol";

contract TokenTimelock{
    Token public token;
    address payable public  beneficiary;
    uint256 public releaseTime;

    constructor(Token _token, address payable _beneficiary, uint256 _releaseTime){
       require(_releaseTime> block.timestamp);
        token  = _token; 
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }

function release () public {
require (block.timestamp >=releaseTime, " Time not ready yet");
uint256 amount = token.balanceOf(address(this));
require(amount >= 0, " Not enough funds");
token.transfer(beneficiary,amount);
}


}
