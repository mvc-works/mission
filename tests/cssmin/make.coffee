
require 'shelljs/make'

mission = require '../../src/'

target.build = ->
  mission.cssmin
    files: ['home.css', 'app.css']
    from: 'css/'
    to: 'build/'
    extname: '.min.css'
    options:
      relativeTo: 'css/'
      keepSpecialComments: 0