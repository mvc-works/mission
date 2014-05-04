
require 'shelljs/make'

mission = require '../../src/'

target.compile = ->
  mission.coffee
    find: /\.coffee$/
    from: 'coffee/'
    to: 'js/'
    extname: '.js'
    options:
      bare: yes