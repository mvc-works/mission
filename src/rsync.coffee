
{rsync} = require 'rsyncwrapper'

common = require './common'

exports.task = (arg) ->
  context = common.expand arg
  options = context.options

  options.recursive = yes unless options.recursive?
  options.compareMode = 'checksum' unless options.compareMode?

  if context.files.length > 0
    options.src = context.files.map (item) ->
      item.from
  else
    options.src = context.from or './'

  if context.dest? then options.dest = context.dest
  if options.dest.indexOf(':') > 1
    options.ssh = yes unless options.ssh?

  options.onStdout = (data) -> console.log data.toString()
  options.args = ['--verbose']

  rsync options, (error, stdout, stderr, cmd) ->
    if error? then throw error
    console.log '$', cmd
    console.log "done: synced to #{options.dest}"
    context.trigger?()