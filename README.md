# Kaitai Struct

[![Join the chat at https://gitter.im/kaitai_struct/Lobby](https://badges.gitter.im/kaitai_struct/Lobby.svg)](https://gitter.im/kaitai_struct/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

> **Note:** if you want to make changes to the project, do **not** fork this repository *kaitai_struct*. Instead, choose the component you want to modify in the file tree above and fork **that** individual component instead.
>
> This is an umbrella repository, containing the components only as submodules to make it easier to check out the entire project. Unless you want to modify this README, it is not the repo where you can make edits.

## What is Kaitai Struct?

Kaitai Struct (KS) is a declarative language used to describe various
binary data structures, laid out in files or in memory: i.e. binary
file formats, network stream packet formats, etc.

The main idea is that a particular format is described in Kaitai
Struct language (`.ksy` file) only once and then can be compiled with
`kaitai-struct-compiler` (or `ksc` for short) into source files in one
of the supported programming languages. These modules will include
generated code for a parser that can read the described data structure
from a file or stream and provide access to it in a nice,
easy-to-comprehend API.

## What is it used for?

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

## Using KS in your project

Typically, using formats described in KS in your project involves the
following steps:

* Describe the format — i.e. create a `.ksy` file
* Use a visualizer to debug the format and ensure that it parses data
  properly (official visualizers are [Web IDE](https://ide.kaitai.io/)
  and the console visualizer
  [ksv](https://github.com/kaitai-io/kaitai_struct_visualizer))
* Compile the `.ksy` file into a target language source file and include
  that file in your project
* Add the KS runtime library for your particular language to your
  project (don't worry, it's small and it's there mostly to ensure
  readability of generated code)
* Use the generated class(es) to parse your binary file or stream and
  access its components

To see an example, a list of supported languages, download instructions
and licensing information, visit https://kaitai.io/.
