
path = require 'path'
CleanCSS = require 'clean-css'

common = require './common'

exports.task = (opts) ->
  clean = new CleanCSS opts.options
  context = common.expand opts
  for item in context.files
    code = clean.minify(cat item.from)
    common.write item.to, code

  console.log 'done: css minified'