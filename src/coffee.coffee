
require 'shelljs/global'
path = require 'path'
fs = require 'fs'

coffee = require 'coffee-script'

common = require './common'

exports.task = (opts) ->
  context = common.expand opts
  {options} = context

  for item in context.files
    if options.sourceMap
      options.sourceFiles = [path.basename item.from]
      options.generatedFile = path.basename item.to
      fromDir = path.dirname item.from
      toDir = path.dirname item.to
      options.sourceRoot = path.relative toDir, fromDir

      anwser = coffee.compile (cat item.from), options

      mapFile = path.basename item.to
      js = "#{anwser.js}\n//# sourceMappingURL=./#{mapFile}.map"
      common.write item.to, js
      common.write "#{item.to}.map", anwser.v3SourceMap
    else
      js = coffee.compile (cat item.from), options
      common.write item.to, js
      rm '-f', "#{item.to}.map"

  console.log "done: compiled coffee files in #{context.from}"