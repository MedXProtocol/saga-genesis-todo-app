pragma solidity ^0.4.23;

import './TodoManager.sol';
import './Registry.sol';

library RegistryLookup {

  function todoManager(Registry self) internal view returns (TodoManager) {
    return TodoManager(self.lookup(keccak256("TodoManager")));
  }

}
