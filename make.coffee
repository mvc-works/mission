
require 'shelljs/make'

target.compile = ->
  exec './node_modules/.bin/coffee -o lib/ -bc src/'
  console.log 'done: compile coffee'
