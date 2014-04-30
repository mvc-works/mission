
common = require './common'

{renderer} = require 'cirru-html'

exports.task = (opts) ->
  context = common.expand opts
  for item in context.files
    name = item.from
    render = renderer (cat name), '@filename': name
    common.write item.to, (render context.opts.data)
  console.log 'done: converted Cirru files'