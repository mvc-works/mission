
require 'shelljs/make'

mission = require '../../src/'
path = require 'path'

target.build = ->
  mission.dot
    find: /\.html$/
    from: 'src/'
    to: 'script/'
    dest: 'template.js'
    options:
      rename: (longPath) ->
        shorter = path.relative 'src/script/views', longPath
        shorter = shorter.replace(/\//g, '-').replace('-template', '')
        path.basename shorter, '.html'