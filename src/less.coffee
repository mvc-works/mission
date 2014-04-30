
path = require 'path'

common = require './common'

exports.task = (opts) ->
  context = common.expand opts
  for item in context.files
    command = "./node_modules/.bin/lessc #{item.from} #{item.to}"
    command+= " --source-map=#{toPath}.map"
    command+= " --source-map-basepath=#{opts.basepath}"
    command+= " --source-map-rootpath=#{opts.rootpath}"
    exec command
  console.log 'done: compiled less'