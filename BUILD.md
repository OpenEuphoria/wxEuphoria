# Linux

## Extract

    tar xzf wxWidgets-3.1.0.tar.gz
    cd wxWidgets-3.1.0/build/

## Build

### Debug

    mkdir gtk-debug; cd gtk-debug
    ../../configure CFLAGS=-fPIC CXXFLAGS=-fPIC --enable-unicode --enable-debug \
        --disable-shared --without-subdirs --with-expat=builtin --with-libjpeg=builtin \
        --with-libpng=builtin --with-zlib=builtin
    make -j4

### Release

    mkdir gtk-release; cd gtk-release
    ../../configure CFLAGS=-fPIC CXXFLAGS=-fPIC --enable-unicode --disable-shared \
        --without-subdirs --with-expat=builtin --with-libjpeg=builtin --with-libpng=builtin \
        --with-zlib=builtin
    make -j4

# Windows

## Extract

    7z x wxWidgets-3.1.0.zip
    cd wxWidgets-3.1.0/build/msw/

## Build

### Debug

    mingw32-make -f makefile.gcc BUILD=debug SHARED=0 UNICODE=1 clean
    mingw32-make -f makefile.gcc BUILD=debug SHARED=0 UNICODE=1

### Release

    mingw32-make -f makefile.gcc BUILD=release SHARED=0 UNICODE=1 clean
    mingw32-make -f makefile.gcc BUILD=release SHARED=0 UNICODE=1

