
station = require 'devtools-reloader-station'

watching = no

handler =
  reload: (query) ->
    if watching
      station.reload query

exports.task = ->
  if not watching
    station.start()
    setTimeout ->
      watching = yes
    , 4000

  handler