pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract BTCAPIConsumer is ChainlinkClient{ 
    /*
    parent: ChainlinkClient
    */
    uint256 public btcPrice; // price of btc

    address private oracle;
    bytes32 private jobId;
    uint256 private fee;

    constructor() public{
        setPublicChainlinkToken();
    }

}
contract cResToken{
    /*
    NEED TO MAKE:
    - constructor
    - total # of tokens setter
    - total # of tokens reader */
    function supply() public {
        uint256 totalSupply = 1000000;
    }
}