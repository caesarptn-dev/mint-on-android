#!/data/data/com.termux/files/usr/bin/bash
pkill -f cinnamon; pkill -f termux.x11; pulseaudio --kill 2>/dev/null
echo "Stopped."
