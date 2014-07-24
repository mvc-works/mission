
fs = require 'fs'
path = require 'path'

browserify = require 'browserify'
exorcist = require 'exorcist'

exports.task = (opts) ->
  {options, files} = opts

  b = browserify()
  b.require(files)

  bundle = b.bundle debug: yes

  bundle
  .pipe (exorcist "#{opts.to}.map")
  .pipe (fs.createWriteStream opts.to, 'utf8')

  bundle.on 'end', ->
    console.log "done: run browserify-vender"
    opts.done?()