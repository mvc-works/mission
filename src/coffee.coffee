
require 'shelljs/global'
path = require 'path'
fs = require 'fs'

coffee = require 'coffee-script'

common = require './common'

trimRightSlash = (str) ->
  if str[str.length - 1] is '/'
    str[...-1]
  else
    str

exports.task = (opts) ->
  context = common.expand opts

  for item in context.files
    js = coffee.compile (cat item.from), context.options
    common.write item.to, js

  console.log 'done: coffee compiled'