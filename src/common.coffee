
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
    trigger: opts.trigger
    data: opts.data
    dest: opts.dest

  files = switch
    when opts.find?
      ls('-R', opts.from).filter (name) ->
        name.match opts.find
    when opts.files?
      opts.files
    when opts.file?
      [opts.file]
    else
      files = []

  if opts.to? and opts.dest?
    context.dest = path.join context.to, opts.dest

  for file in files
    from = if context.from? then (path.join context.from, file) else file
    to = if context.to? then (path.join context.to, file) else file
    if opts.extname? then to = to.replace /\.\w+$/, opts.extname
    context.files.push {from, to}

  context

exports.stringify = (data) ->
  JSON.stringify data, null, 2