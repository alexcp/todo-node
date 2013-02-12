routes = (app) ->

  app.get '/login', (req, res) ->
    res.render "#{__dirname}/views/login",
      title: 'Login'
      stylesheet: 'login'

  app.post '/sessions', (req, res) ->
    if ('test' is req.body.user) and ('12345' is req.body.password)
      req.session.currentUser = req.body.user
      req.flash 'info', "You are logged in as #{req.session.currentUser}"
      res.redirect '/login'
      return
    req.flash 'error', "Sorry, those credentials were incorrect. Please try again."
    res.redirect '/login'

module.exports = routes
