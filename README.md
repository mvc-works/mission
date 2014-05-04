
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

* `bump`: bump version for file configs like `package.json`.

There's a bug in `node-semver`. Package will update when it's fixed.
https://github.com/isaacs/node-semver/pull/66

* `uglify`: minify JavaScript code

* `coffee`: compile CoffeeScript to JavaScript

* `watch`: watch directories, callback `filename`s and `extname`s

* `time`: log the time it cost

* `realod`: reload tab with `devtools-reloader-station`

* `browserify`: combine JavaScript code on CommonJS

* `cssmin`: combine CSS files and minify code

* `dot`: precompile dot files to JavaScript

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