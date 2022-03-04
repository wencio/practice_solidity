// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract Escrow {

    address agent;
    mapping(address=>uint256) public deposits;

    modifier onlyAgent(){
    require(msg.sender == agent, "You must be the escrow agent");
    _;
}
    constructor(){

        agent = msg.sender;
    }

    function deposit(address _payee) public onlyAgent payable{

        uint256 amount = msg.value;
        deposits[_payee] = deposits[_payee] + amount;

    }

    function withdraw (address payable _payee) public onlyAgent {
        uint256 payment = deposits[_payee];
        deposits[_payee] = 0;
        _payee.transfer(payment);
    }
}