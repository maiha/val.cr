# val.cr [![Build Status](https://travis-ci.org/maiha/val.cr.svg?branch=master)](https://travis-ci.org/maiha/val.cr)

Scala-ish lazy `val`, `var` for [Crystal](http://crystal-lang.org/).

- crystal: 0.20.4

```yaml
dependencies:
  val:
    github: maiha/val.cr
    version: 0.1.0
```

## Usage

```crystal
require "val"

class Foo
  val x = 1
  var y = "123"

  val z : Int32 = (a = [1]; a << 2; a.sum)
end

foo = Foo.new
foo.x         # => 1
foo.y = "xxx" # => "xxx"
foo.z         # => 3
```

## NOTE

`val` is almost same as `getter` except two points.
- 1. `getter` with `=` evaulates code immediately, but `val` runs lazily.
- 2. `getter` with `=` fails with multiple lines, but `val` accepts it.

Although `getter` with `block` runs lazily, block format has less readability than `=`.

## Contributing

1. Fork it ( https://github.com/maiha/val.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [maiha](https://github.com/maiha) maiha - creator, maintainer
