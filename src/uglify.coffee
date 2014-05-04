
UglifyJS = require 'uglify-js'
path = require 'path'

common = require './common'

exports.task = (opts) ->
  context = common.expand opts

  for item in context.files
    common.write item.to, UglifyJS.minify(item.from).code

  console.log "done: uglify code at #{context.from}"