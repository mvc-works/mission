
require 'shelljs/make'

mission = require '../../src/'

target.less = ->
  mission.less
    file: 'main.less'
    from: 'less/'
    to: 'build/'
    extname: '.css'
    options:
      basepath: __dirname
      rootpath: '../'