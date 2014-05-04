
require 'shelljs/make'

mission = require '../../src/'

target.build = ->
  mission.browserify
    file: 'app.js'
    from: 'js/'
    to: 'build/'
    extname: '.min.js'
