Model = require '../models/model'
bcrypt = require('bcrypt')

class User extends Model

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

module.exports = User
