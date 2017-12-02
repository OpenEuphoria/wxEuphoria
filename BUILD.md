# Linux

## 32-bit

## Extract

tar xzf wxWidgets-3.1.0.tar.gz
mv wxWidgets-3.1.0{,-32bit}
cd wxWidgets-3.1.0-32bit/build/

### Release

mkdir gtk-release; cd gtk-release
../../configure CFLAGS=-fPIC CXXFLAGS=-fPIC --enable-unicode --disable-shared \
	--without-subdirs --with-expat=builtin --with-libjpeg=builtin --with-libpng=builtin \
	--with-zlib=builtin
make -j4

### Debug

mkdir gtk-debug; cd gtk-debug
../../configure CFLAGS=-fPIC CXXFLAGS=-fPIC --enable-unicode --enable-debug \
	--disable-shared --without-subdirs --with-expat=builtin --with-libjpeg=builtin \
	--with-libpng=builtin --with-zlib=builtin
make -j4

## 64-bit

### Extract

tar xzf wxWidgets-3.1.0.tar.gz
mv wxWidgets-3.1.0{,-64bit}
cd wxWidgets-3.1.0-64bit/build/

### Release

mkdir gtk-release; cd gtk-release
../../configure CFLAGS=-fPIC CXXFLAGS=-fPIC --enable-unicode --disable-shared \
	--without-subdirs --with-expat=builtin --with-libjpeg=builtin --with-libpng=builtin \
	--with-zlib=builtin
make -j4

### Debug

mkdir gtk-debug; cd gtk-debug
../../configure CFLAGS=-fPIC CXXFLAGS=-fPIC --enable-unicode --enable-debug \
	--disable-shared --without-subdirs --with-expat=builtin --with-libjpeg=builtin \
	--with-libpng=builtin --with-zlib=builtin
make -j4

