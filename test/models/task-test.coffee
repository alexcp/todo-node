assert = require 'assert'
Task = require '../../models/task'

describe 'Task', ->
  describe 'create', ->
    task = null
    before ->
      task = new Task {name:'Make a list'}

    it "sets name", ->
      assert.equal task.name, 'Make a list'

    it "default to inactive status", ->
      assert.equal task.status, 'inactive'

    it "generates Id", ->
      assert.ok task.id
