
require 'shelljs/make'

mission = require '../../src/'

target.compile = ->
  mission.cirru
    file: 'index.cirru'
    from: 'cirru/'
    to: 'html/'
    extname: '.html'