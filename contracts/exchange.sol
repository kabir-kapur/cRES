pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./cResToken.sol";

contract Exchange{
    // using ERC20 for ERC20; // apply erc20 library functions to more local erc20 instances

    function transferToken() public{
        cResToken cRES = cResToken(0xc360698B7b22C18FBa4115d4544AcC6b5d7B0f9C);
        cResToken.ERC20.transfer(msg.sender, 100);


    }
}