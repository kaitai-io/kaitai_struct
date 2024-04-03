# Kaitai Struct

[![Join the chat at https://gitter.im/kaitai_struct/Lobby](https://badges.gitter.im/kaitai_struct/Lobby.svg)](https://gitter.im/kaitai_struct/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

> **Note:** if you want to make changes to the project, do **not** fork this repository *kaitai_struct*. Instead, choose the component you want to modify in the file tree above and fork **that** individual component instead.
>
> This is an umbrella repository, containing the components only as submodules to make it easier to check out the entire project. Unless you want to modify this README, it is not the repo where you can make edits.

## What is Kaitai Struct?

Kaitai Struct is a declarative language used for describing various
binary data structures laid out in files or in memory: i.e. binary
file formats, network stream packet formats, etc.

The main idea is that a particular format is described in Kaitai
Struct language only once and then can be compiled with a `ksc` into
source files in one of the supported programming languages. These
modules will include a generated code for a parser that can read
described data structure from a file / stream and give access to it in
a nice, easy-to-comprehend API.

To see an example, visit https://kaitai.io/#quick-start.

## What it's used for?

Have you ever found yourself writing repetitive, error-prone and
hard-to-debug code that reads binary data structures from file /
network stream and somehow represents them in memory for easier
access?

Kaitai Struct tries to make this job easier — you only have to
describe the binary format once and then everybody can use it from their
programming languages — cross-language, cross-platform.

Kaitai Struct includes a growing collection of format descriptions,
available in
[formats](https://github.com/kaitai-io/kaitai_struct_formats)
submodule repository.


## Downloading and installing

The easiest way to check out the whole Kaitai Struct project is to
download the main project repository that already imports all other parts
as submodules. Use:

    git clone --recursive https://github.com/kaitai-io/kaitai_struct.git

Note the `--recursive` option.

Alternatively, one can check out individual subprojects that
consitute Kaitai Struct suite. They are:

* [kaitai_struct_compiler](https://github.com/kaitai-io/kaitai_struct_compiler) — compiler that translates `.ksy` into a parser source code written in a target programming language
* [kaitai_struct_tests](https://github.com/kaitai-io/kaitai_struct_tests) — tests & specs to ensure that compiler work as planned
* Runtime libraries
  * [kaitai_struct_cpp_stl_runtime](https://github.com/kaitai-io/kaitai_struct_cpp_stl_runtime) — for C++/STL
  * [kaitai_struct_csharp_runtime](https://github.com/kaitai-io/kaitai_struct_csharp_runtime) — for C#
  * [kaitai_struct_java_runtime](https://github.com/kaitai-io/kaitai_struct_java_runtime) — for Java
  * [kaitai_struct_javascript_runtime](https://github.com/kaitai-io/kaitai_struct_javascript_runtime) — for JavaScript
  * [kaitai_struct_nim_runtime](https://github.com/kaitai-io/kaitai_struct_nim_runtime) — for Nim
  * [kaitai_struct_lua_runtime](https://github.com/kaitai-io/kaitai_struct_lua_runtime) — for Lua
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
  that file in your project
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
