const cResToken = artifacts.require("cResToken");
const exchange = artifacts.require("exchange");

contract("cResToken", accounts => { // contract instantiation
    it("Test mint()", async() => { // mint() function test
        const instance = await cResToken.deployed();
        // const account = "0x1134599Ec20682d7EcaD53d4E5d8e818a07D80B1";
        const account = instance.address; // address of deployed contract
        const amount = 10;

        const minted = await instance.mint(amount); // mint to deployed contract address 
        const balance = await instance.balanceOf(account); // get balance of deployed contract address 

        assert.equal(balance, amount, "Contract balance does not match mint amount");
    });

    it("Test call()", async() => {
        const contractLocation = "0x1134599Ec20682d7EcaD53d4E5d8e818a07D80B1";
        const account = "0x3591A63b1986AE4080a196DF6C1b20A07c34678f";
    });
});
   