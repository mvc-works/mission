
require 'shelljs/make'

mission = require '../../src/'

target.build = ->
  mission.browserifyVender
    files: './js/a.js'
    to: 'build/ex.main.js'
    options:
      external: ['./ex']