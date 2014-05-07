
Mission: common tasks in Web development
------

### About

In this repo are some widely used tasks of Web developments as Grunt plugins.
Now I trying to use `shelljs/make` with it.

By now it's under development.

The configuration is like:

```coffee
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

And you will probably run it like:

```bash
./make.coffee coffee
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

* `coffee`: compile CoffeeScript to JavaScript

* `watch`: watch directories, callback `filename`s and `extname`s

* `time`: log the time it cost

* `realod`: reload tab with `devtools-reloader-station`

* `browserify`: combine JavaScript code on CommonJS

* `cssmin`: combine CSS files and minify code

* `dot`: precompile dot files to JavaScript

* `jade`: compile Jade to HTML

* `less`: compile LESS to CSS

SourceMap is enabled by default, and here I have to use command line.

And this is more like a bug.
https://github.com/less/less.js/issues/1985

Anyway, `mission.less` needs to be updated in the future.

* `rsync`: run Rsync with some default configs

* `copy`: copy files and directories

* `wait`: wait `chan.done = false` to be `true` and run task

### Notice

Asynchronous callings are hard to handle in ShellJS.
In this angle, Grunt did a good job in sequencing tasks.

### Development

Compile `*.coffee`:

```
./make.coffee compile
```

### License

MIT