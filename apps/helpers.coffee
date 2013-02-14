helpers = (app) ->
  app.locals
    urlFor: (obj) ->
      if obj.id
        "/tasks/#{obj.id}"
      else
        "/tasks"

module.exports = helpers
