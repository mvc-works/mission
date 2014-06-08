
doctype

body
  p "a p element"
  @insert ga.html

  p
    @if (@ isDev)
      p "in development"
    @if (@ isBuild)
      p "in build"