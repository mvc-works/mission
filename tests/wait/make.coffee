
require 'shelljs/make'

mission = require '../../src/'

target.test = ->
  a = done: no
  mission.wait a, ->
    console.log 'finish task'

  setTimeout ->
    a.done = yes
  , 2000