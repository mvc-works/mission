
require 'shelljs/make'

mission = require '../../src/'
path = require 'path'

target.build = ->
  mission.dot
    find: /\.html$/
    from: 'html/'
    to: 'build/'
    dest: 'template.js'
    options:
      rename: (longPath) ->
        longPath