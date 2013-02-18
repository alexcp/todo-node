redis = require('redis').createClient()

class Model

  redis_key:->
    "#{@className()}:#{process.env.NODE_ENV}"

  constructor: (attributes) ->
    @[key] = value for key, value of attributes
    @

  isValid: ->
    true

  generateId:->
    @id = redis.incr @redis_key()

  className: ->
    @.constructor.name
  
  save: (callback) ->
    if @isValid()
      @generateId()
      redis.hset @redis_key(), @id, JSON.stringify(@), (err, code) =>
        callback null, @

module.exports = Model
