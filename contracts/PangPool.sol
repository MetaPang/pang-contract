// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract PangPool {
  address payable public owner;

  constructor() payable {
    owner = payable(msg.sender);
  }

  function deposit() public payable {}

  function withdraw() public {
    uint amount = address(this).balance;

    (bool success, ) = owner.call{value: amount}("");
    require(success, "Failed to send Error");
  }

  function transfer(address _to, uint _amount) external {
    require(owner == msg.sender, "Not Admin Address");
    
    (bool success, ) = _to.call{value: _amount}("");
    require(success, "Failed to send Error");
  }

  function balances() public view returns(uint256) {
    uint amount = address(this).balance;

    return amount;
  }
}