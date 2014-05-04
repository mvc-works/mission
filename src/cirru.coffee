
shelljs = require 'shelljs'

common = require './common'

path = require 'path'

{render, setResolver} = require 'cirru-html'

setResolver (basePath, child, scope) ->
  dest = path.join (path.dirname basePath), child
  scope?['@filename'] = dest
  shelljs.cat dest

exports.task = (opts) ->
  context = common.expand opts
  for item in context.files
    name = item.from
    html = render (cat name), '@filename': name
    common.write item.to, html
  console.log "done: converted Cirru files in #{context.from}"