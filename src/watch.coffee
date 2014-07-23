
chokidar = require 'chokidar'
path = require 'path'

common = require './common'

exports.task = (opts) ->
  context = common.expand opts

  files = context.files

  files.forEach (item) ->
    watcher = chokidar.watch item.from,
      ignored: /[\/\\]\./
      persistent: true

    trigger = (filepath) ->
      if filepath?
        extname = path.extname filepath
        context.trigger filepath, extname

    stable = no
    setTimeout ->
      stable = yes
      console.log "done: activated reloading"
    , 4000

    watcher.on 'change', trigger
    watcher.on 'add', (addPath) ->
      trigger addPath if stable

  fileFroms = files.map (item) ->
    item.from
  console.log "done: watching #{fileFroms.join(' ')}"