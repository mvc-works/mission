
require 'shelljs/make'

mission = require '../../src/'

target.sync = ->
  mission.rsync
    file: 'a/'
    options:
      dest: '192.168.0.21:/home/jarvis/qiniu/'