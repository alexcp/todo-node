redis = require('redis').createClient()

class Model

  @find:(id)->
    redis.hget this.key(), id

  @key:->
    # need to be overide in class
    "Model:#{process.env.NODE_ENV}"

  constructor: (attributes) ->
    @[key] = value for key, value of attributes
    @

  isValid: ->
    true

  generateId:->
    unless @id
      redis.incr this.constructor.key(), (err, code) =>
        @id = code

  save: (callback) ->
    if @isValid()
      @generateId()
      redis.hset this.constructor.key(), @id, JSON.stringify(@), (err, code) =>
        callback null, @

module.exports = Model
