const cResToken = artifacts.require("cResToken")


contract("cResToken", accounts => { // contract instantiation
    it("Test supply()", async() => { // give this test a name
        const cResTokenInstance = await cResToken.deployed(); // create deployed() promise
        const supply = await cResTokenInstance.supply.call(); // call supply() 

        assert.equal(supply.valueOf(), 10000, "Supply is not 10000"); // assert supply == correct val
    });

    it("Test spotPrice()", async() => {
        // modify inputs to test varying environment
        const cRatioIn = 10;
        const cWeightIn = 100000000;
        const rWeightIn = 15000000;

        const targetVal = ((cRatioIn/100)/cWeightIn) / (((100 - cRatioIn)/100)/rWeightIn);

        const cResTokenInstance = await cResToken.deployed();
        const spotPriceMetrics = await cResTokenInstance.spotPrice.call(cRatioIn, cWeightIn, rWeightIn);

        let cRatioOut = spotPriceMetrics.valueOf()[0]/100; // declare valuation variables
        let rRatioOut = 1 - cRatioOut;
        let cWeightOut = spotPriceMetrics.valueOf()[1];
        let rWeightOut = spotPriceMetrics.valueOf()[2];
        let spotPriceVal = (cRatioOut/cWeightOut) / (rRatioOut/rWeightOut);
         
        assert.equal(spotPriceVal, targetVal, "spot price received does not match target"); // perform test
    })
});
   