redis = require('redis').createClient()

class Task
  @key: ->
    "Task:#{process.env.NODE_ENV}"

  constructor: (attributes) ->
    @[key] = value for key, value of attributes
    @setDefaults()
    @

  setDefaults: ->
    unless @status
      @status = 'inactive'
    @generateId()

  generateId: ->
    if not @id and @name
      @id = @name.replace /\s/g, '-'

  save: (callback) ->
    @generateId()
    redis.hset Task.key(), @id, JSON.stringify(@), (err, code) =>
      callback null, @


module.exports = Task
