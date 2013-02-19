assert = require 'assert'
Model = require '../../models/model'

describe "Model", ->
  model = null
  before ->
    model = new Model
