// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract Timelock{

// who can withdraw 
// hom much??
//when can he withdraw 

address payable beneficiary;
uint256 releaseTime;

constructor(address payable  _beneficiary, uint256 _releaseTime ){
    require(_releaseTime > block.timestamp, " The funds are not ready yet");
    beneficiary = _beneficiary;
    releaseTime = _releaseTime;

}

function release() public {

    require( block.timestamp >= releaseTime );
    beneficiary.transfer(address(this).balance);
}


}