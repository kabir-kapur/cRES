const cRESToken = artifacts.require("cRESToken");
const DIAOracle = artifacts.require("DIAOracle");

contract("cRESToken", accounts => { // contract instantiation
    it("Test mint()", async() => { // mint() function test/escrow account test
        const instance = await cRESToken.deployed();
        // const account = "0x1134599Ec20682d7EcaD53d4E5d8e818a07D80B1";
        const contractLocation = instance.address; // address of deployed contract
        const amount = 10;

        const minted = await instance.mint(amount); // mint to deployed contract address 
        const balance = await instance.balanceOf(contractLocation); // get balance of deployed contract address 

        assert.equal(balance, amount + 1, "Contract balance does not match mint amount");
    });

    it("Test sendcRES()", async() => {
        const instance = await cRESToken.deployed();
        const amount = 10;
        const contractLocation = instance.address;

        console.log(await instance.balanceOf(contractLocation));

        // const minted = await instance.mint(amount);      
        const sent = instance.sendcRES(amount);
        
        console.log(await instance.balanceOf(contractLocation));
    });

    it("Test spotPrice()", async() => {
        const instance = await cRESToken.deployed();
        const spotPriced = instance.spotPriceHard(); 
        console.log(1061);
        // console.log(await instance.spotPriceHard());
        assert.equal(spotPriced, 1061, "FUCKKKKKK BROOOOoooo");
    });
});
   