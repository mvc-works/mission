
require 'shelljs/make'

mission = require '../../src/'

target.watch = ->
  mission.watch
    file: 'dir'
    trigger: (filename, extname) ->
      console.log 'update:', filename, extname