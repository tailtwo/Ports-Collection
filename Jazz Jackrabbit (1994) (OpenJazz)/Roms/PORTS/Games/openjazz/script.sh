#!/bin/sh
mydir=`pwd`
miyoodir=/mnt/SDCARD/miyoo
sysdir=/mnt/SDCARD/.tmp_update
export SDL_VIDEODRIVER=mmiyoo
export EGL_VIDEODRIVER=mmiyoo
export SDL_AUDIODRIVER=dsp

if [ -e "$sysdir/bin/infoPanel" ]; then
    if [ ! -d "$mydir/game/" ]; then
        infoPanel -t "Missing data files" -m "Folder: game \n Is empty in the root of this app \n\n Extract game assets there and try again" --auto 2> /dev/null
        touch /tmp/dismiss_info_panel
        sleep 4
        rm -rf /tmp/dismiss_info_panel
        exit
    fi
fi

cd "$mydir"
export LD_PRELOAD="$mydir/lib/libSDL2-2.0.so.0:$miyoodir/lib/libpadsp.so"
./OpenJazz game
unset LD_PRELOAD
