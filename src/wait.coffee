
exports.task = (chan, task) ->
  console.log "doing: waiting for #{chan.name or 'task'}"
  do look = ->
    if chan.done then task()
    else setTimeout look, 200