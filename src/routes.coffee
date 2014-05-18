{parse} = require 'url'

module.exports = (app, bus) ->
  bus.on 'manifest', (url, getter) ->
    path = parse(url).pathname
    app.options path, (req, res) ->
      res.json getter()

  bus.on 'endpoint', (method, url, endpoint) ->
    verb = method.toLowerCase()
    path = parse(url).pathname
    app[verb] path, (req, res) ->
      res.json endpoint req.params
