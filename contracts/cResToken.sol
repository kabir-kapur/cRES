pragma solidity ^0.8.7;

// SPDX-License-Identifier: <SPDX-License>

// hash: 0x3591A63b1986AE4080a196DF6C1b20A07c34678f
// 0x3591A63b1986AE4080a196DF6C1b20A07c34678f

/*
   mnemonic:
   rapid exhibit minor hero staff want shed
   stock just glimpse vapor discover brown
   fitness omit slush entry print advice antenna
   senior gate slim carbon
*/

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./DIAOracleV2.sol";

contract cRESToken is ERC20, ERC20Burnable{
    uint256 currentPrice = 1;
    uint256 mostRecentDeposit;
    uint256 btcPrice = 69000;
    uint256 celoPrice = 6;
    uint256 ethPrice = 4000;
    uint256 stablePrice = 1;

    struct expectedRatios{
        uint256 BTC;
        uint256 CELO;
        uint256 cUSD;
        uint256 ETH;
    }

    struct purchaseAmounts{
        uint256 BTC;
        uint256 CELO;
        uint256 cUSD;
        uint256 ETH;
    }

    purchaseAmounts amounts;
    AggregatorV3Interface internal priceFeed; // state var priceFeed

    IERC20 public cRES;
    expectedRatios ratios = expectedRatios({BTC:30, CELO:50, cUSD:5, ETH:15});

    mapping(address=>uint) balances;

    event Bought(uint256);
    event dbPrice(uint256);
    event PricePair(uint128, uint128);
    event uPrice(uint256);

    constructor() ERC20("Celo Reserve Coin", "cRES"){ // mint 1 token to this
        _mint(address(this), 1);
        balances[address(this)] += 1;
        priceFeed = AggregatorV3Interface(0xF4030086522a5bEEa4988F8cA5B36dbC97BeE88c); // assign
    }

    function mint(uint256 amount) public {
        _mint(address(this), amount);
    }

    function sendcRES(uint256 _amount) external payable {
        _mint(address(this), _amount);
        assert(_amount <= cRES.balanceOf(address(this)));
        // assert(_amount >= currentPrice);
        payable(msg.sender).transfer(_amount);
        emit Bought(_amount);
    }

    function receivecUSD(uint256 _amount) external payable { // receive deposit
        payable(address(this)).transfer(_amount);
        mostRecentDeposit = _amount;
        emit Transfer(address(this), msg.sender, _amount);
    }

    function getBTC() public { // pucalll btc price feed
        DIAOracleV2 dia = DIAOracleV2(0xCd8E18890E416Aa7ab09aa793b406C187747C687);
        (uint128 key, uint128 value) = dia.getValue("Bitcoin");
        emit PricePair(key, value);
    }

    function getETH() private returns(uint) { // pull eth price feed
        // privately retreive price of ETH
    }

    function getCELO() private returns(uint) { // pull celo price feed
        // privately retreive price of CELO
    }

    function getDAI() private returns(uint) { // pull dai price feed (???)
        // privately retreive price of DAI
    }

    function spotPrice() external {
        uint256 btcAmt = mostRecentDeposit / btcPrice;
        uint256 celoAmt = mostRecentDeposit / celoPrice;
        uint256 ethAmt = mostRecentDeposit / ethPrice;
        uint256 stableAmt = mostRecentDeposit / stablePrice; // (???)

        // amounts = purchaseAmounts({BTC:btcAmt, CELO:celoAmt, ETH:ethAmt, cUSD:stableAmt});
        amounts = purchaseAmounts(btcAmt, celoAmt, ethAmt, stableAmt);

        uint256 total;

        total = btcAmt + celoAmt + ethAmt + stableAmt;

        emit uPrice(total);
    }

    function spotPriceHard() private pure returns(uint256){ // fully hard-coded values sheeeesh
        // uint256 btcAmt = 1;
        // uint256 celoAmt = 1000;
        // uint256 ethAmt = 10;
        // uint256 daiAmt = 50;

        // uint256 total = btcAmt + celoAmt + ethAmt + daiAmt;

        uint256 ret = 1061;

        return ret;
    }
}

