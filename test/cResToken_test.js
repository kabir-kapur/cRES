const cResToken = artifacts.require("cResToken");

contract("cResToken", (accounts) => {
    it("Test spot price mechanism", () => {
        cResToken.deployed()
        .then(instance => instance.spotPrice.call(10, 10000000, 15000000))
        .then(price => {
            assert.equal(
                spotPrice.valueOf(),
                1.5,
                "spot price innacurate"
            )
        })
    })
})
   