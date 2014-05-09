
dot = require 'dot'
path = require 'path'

common = require './common'

template = (code) ->
  encodeHTMLSource = ->
    encodeHTMLRules =
      "&": "&#38;"
      "<": "&#60;"
      ">": "&#62;"
      '"': '&#34;'
      "'": '&#39;'
      "/": '&#47;'
    matchHTML = /&(?!#?w+;)|<|>|"|'|\//g
    @.replace matchHTML, (m) ->
      encodeHTMLRules[m] or m

  encode = encodeHTMLSource.toString()

  """
define(function() {

String.prototype.encodeHTML=#{encode};

var tmpl = {};

#{code}

return tmpl;
});
  """

exports.task = (arg) ->
  context = common.expand arg

  codeList = []

  for item in context.files
    content = cat item.from

    unless context.options?.rename?
      throw new Error "requires rename strategy"
    name = JSON.stringify (context.options.rename item.from)

    code = dot.template(content).toString()
    codeList.push "tmpl[#{name}]=#{code};"

  result = codeList.join('\n\n')

  common.write context.dest, (template result)
  console.log 'done: dot'