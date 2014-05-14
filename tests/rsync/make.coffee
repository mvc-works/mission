
require 'shelljs/make'

mission = require '../../src/'

target.sync = ->
  mission.rsync
    from: './'
    dest: 'tiye:~/test/'
    options:
      exclude: ['make.coffee']