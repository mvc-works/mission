
require 'shelljs/make'

mission = require '../../src/'

target.compile = ->
  mission.jade
    file: 'index.jade'
    from: 'jade/'
    to: 'html/'
    extname: '.html'
    options:
      pretty: yes
    data:
      name: 'configures'