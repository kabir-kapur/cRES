var cRESToken = artifacts.require("./cRESToken.sol");

module.exports = function (deployer) {
  deployer.deploy(cRESToken);
};