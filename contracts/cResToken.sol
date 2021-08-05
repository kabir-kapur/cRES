pragma solidity ^0.8.0;

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
    uint _totalSupply = 10000;
    uint8 _mintAmt = 1;

    string _name = "Celo Reserve Token";
    string _symbol = "cRES";


    mapping(string => uint8) expectedRatios;
    

    constructor() ERC20("Celo Reserve Token", "cRES"){
        _mint(msg.sender, 1);
    }


    function totalSupply() public view override returns(uint){
        return _totalSupply;
    }

    function name() public view override returns(string memory){
        return _name;
    }

    function symbol() public view override returns(string memory){
        return _symbol;
    }

    function btcPrice() public view returns(uint){
        return address(0xe1955eA2D14e60414eBF5D649699356D8baE98eE).balance;
    }

    function minterStatus() public returns(uint){
        _mint(msg.sender, 1000);
        return btcPrice();
    }

    function thisAddress() public view returns(address){
        return msg.sender;
    }
}