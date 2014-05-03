
require 'shelljs/make'

mission = require '../../src/index'

target.test = ->

  mission.tree
    a: 'a'
    b: 'b'
    c:
      d: 'd'
      e: 'e'
      f:
        g: 'g'