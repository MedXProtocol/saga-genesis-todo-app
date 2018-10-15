pragma solidity ^0.4.24;

import './Initializable.sol';

contract TodoManager is Initializable {

  uint256 constant DESCRIPTION_MIN_LENGTH = 1;
  uint256 constant DESCRIPTION_MAX_LENGTH = 64;

  /*
    MEMORY START
    _do not_ remove any of these once they are deployed to a network (Ropsten,
    Mainnet, etc.) and only append to the bottom (before the END comment)
  */
  uint[] public totalTodos;
  mapping(uint256 => string) public todos;

  address owner;
  /*
    MEMORY END
    It is safe to add new data definitions here at the bottom
  */

  event TodoCreated(uint256 _index, string _description);
  event TodoUpdated(uint256 _index, string _description);
  event TodoDeleted(uint256 _index, string _description);

  modifier descriptionLength(string _description) {
    bytes memory _descriptionBytes = bytes(_description);

    require(_descriptionBytes.length > DESCRIPTION_MIN_LENGTH, "Description is too short");
    require(_descriptionBytes.length <= DESCRIPTION_MAX_LENGTH, "Description is too long");

    _;
  }

  function initializeTarget() public notInitialized {
    owner = msg.sender;
    setInitialized();
  }

  function createTodo(string _description)
    external
    descriptionLength(_description)
  {
    // Start at 1
    uint256 _index = totalTodos.length + 1;
    totalTodos.push(_index);

    todos[_index] = _description;

    emit TodoCreated(_index, _description);
  }

  function updateTodo(uint256 _index, string _description)
    external
    descriptionLength(_description)
  {
    todos[_index] = _description;

    emit TodoUpdated(_index, _description);
  }

  function deleteTodo(uint256 _index) external {
    todos[_index] = '';

    emit TodoDeleted(_index, todos[_index]);
  }

}
