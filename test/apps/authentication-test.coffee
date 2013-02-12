assert = require 'assert'
request = require 'request'
app = require '../../app'

describe "authentication", ->
  describe "GET /login", ->
    body = null
    before (done) ->
      options =
        uri: "http://localhost:3001/login"
      request options, (err, response, _body) ->
        body = _body
        done()

    it "GET /login has user field", ->
      assert.ok /user/.test(body)

  describe "POST /sessions", ->
    describe "incorrect credentials", ->
      [body,response] = [null, null]
      before (done) ->
        options =
          uri: "http://localhost:3001/sessions"
          form:
            user: 'wrong'
            password: 'wrong password'
          followAllRedirects: true
        request.post options, (err, _response, _body) ->
          [body,response] = [_body, _response]
          done()

      it "shows flash message", ->
        assert.ok /alert-error/.test(body)

  describe "DELETE /sessions", ->
    [body,response] = [null, null]
    before (done) ->
      options =
        uri: "http://localhost:3001/sessions"
        followAllRedirects: true
      request.del options, (err, _response, _body) ->
        [body,response] = [_body, _response]
        done()

    it "shows flash message", ->
      assert.ok /alert-info/.test(body)

