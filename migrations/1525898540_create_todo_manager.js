const TodoManager = artifacts.require("./TodoManager.sol")

module.exports = function(deployer, networkName) {
  return deployer.deploy(TodoManager);
};
