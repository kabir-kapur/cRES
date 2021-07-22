pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/ChainlinkClient.sol"; // importing v0.6 (stable)

contract cResToken{
    /*
    NEED TO MAKE:
    - constructor
    - total # of tokens setter
    - total # of tokens reader 
    - V = product over t periods(TOKEN tokens/POOL tokens^(arbitrary
        time-affected weight that devalues as a function of trading 
        events undergone as of current epoch 't'))  
    - V = product over t tokens((TOKEN tokens/POOL tokens)^(1/t))
    - */

    uint _totalSupply = 10000;


    function spotPrice(uint256 celoRatio, uint256 celoInReserve, uint256 totalInReserve) view public returns(uint256 spotPricecRES){
        return ((celoRatio/100)/celoInReserve)/((1 - celoRatio)/(totalInReserve - celoInReserve));
    }

    function supply() view public returns(uint _totalSupply){
        return _totalSupply;
    }
}



////////////////// DATA FEED STUFF //////////////////



// contract BTCAPIConsumer is ChainlinkClient{ 
//     /*
//     parent: ChainlinkClient
//     */
//     uint256 public btcPrice; // price of btc

//     address private oracle;
//     bytes32 private jobId;
//     uint256 private fee;

//     constructor() public{
//         setPublicChainlinkToken();

//         oracle = 0xECcB8F881cE2552EdA4115a162ffE2666B601c33; // https://market.link/data-providers/eb5c92a8-6093-4657-9a68-a6d10719946e/integrations?network=1
//         jobId = "0391a670ba8e4a2f80750acfe65b0c89";
//         fee = .1 * 10**18; // fee of .1 LINK
//     }

//     function requestBTCPrice() public returns (bytes32 reqID){
//         Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfillBTC.selector);
//         req.add("base", "BTC/USDT:CXDXF");
        
//         return sendChainlinkRequestTo(oracle, req, fee);
//     }

//     function fulfillBTC(bytes32 _requestId, uint256 _btcPrice) public recordChainlinkFulfillment(_requestId){
//         btcPrice = _btcPrice;
//     }
// }