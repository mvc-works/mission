
semver = require 'semver'

exports.task = (opts) ->
  files = opts.files or [opts.file]
  for file in files
    config = JSON.parse (cat file)
    config.version = semver.inc config.version, opts.at
  (JSON.stringify bower, null, 2).to file

  console.log "done: bumped #{files.join ', '} => #{config.version}"