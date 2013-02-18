Model = require '../models/model'

class Task extends Model

  constructor: (attributes) ->
    @[key] = value for key, value of attributes
    @setDefaults()
    @

  setDefaults: ->
    unless @status
      @status = 'inactive'
    @generateId()

module.exports = Task
