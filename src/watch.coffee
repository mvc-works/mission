
chokidar = require 'chokidar'

exports.task = (opts) ->
  context = common.extend opts

  context.files.forEach (item) ->
    watcher = chokidar.watch item.from,
      ignored: /[\/\\]\./
      persistent: true
    watcher.on 'change', (filepath) ->
      extname = path.extname filepath
      context.change filepath, extname