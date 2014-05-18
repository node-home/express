module.exports = (socket, emitter) ->
  emitter.on 'topic', (topic, callback) ->
    socket.on topic, callback
