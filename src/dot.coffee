
dot = require 'dot'
path = require 'path'

common = require './common'

exports.task = (opts) ->

  context = common.expand opts
  for item in context.files
    content = cat item.from
    code = dot.template(content).toString()
    code = "define([],function(){return " + code + "});"

    common.write item.to, code
  console.log 'done: dot'