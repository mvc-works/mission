
require 'shelljs/make'

mission = require '../../src/'

target.build = ->
  mission.uglify
    files: ['lib.js', 'main.js']
    from: 'js/'
    to: 'build/'
    extname: '.min.js'