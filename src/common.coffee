
path = require 'path'

exports.write = (file, content) ->
  mkdir '-p', (path.dirname file)
  fs.writeFileSync file, content

exports.copy = (name, dest) ->
  mkdir '-p', (path.dirname name)
  cp '-r', name, dest

exports.expand = (opts) ->
  context =
    files: []
    options: opts.options or {}
  files = opts.files or [opts.file]
  for file in files
    from = path.join options.from, file
    to = path.join options.to, file
    if opts.extname?
      to = to.replace /\.\w+$/, opts.extname
    context.files.push {from, to}
  context