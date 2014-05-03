
fs = require 'fs'
path = require 'path'

browserify = require 'browserify'
exorcist = require 'exorcist'

common = require './common'

exports.task = (opts) ->
  context = common.expand opts
  count = 0
  for item in context.files
    count += 1

    bundle = browserify([item.from]).bundle debug: yes
    common.write item.to, ''

    bundle
    .pipe (exorcist "#{item.to}.map")
    .pipe (fs.createWriteStream item.to, 'utf8')

    bundle.on 'end', ->
      count -= 1
      if count is 0
        console.log 'done: run browserify on code'
        opts.done?()