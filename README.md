# Kaitai Struct

[![Join the chat at https://gitter.im/kaitai_struct/Lobby](https://badges.gitter.im/kaitai_struct/Lobby.svg)](https://gitter.im/kaitai_struct/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## What is Kaitai Struct?

Kaitai Struct is a declarative language used for describe various
binary data structures, laid out in files or in memory: i.e. binary
file formats, network stream packet formats, etc.

The main idea is that a particular format is described in Kaitai
Struct language only once and then can be compiled with a `ksc` into
source files in one of the supported programming languages. These
modules will include a generated code for a parser that can read
described data structure from a file / stream and give access to it in
a nice, easy-to-comprehend API.

## What it's used for?

Have you ever found yourself writing repetitive, error-prone and
hard-to-debug code that reads binary data structures from file /
network stream and somehow represents them in memory for easier
access?

Kaitai Struct tries to make this job easier — you only have to
describe binary format once and then everybody can use it from their
programming languages — cross-language, cross-platform.

Kaitai Struct includes a growing collection of format descriptions,
available in
[formats](https://github.com/kaitai-io/kaitai_struct_formats)
submodule repository.

## Can you give me a quick example?

Sure. Consider this simple `.ksy` format description file that
describes header of a GIF file (a popular web image format):

```yaml
meta:
  id: gif
  file-extension: gif
  endian: le
seq:
  - id: header
    type: header
  - id: logical_screen
    type: logical_screen
types:
  header:
    seq:
      - id: magic
        contents: 'GIF'
      - id: version
        size: 3
  logical_screen:
    seq:
      - id: image_width
        type: u2
      - id: image_height
        type: u2
      - id: flags
        type: u1
      - id: bg_color_index
        type: u1
      - id: pixel_aspect_ratio
        type: u1
```

It declares that GIF file usually has `.gif` extension and uses
little-endian integer encoding. The file itself starts with two
blocks: first comes `header` and then comes `logical_screen`:

* "Header" consists of "magic" string of 3 bytes ("GIF") that
  identifies that it's a GIF file starting and then there are 3 more
  bytes that identify format version (`87a` or `89a`).
* "Logical screen descriptor" is a block of integers:
  * `image_width` and `image_height` are 2-byte unsigned ints
  * `flags`, `bg_color_index` and `pixel_aspect_ratio` take 1-byte
    unsigned int each

This `.ksy` file can be compiled it into `Gif.cs` / `Gif.java` /
`Gif.js` / `gif.py` / `gif.rb` and then instantly one can load .gif
file and access, for example, it's width and height.

### In C\# 

```cs
Gif g = Gif.FromFile("path/to/some.gif");
Console.WriteLine("width = " + g.LogicalScreen.ImageWidth);
Console.WriteLine("height = " + g.LogicalScreen.ImageHeight);
```

### In Java

```java
Gif g = Gif.fromFile("path/to/some.gif");
System.out.println("width = " + g.logicalScreen().imageWidth());
System.out.println("height = " + g.logicalScreen().imageHeight());
```

### In JavaScript

```javascript
var g = new Gif(someArrayBuffer);
console.log("width = " + g.logicalScreen().imageWidth());
console.log("height = " + g.logicalScreen().imageHeight());
```

### In Python

```python
g = Gif.from_file("path/to/some.gif")
print "width = %d" % (g.logical_screen.image_width)
print "height = %d" % (g.logical_screen.image_height)
```

### In Ruby

```ruby
g = Gif.from_file("path/to/some.gif")
puts "width = #{g.logical_screen.image_width}"
puts "height = #{g.logical_screen.image_height}"
```

Of course, this example shows only very limited subset of what Kaitai
Struct can do. Please refer to the tutorials and documentation for
more insights.

## Supported languages

Official Kaitai Struct [compiler] now supports compiling `.ksy` into
source modules for the following languages:

* C#
* Java
* JavaScript
* Python
* Ruby

## Downloading and installing

The easiest way to check out whole Kaitai Struct project is to
download main project repository that already imports all other parts
as sub-modules. Use:

    git clone --recursive https://github.com/kaitai-io/kaitai_struct.git

Note the `--recursive` option.

Alternatively, one can check out individual sub-projects that
consitute Kaitai Struct suite. They are:

* [kaitai_struct_compiler](https://github.com/kaitai-io/kaitai_struct_compiler) — compiler that translates `.ksy` into a parser source code written in a target programming language
* [kaitai_struct_tests](https://github.com/kaitai-io/kaitai_struct_tests) — tests & specs to ensure that compiler work as planned
* Runtime libraries
  * [kaitai_struct_cpp_stl_runtime](https://github.com/kaitai-io/kaitai_struct_cpp_stl_runtime) — for C++/STL
  * [kaitai_struct_csharp_runtime](https://github.com/kaitai-io/kaitai_struct_csharp_runtime) — for C#
  * [kaitai_struct_java_runtime](https://github.com/kaitai-io/kaitai_struct_java_runtime) — for Java
  * [kaitai_struct_javascript_runtime](https://github.com/kaitai-io/kaitai_struct_javascript_runtime) — for JavaScript
  * [kaitai_struct_python_runtime](https://github.com/kaitai-io/kaitai_struct_python_runtime) — for Python
  * [kaitai_struct_ruby_runtime](https://github.com/kaitai-io/kaitai_struct_ruby_runtime) — for Ruby
  * [kaitai_struct_swift_runtime](https://github.com/kaitai-io/kaitai_struct_swift_runtime) — for Swift
* [kaitai_struct_formats](https://github.com/kaitai-io/kaitai_struct_formats)
  — library of widely used formats and binary structures described as
  `.ksy` files

## Using KS in your project

Typically, using formats described in KS in your project, involves the
following steps:

* Describe the format — i.e. create a `.ksy` file
* Compile `.ksy` file into target language source file and include
  that file into your project
* Add KS runtime library for your particular language into your
  project (don't worry, it's small and it's there mostly to ensure
  readability of generated code)
* Use generated class(es) to parse your binary file / stream and
  access its components

Check out the tutorial and documentation for more information.

## Licensing

* [Compiler] — GPLv3+
* Runtime libraries — MIT or Apache v2 (=> you can include generated
  code even into proprietary applications) — see individual libraries
  for details

[compiler]: https://github.com/kaitai-io/kaitai_struct_compiler
