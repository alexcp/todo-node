assert = require 'assert'
Task = require '../../models/task'

describe 'Task', ->
  describe 'create', ->
    task = null
    before ->
      task = new Task {name:'Make a list'}

    it "sets name"
    it "default to a state"
    it "generates Id"
