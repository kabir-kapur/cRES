const cResToken = artifacts.require("cResToken")


contract("cResToken", accounts => { // contract instantiation
    it("Test supply()", async() => { // give this test a name
        const cResTokenInstance = await cResToken.deployed(); // create deployed() promise
        const supply = await cResTokenInstance.supply.call(); // call supply() 

        console.log(supply.valueOf());
        assert.equal(supply.valueOf(), 10000, "Supply is not 10000"); // assert supply == correct val
    });

    it("Test spotPrice()", async() => {
        const cResTokenInstance = await cResToken.deployed();
        const spotPrice = await cResTokenInstance.spotPrice.call(50, 10000000, 15000000);

        console.log(spotPrice.valueOf());
        assert.equal(spotPrice.valueOf(), 1.5, "Spot Price is not 1.5");
    })
});
   