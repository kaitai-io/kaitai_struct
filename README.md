# Kaitai Struct

## What is Kaitai Struct?

Kaitai Struct is a declarative language used for describe various
binary data structures, laid out in files or in memory: i.e. binary
file formats, network stream packet formats, etc.

The main idea is that a particular format is described in Kaitai
Struct language only once and then can be compiled with a `ksc` into
source files in one of the supported programm languages. These modules
will include a generated code for a parser that can read described
data structure from a file / stream and give access to it in a nice,
easy-to-comprehend API.

## What it's used for?

Have you ever found yourself writing repetitive, error-prone and
hard-to-debug code that reads binary data structures from file /
network stream and somehow represents them in memory for easier
access?

Kaitai Struct tries to make this job easier - you only have to
describe binary format once and then everybody can use it from their
programming languages - cross-language, cross-platform.

Kaitai Struct includes a growing collection of format descriptions

## Can you give me a quick example?

Sure. Consider this simple `.ksy` format description file that
describes header of a GIF file (a popular web image format):

```
meta:
  id: gif
  file_extension: gif
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

This `.ksy` file can be compiled it into `Gif.java` / `gif.py` /
`gif.rb` and then instantly one can load .gif file and access, for
example, it's width and height.

### In Java

```java
Gif g = Gif.fromFile("path/to/some.gif");
System.out.println("width = " + g.logicalScreen.imageWidth());
System.out.println("height = " + g.logicalScreen.imageHeight());
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
Struct can do. Please refer to tutorials and documentation for more
insights.

## Supported languages

Official Kaitai Struct compiler now supports compiling `.ksy` into
source modules for the following languages:

* Java
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

* [kaitai_struct_compiler](https://github.com/kaitai-io/kaitai_struct_tests) - compiler that translates `.ksy` → `.java` / `.py` / `.rb`
* [kaitai_struct_tests](https://github.com/kaitai-io/kaitai_struct_tests) - tests & specs to ensure that compiler work as planned
* Runtime libraries 
  * [kaitai_struct_java_runtime](https://github.com/kaitai-io/kaitai_struct_java_runtime) - for Java
  * [kaitai_struct_python_runtime](https://github.com/kaitai-io/kaitai_struct_python_runtime) - for Python
  * [kaitai_struct_ruby_runtime](https://github.com/kaitai-io/kaitai_struct_ruby_runtime) - for Ruby

## Using KS in your project

Typically, using formats described in KS in your project, involves the
following steps:

* Describe the format - i.e. create a `.ksy` file 
* Compile `.ksy` file into `.java` / `.py` / `.rb` file and add it to
  your project
* Add KS runtime library for your particular language into your
  project (don't worry, it's small and it's there mostly to ensure
  readability of generated code)
* Use generated class(es) to parse your binary file / stream and
  access its components

Check out the tutorial and documentation for more information.

## Licensing

## FAQ

### Is it fast?

Yes, pretty much. Kaitai Struct is not a runtime interpreter, but a
compiler - thus it imposes no additional performance penalty. Code
that it generates is about as fast as one can write in a particular
language to parse a certain data format.

### Is it readable?

Yes, Kaitai Struct compiler generates very human-readable files, which
can be examined by naked eye, debugged if needed, etc.

### Similar projects

TODO
