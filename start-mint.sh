#!/data/data/com.termux/files/usr/bin/bash
pkill -f termux.x11 2>/dev/null
pulseaudio --start --exit-idle-time=-1 \
  --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1"
termux-x11 :0 >/dev/null 2>&1 &
sleep 2
am start -n com.termux.x11/com.termux.x11.MainActivity >/dev/null 2>&1

proot-distro login ubuntu --user mint --shared-tmp -- bash -c '
  export DISPLAY=:0 PULSE_SERVER=127.0.0.1 XDG_RUNTIME_DIR=/tmp
  export LIBGL_ALWAYS_SOFTWARE=1 GALLIUM_DRIVER=llvmpipe
  dbus-launch --exit-with-session cinnamon-session-cinnamon2d 2>/dev/null \
    || dbus-launch --exit-with-session cinnamon-session'
