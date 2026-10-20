#!/bin/bash
# Runs INSIDE the Ubuntu proot container
set -e
export DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade -y
apt install -y sudo nano git wget curl dbus-x11 pulseaudio-utils \
  cinnamon-desktop-environment nemo gnome-terminal \
  python3 sassc make fonts-noto

# Non-root user
id mint >/dev/null 2>&1 || useradd -m -s /bin/bash -G sudo mint
echo "mint ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/mint

# Mint-Y icons + themes straight from upstream Linux Mint (GPL-3.0)
cd /tmp
git clone --depth 1 https://github.com/linuxmint/mint-y-icons.git || true
cp -r mint-y-icons/usr/share/icons/* /usr/share/icons/ 2>/dev/null || true
git clone --depth 1 https://github.com/linuxmint/mint-themes.git || true
(cd mint-themes && make >/dev/null 2>&1 && cp -r usr/share/themes/* /usr/share/themes/) || \
  echo "Mint-Y GTK theme build skipped (icons still installed)."

# Defaults
su - mint -c "dbus-launch gsettings set org.cinnamon.desktop.interface icon-theme 'Mint-Y-Aqua'" || true
echo "Guest setup complete."
