
{rsync} = require 'rsyncwrapper'

common = require './common'

exports.task = (arg) ->
  context = common.expand arg
  options = context.options

  options.recursive = yes unless options.recursive?
  options.compareMode = 'checksum' unless options.compareMode?

  options.src = context.files.map (item) ->
    item.from

  if options.dest.indexOf(':') > 1
    options.ssh = yes unless options.ssh?

  rsync options, (error, stdout, stderr, cmd) ->
    if error? then throw error
    console.log stdout
    console.log "done: synced to #{options.dest}"
    context.trigger?()