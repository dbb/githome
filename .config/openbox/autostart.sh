xsetroot -solid '#1a1a1a'

if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

xrdb -load $HOME/.Xdefaults

# Preload stuff for KDE apps
if which start_kdeinit >/dev/null; then
 LD_BIND_NOW=true start_kdeinit --new-startup +kcminit_startup &
fi

# Others

sh $HOME/.fehbg
sleep 1s && tint2 &
# xcompmgr -c -t-5 -l-5 -r4.7 -o.65 &
kmix --keepvisibility &
#klipper &
#sleep 4s && korganizer &

#syndaemon -i 2 -d -t -K
$HOME/bin/middle-click

sleep 1s && urxvt &


