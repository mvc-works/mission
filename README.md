
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

### Usage

* `tree`: creates file tree

* `bump`: bump version for file configs like `package.json`.

There's a bug in `node-semver`. Package will update when it's fixed.
https://github.com/isaacs/node-semver/pull/66


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