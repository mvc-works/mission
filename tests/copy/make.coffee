
require 'shelljs/make'

mission = require '../../src/'

target.cp = ->
  mission.copy
    files: ['a.cirru', 'dir']
    from: 'a/'
    to: 'b/'