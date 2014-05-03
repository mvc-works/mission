
require 'shelljs/global'

path = require 'path'

createFile = (base, data) ->
  for key, value of data
    dest = path.join base, key
    if typeof value is 'string'
      value.to dest
    else if typeof value is 'object'
      mkdir '-p', dest
      createFile dest, value

exports.task = (tree) ->
  createFile '.', tree