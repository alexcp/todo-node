assert = require 'assert'
User = require '../../models/user'

describe "User", ->
  describe "create", ->
    user = null
    before ->
      user = new User {username: "test", email: "test@example.com", password: "12345"}

    it "should assign username",->
      assert.equal user.username, "test"

    it "should hash the password", ->
      assert.notEqual user.password, "12345"

    it "should perform basic validation", ->
      assert.ok user.isValid

    it "should check if password is valid", ->
      assert.ok user.tryPassword "12345"

  describe "find", ->
    user = null
    before ->
      user = new User {username: "test", email: "test@example.com", password: "12345"}
      user.save()

    it "should find a user with it's id", ->
      assert.equal User.find(user.id), user

