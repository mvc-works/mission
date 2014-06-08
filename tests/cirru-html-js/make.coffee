
require 'shelljs/make'

mission = require '../../src/'
path = require 'path'

target.build = ->
  mission.cirruHtmlJs
    find: /\.cirru$/
    from: 'views'
    to: 'script/'
    dest: 'template.js'
    options:
      rename: (longPath) ->
        longPath