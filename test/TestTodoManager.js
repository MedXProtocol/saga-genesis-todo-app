const expectThrow = require('./helpers/expectThrow')
const TodoManager = artifacts.require('TodoManager')

contract('TodoManager', function (accounts) {
  let recipient = accounts[1]
  let todoManager

  before(async () => {
    TodoManager.deployed().then(i => todoManager = i)
  })

  describe('createTodo()', () => {
    it('should create a todo', async () => {
      const description = 'Hi there I am a todo!'
      await todoManager.createTodo(description, {
        from: recipient
      })
      assert.equal(await todoManager.todos(1), description)
    })

    it('should not allow short or long descriptions', async () => {
      expectThrow(async () => {
        await todoManager.createTodo('1', { from: recipient })
      })
    })
  })
})
