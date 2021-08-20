const cResToken = artifacts.require("cResToken");
const exchange = artifacts.require("exchange");

contract("cResToken", accounts => { // contract instantiation
    it("Test mint()", async() => { // mint() function test/escrow account test
        const instance = await cResToken.deployed();
        // const account = "0x1134599Ec20682d7EcaD53d4E5d8e818a07D80B1";
        const contractLocation = instance.address; // address of deployed contract
        const amount = 10;

        const minted = await instance.mint(amount); // mint to deployed contract address 
        const balance = await instance.balanceOf(contractLocation); // get balance of deployed contract address 

        assert.equal(balance, amount + 1, "Contract balance does not match mint amount");
    });

    it("Test fund send", async() => {
        const account = "0x3591A63b1986AE4080a196DF6C1b20A07c34678f";
        const amount = 10;

        const instance = await cResToken.deployed();
        const contractLocation = instance.address;
        const minted = await instance.mint(amount);
        let balance = await instance.balanceOf(contractLocation);
        console.log(balance);
        
        const sent = await instance.contractToUser(account, 10);

    });
});
   