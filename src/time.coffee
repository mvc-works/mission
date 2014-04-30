
exports.task = ->
  startTime = (new Date).getTime()
  process.on 'exit', ->
    now = (new Date).getTime()
    duration = (now - startTime) / 1000
    console.log "\nfinished in #{duration}s"
