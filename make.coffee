#!/usr/bin/env coffee

require 'shelljs/make'

mission = require './src'

target.compile = ->
  mission.coffee
    find: /\.coffee$/
    from: 'src/'
    to: 'lib/'
    extname: '.js'
    options:
      bare: yes

target.patch = ->
  target.compile()
  mission.bump
    file: 'package.json'
    options:
      at: 'patch'
