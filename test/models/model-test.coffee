assert = require 'assert'
Model = require '../../models/model'

describe "Model", ->
  model = null
  before ->
    model = new Model

  it "should output name it's class",->
    assert.equal model.className(), "Model"
