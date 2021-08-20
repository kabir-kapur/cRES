pragma solidity ^0.8.0;

// hash:
// 0x3591A63b1986AE4080a196DF6C1b20A07c34678f

// mnemonic:
/*rapid exhibit minor hero staff want shed 
 stock just glimpse vapor discover brown 
 fitness omit slush entry print advice antenna
 senior gate slim carbon */

// import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Mintable.sol";
// import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract cResToken is ERC20, ERC20Burnable{
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

    struct expectedRatios{
        uint BTC;
        uint CELO;
        uint cUSD;
        uint ETH;
    }
    expectedRatios ratios = expectedRatios({BTC:30, CELO:50, cUSD:5, ETH:15});

    mapping(address=>uint) balances;

    constructor() public ERC20("Celo Reserve Token", "cRES"){ // mint 1 token to THIS
        _mint(address(this), 1); 
        balances[address(this)] += 1;
    }

    function mint(uint256 amount) public {
        _mint(address(this), amount);
    }

    function escrowContractToUser(address user, uint256 amount) public { // transfer erc20 out of escrow and into calling contract's account (not yet hardcoded)
        approve(address(this), 1000000000000000000000000); // approve THIS to spend AMOUNT tokens 
        transferFrom(address(this), user, amount); // transfer amount from THIS address to calling contract 
        
    }
}