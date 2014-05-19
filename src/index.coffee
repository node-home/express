express    = require 'express'
path       = require 'path'
assets     = require 'connect-assets'
io         = require 'socket.io'
logger     = require 'morgan'
home       = require 'home'
bodyParser = require 'body-parser'

routes     = require './routes'

app        = express()

app.set 'env', process.env.NODE_ENV || 'development'
app.set 'port', process.env.PORT || 8888
app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'

app.use bodyParser()
app.use logger 'dev'
app.use assets helperContext: app.locals
app.use express.static path.join __dirname, 'static'

routes app, home.bus
# do home.init

server = app.listen app.get('port'), ->
  console.log 'Listening on port %d', server.address().port


#socket = io.listen server

module.exports = {app, server}
#module.exports = {app, server, socket}
