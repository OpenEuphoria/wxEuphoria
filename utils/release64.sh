#!/bin/bash

pushd `dirname $0`/.. >/dev/null

export EUDIR=/usr/local/euphoria-4.1.0-Linux-x64
export WXEUPATH=`pwd`/bin/Linux64-Release
export PATH=$WXEUPATH:$EUDIR/bin:$PATH

/bin/bash -i
