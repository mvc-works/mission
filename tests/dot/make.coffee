
require 'shelljs/make'

mission = require '../../src/'

target.build = ->
  mission.dot
    file: 'panel.html'
    from: 'html/'
    to: 'build/'
    extname: '.js'
