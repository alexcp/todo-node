class Task
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


module.exports = Task
