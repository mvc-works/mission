
path = require 'path'
gaze = require 'gaze'

common = require './common'

exports.task = (opts) ->
  context = common.expand opts

  files = context.files

  trigger = (filepath) ->
    if filepath?
      extname = path.extname filepath
      context.trigger filepath, extname

  files.forEach (item) ->
    gaze item.from, (err, watcher) ->
      @on 'changed', trigger
      @on 'added', trigger

  fileFroms = files.map (item) ->
    item.from

  console.log "done: watching #{fileFroms.join(' ')}"