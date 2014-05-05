
require 'shelljs/global'
path = require 'path'

common = require './common'

exports.task = (arg) ->
  context = common.expand arg

  for item in context.files
    destDir = path.dirname item.to
    mkdir '-p', destDir
    cp '-r', item.from, destDir

  console.log "done: copied #{context.from or 'files'}"