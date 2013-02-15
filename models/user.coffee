redis = require('redis').createClient()
bcrypt = require('bcrypt')

class User
  @key: ->
    "User:#{process.env.NODE_ENV}"

  constructor: (attributes) ->
    @[key] = value for key, value of attributes
    @encryptPassword()
    @

  encryptPassword:->
    @password = bcrypt.hashSync @password, 11

  tryPassword: (password)->
    bcrypt.compareSync password, @password

  isValid:->
    @username?.length and @email?.length

  save: (callback) ->
    if @isValid()
      @id = redis.incr User.key()
      redis.hset User.key(), @id, JSON.stringify(@), (err, code) =>
        callback null, @


module.exports = User
