
require 'shelljs/make'

mission = require '../../src/'

target.patch = ->
  mission.bump
    files: ['bower.json', 'package.json']
    options:
      at: 'patch'

target.pre = ->
  mission.bump
    files: ['bower.json', 'package.json']
    options:
      at: 'prerelease'
