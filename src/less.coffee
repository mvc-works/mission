
path = require 'path'

common = require './common'

exports.task = (opts) ->
  context = common.expand opts
  options = context.options

  for item in context.files
    command = "lessc #{item.from} #{item.to}"
    command+= " --source-map=#{item.to}.map"
    command+= " --source-map-basepath=#{options.basepath}"
    command+= " --source-map-rootpath=#{options.rootpath}"
    exec command

  console.log "done: compiled LESS in #{context.from}"