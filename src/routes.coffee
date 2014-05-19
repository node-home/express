{parse} = require 'url'

module.exports = (app, bus) ->
  bus.on 'manifest', (url, getter) ->
    console.log "OPTIONS", url
    path = parse(url).pathname
    app.options path, (req, res) ->
      res.json getter()

  bus.on 'endpoint', (method, url, endpoint) ->
    console.log method, url
    verb = method.toLowerCase()
    path = parse(url).pathname
    app[verb] path, (req, res) ->
      res.json endpoint req.body
