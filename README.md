
Mission: common tasks in Web development
------

Bundled tasks for developing single page apps.

### Usage

```bash
npm install --save-dev mission shelljs
```

Config in CoffeeScript or JavaScript:

```coffee
#!/usr/bin/env coffee
require 'shelljs/make'

mission = require 'mission'

target.coffee = ->
  mission.coffee
    from: 'src/'
    files: ['a.coffee', 'dir/b.coffee']
    to: 'lib/'
    options:
      bare: yes
```

Here's mine: https://github.com/jiyinyiyong/mk/blob/master/make.coffee

Run it like this:

```bash
chmod +x make.coffee
./make.coffee coffee
```

or like me:

```bash
alias mk='coffee make.coffee'
mk coffee
```

### Other configurations

Say if you want to compile only one file:

```coffee
target.coffee = ->
  mission.coffee
    file: 'a.coffee'
    from: 'src/'
    to: 'lib/'
    options:
      bare: yes
```

Or you may need to find some files that are deep in folders:

```coffee
target.coffee = ->
  mission.coffee
    find: /\.coffee$/
    from: 'src/'
    to: 'lib/'
    options:
      bare: yes
```

`from` and `to` are optional, you mat only need to write `file` sometimes:

```coffee
target.coffee = ->
  mission.watch
    file: 'dir'
    trigger: (filename, extname) ->
```

### Usage

* `tree`: creates file tree

* `bump`: bump version with `semver`.

* `uglify`: minify JavaScript code

* `coffee`: compile CoffeeScript to JavaScript, with sourceMap support

* `watch`: watch directories, callback `filename`s and `extname`s

* `time`: log the time it cost

* `realod`: reload tab with `devtools-reloader-station`

* `browserify`: combine JavaScript code on CommonJS

* `cssmin`: combine CSS files and minify code

* `dot`: precompile dot files to JavaScript

* `jade`: compile Jade to HTML

* `less`: compile LESS to CSS

SourceMap is enabled by default, and here I have to use command line.
Related to: https://github.com/less/less.js/issues/1985
Anyway, `mission.less` needs to be updated in the future.

* `rsync`: run Rsync with some default configs

* `copy`: copy files and directories

* `wait`: wait `chan.done = false` to be `true` and run task

* `cirruHtml` compile Cirru HTML

* `cirruHtmlJs` compile Cirru to template in JavaScript(not tested)

### Notice

Asynchronous callings are hard to handle in ShellJS.
In this angle, Grunt did a good job in sequencing tasks.

But you can try `wait` to reduce the pain.
`mission` would keep watching `.done` and run task when it's `true`.

```coffee
target.test = ->
  a = done: no
  mission.wait a, ->
    console.log 'finish task'

  setTimeout ->
    a.done = yes
  , 2000
```

### Development

Compile `*.coffee`:

```
./make.coffee compile
```

### Changelog

* `0.0.7`

  * Add `cirruHtmlJs` and rename `cirruHtml`

* `0.0.6`

  * Updated Cirru HTML to fix double quote in attributes

* `0.0.5`

  * Added `sourceMap` support

* `0.0.4`

  * Added flexibility and some default options to `rsync`

### License

MIT