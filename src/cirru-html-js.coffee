
shelljs = require 'shelljs'

common = require './common'

path = require 'path'

{render} = require 'cirru-html-js'

template = (code) ->
  """define(function() {
    var tmpl = {};
    #{code}
    return tmpl;
  });
  """

exports.task = (opts) ->
  context = common.expand opts
  codeList = []

  for item in context.files
    unless context.options?.rename?
      throw new Error "requires rename strategy"
    code = render (cat item.from)
    name = JSON.stringify (context.options.rename item.from)
    codeList.push "tmpl[#{name}]=#{code};"

  common.write context.dest, template(codeList.join('\n\n'))
  console.log "done: converted Cirru files in #{context.from}"