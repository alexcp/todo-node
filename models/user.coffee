redis = require('redis').createClient()
bcrypt = require('bcrypt')

class User
  constructor: (attributes) ->
    @[key] = value for key, value of attributes
    @encrypt_password()
    @

  encrypt_password:->
    @password = bcrypt.hashSync @password, 11

  try_password: (password)->
    bcrypt.compareSync password, @password
    

module.exports = User
