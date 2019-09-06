# wxEuphoria 3.1.2 alpha 1

wxEuphoria provides bindings for [wxWidgets](https://www.wxwidgets.org/) in Euphoria. This project is an *all new library* written from the ground up to supercede the previous version at [SourceForge.net](http://wxeuphoria.sourceforge.net/). Such an effort is not without its challenges of course. For one thing, this library is *completely* incompatible with the original, but the new design makes developing with and for wxEuphoria easier than ever before. We also plan to keep this version up to date with wxWidgets as new releases are made available.

## Our Goals

### Take it easy

wxEuphoria is easier to use and learn than ever before. The new wrapper code follows a near one-to-one commitment to the original wxWidgets classes. Most wxWidgets applications written in C++ can be ported to Euphoria with almost no changes to the application structure. Our documentation also follows the original wxWidgets structure very closely.

### Build it better

We provide binary distributions of the required libraries with wxWidgets baked right in. No more external third-party libraries to compile or distribute. You don't need to know C++ or ever run `./configure` or `make` to use wxEuphoria. You'll only have to distribute the binary files you actually need, which makes packaging easier and smaller.

### Learn the hard way

Truth be told, programming in general is not easy and we don't expect to be. We make every effort to document thoroughly and clearly and to provide example code whenever possible. But in the end, wxWidgets is a large, complex assortment of functions and features, so it may take some time to really understand it all. Just because wxEuphoria is *easier* to use doesn't mean it's ever been *easy* to use.

### Get the help you need

- For general questions and discussion, please create a new topic on the [OpenEuphoria Forum](http://openeuphoria.org/forum/).
- For support issues and feature requests, please create a new issue on this [project page](https://github.com/ghaberek/wxEuphoria/issues/).

## Status

- [x] The library builds and runs on Windows 10 32-bit and 64-bit.
- [x] The library builds and runs on Linux Mint 18 64-bit.
- [x] Just a few base and core classes are wrapped and working.
- [ ] No support for *32-bit* Linux (*coming soon!*) or Mac OS X (*maybe?*).
- [ ] No documentation yet. Still trying to figure out what to use.

## Requirements

To use the binaries:
- [OpenEuphoria 4.1.0 Beta 2](https://sourceforge.net/projects/rapideuphoria/files/Euphoria/4.1.0-beta2/) or later

To build from source:
- [CodeLite 13.0](https://codelite.org/) or later
- [TDM-GCC 5.1.0](http://tdm-gcc.tdragon.net/) or later
- [wxWidgets 3.1.2](http://www.wxwidgets.org/) or later
- [InnoSetup 5.0](http://www.jrsoftware.org/) or later (for releasing)

## FAQ

### Why not update and extend the old library?

[Matthew Lewis](https://github.com/matthewwalkerlewis), the original author of wxEuphoria, did a great job on that library and we owe him a great deal of credit for his efforts. The very core of this new library is still based on his code. However, as time has moved on, the old library fell further behind the release of wxWidgets, which made it difficult to bring into the modern age. We used this as an opportunity to bring the whole thing up to date with modern tools.

### Can I use this with Euphoria 3.1.x or 4.0.x?

No. This is not supported. Please do not try to do this. Bad things will happen.

## History

### January 20, 2017

- Added `wxAppConsole` and `wxApp` functions.
- Added `wxObject` and `wxClassInfo` functions.
- Added a couple demos (see `demo/wx/`).
- Added preliminary support for Linux builds.
- Reworked external memory allocation functions.

### January 14, 2017

- Posted project to [GitHub](https://github.com/ghaberek/wxEuphoria) and [OpenEuphoria.org](openeuphoria.org/forum/130722.wc).

### January 8, 2017

- Added `check.ex` for basic wrapper sanity checking.

### January 2, 2017

- Added `newclass.cmd` for quick deployment of wrappers on Windows.
- Added multiple command scripts for spawning test shells on Windows.
  - `debug32.cmd`
  - `debug64.cmd`
  - `release32.cmd`
  - `release64.cmd`

### December 26, 2016

- A simple GUI application can be created.
- Event handling seems to work correctly.

### December 17, 2016

- Development begins on wxEuphoria.
- Base and core libraries compile and link.

