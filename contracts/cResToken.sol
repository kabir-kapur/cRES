pragma solidity ^0.8.0;

// SPDX-License-Identifier: <SPDX-License>

// hash: 0x3591A63b1986AE4080a196DF6C1b20A07c34678f
// 0x3591A63b1986AE4080a196DF6C1b20A07c34678f

// mnemonic:
/*rapid exhibit minor hero staff want shed 
 stock just glimpse vapor discover brown 
 fitness omit slush entry print advice antenna
 senior gate slim carbon */

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "./DIAOracle.sol";



contract cRESToken is ERC20, ERC20Burnable{
    uint256 currentPrice = 1;
    uint256 mostRecentDeposit; 
    uint256 btcPrice = 45000;
    uint256 celoPrice = 3;
    uint256 ethPrice = 3500;
    uint256 stablePrice = 1;

    DiaOracle oracle;

    struct expectedRatios{
        uint BTC;
        uint CELO;
        uint cUSD;
        uint ETH;
    }

    struct purchaseAmounts{
        uint BTC;
        uint CELO;
        uint cUSD;
        uint ETH;
    }

    purchaseAmounts amounts;

    IERC20 public cRES;
    expectedRatios ratios = expectedRatios({BTC:30, CELO:50, cUSD:5, ETH:15});

    mapping(address=>uint) balances;

    event Bought(uint256);

    constructor() ERC20("Celo Reserve Token", "cRES"){ // mint 1 token to a
        _mint(address(this), 1); 
        balances[address(this)] += 1;
        oracle = DiaOracle(0xb73db1A6a85219742fbd0fC7cc275c62209aA660);
    }

    function mint(uint256 amount) public {
        _mint(address(this), amount);
    }

    function sendcRES(uint256 _amount) external payable { 
        _mint(address(this), _amount); // mint AMOUNT tokens
        assert(_amount <= cRES.balanceOf(address(this)));
        assert(_amount >= currentPrice);
        transfer(msg.sender, _amount); // transfer AMOUNT worth of cRES
        emit Bought(_amount);
    }

    function receivecUSD(uint256 _amount) external payable { // receive deposit
        transfer(address(this), _amount);
        mostRecentDeposit = _amount;
        emit Transfer(address(this), msg.sender, _amount);
    }

    function getBTC() external view returns(uint) { // pull btc price feed
        // DiaOracle oracle = DiaOracle(0xCd8E18890E416Aa7ab09aa793b406C187747C687); // declare oracle instance @ celo oracle location
        // DiaOracle oracle = DiaOracle(0xb73db1A6a85219742fbd0fC7cc275c62209aA660); // declare oracle instance @ kovan oracle location
        uint256 price;
        uint256 supply;
        uint256 lastUpdateTimestamp;
        string memory symbol;
        (price, supply, lastUpdateTimestamp, symbol) = oracle.getCoinInfo("Bitcoin");
        return price;
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

    function spotPrice() external returns(uint256) {
        uint256 btcAmt = mostRecentDeposit / btcPrice;
        uint256 celoAmt = mostRecentDeposit / celoPrice;
        uint256 ethAmt = mostRecentDeposit / ethPrice;
        uint256 stableAmt = mostRecentDeposit / stablePrice; // (???)

        // amounts = purchaseAmounts({BTC:btcAmt, CELO:celoAmt, ETH:ethAmt, cUSD:stableAmt});
        amounts = purchaseAmounts(btcAmt, celoAmt, ethAmt, stableAmt);

        uint256 total;

        total = btcAmt + celoAmt + ethAmt + stableAmt;

        return total;
    }

    function spotPriceHard() public pure returns(uint256){ // fully hard-coded values sheeeesh
        // uint256 btcAmt = 1;
        // uint256 celoAmt = 1000;
        // uint256 ethAmt = 10;
        // uint256 daiAmt = 50;

        // uint256 total = btcAmt + celoAmt + ethAmt + daiAmt;
        
        uint256 ret = 1061;

        return ret;
    }
    
}