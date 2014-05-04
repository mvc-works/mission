
require 'shelljs/global'
path = require 'path'

exports.write = (file, content) ->
  mkdir '-p', (path.dirname file)
  content.to file

exports.copy = (name, dest) ->
  mkdir '-p', (path.dirname name)
  cp '-r', name, dest

exports.expand = (opts) ->
  context =
    files: []
    options: opts.options or {}
    from: opts.from
    to: opts.to

  if opts.find?
    files = ls('-R', opts.from).filter (name) ->
      name.match opts.find
  else
    files = opts.files or [opts.file]

  for file in files
    from = if context.from? then (path.join context.from, file) else file
    to = if context.to? then (path.join context.to, file) else file
    if opts.extname? then to = to.replace /\.\w+$/, opts.extname
    context.files.push {from, to}

  context

exports.stringify = (data) ->
  JSON.stringify data, null, 2