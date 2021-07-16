var cResToken = artifacts.require("./cResToken.sol");

module.exports = function (deployer) {
  deployer.deploy(cResToken);
};