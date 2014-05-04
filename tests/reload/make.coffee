
require 'shelljs/make'

mission = require '../../src/'

target.repeat = ->
  station = mission.reload()
  do repeat = ->
    station.reload 'baidu.com'
    setTimeout repeat, 2000
