
UglifyJS = require 'uglify-js'
path = require 'path'

common = require './common'

exports.task = (opts) ->
  context = common.expand opts

  for item in context.files
    fromPath = path.join opts.from, file
    toPath = path.join opts.to, (file.replace '.js', '.min.js')

    common.write item.to, UglifyJS.minify(item.from).code

  console.log 'done: uglify code'