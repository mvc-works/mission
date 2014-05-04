
require 'shelljs/global'
path = require 'path'
fs = require 'fs'

coffee = require 'coffee-script'

common = require './common'

exports.task = (opts) ->
  context = common.expand opts

  for item in context.files
    js = coffee.compile (cat item.from), context.options
    common.write item.to, js

  console.log "done: compiled coffee files in #{context.from}"