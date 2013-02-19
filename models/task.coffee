Model = require '../models/model'

class Task extends Model

  @key: ->
    "Task:#{process.env.NODE_ENV}"

  constructor: (attributes) ->
    @[key] = value for key, value of attributes
    @setDefaults()
    @generateId()
    @

  setDefaults: ->
    unless @status
      @status = 'inactive'

module.exports = Task
