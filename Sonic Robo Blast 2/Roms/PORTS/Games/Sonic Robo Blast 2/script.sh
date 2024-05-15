#!/bin/sh
mydir=`pwd`

cd "$mydir"
export LD_LIBRARY_PATH="$mydir/lib:$LD_LIBRARY_PATH"
export LD_PRELOAD="libmathlib.so:libstringlib.so:libnetworking.so"
./srb2
unset LD_PRELOAD
