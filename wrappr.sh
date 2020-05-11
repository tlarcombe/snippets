#!/bin/bash  

startme() {
    sudo protonvpn d
    cd ~/home/path/to/my/working-directory
    transmission-gtk &
    thunderbird &
    echo Started Normal Apps
}

stopme() {
    pkill -f "thunderbird" 
    echo Killing thunderbird to stop Google complaints about logging in from new IP
    pkill -f "transmission"
    echo Killing transmission to stop VPN provider complaints about P2P
    sudo protonvpn c -f
}

case "$1" in 
    start)   startme ;;
    stop)    stopme ;;
    restart) stopme; startme ;;
    *) echo "usage: $0 start|stop|restart" >&2
       exit 1
       ;;
esac
