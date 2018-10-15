const FromBlockNumber = artifacts.require("./FromBlockNumber.sol")

module.exports = function(deployer, networkName) {
  return deployer.deploy(FromBlockNumber);
};
