
require 'shelljs/make'

mission = require '../../src/'

target.compile = ->
  mission.cirruHtml
    file: 'index.cirru'
    from: 'cirru/'
    to: 'html/'
    extname: '.html'
    data:
      isDev: yes
      isBuild: yes