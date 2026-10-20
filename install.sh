#!/data/data/com.termux/files/usr/bin/bash
# Mint-on-Android installer (run inside Termux)
set -e
echo "[1/4] Installing Termux packages..."
pkg update -y && pkg upgrade -y
pkg install -y x11-repo
pkg install -y proot-distro termux-x11-nightly pulseaudio wget git

echo "[2/4] Installing Ubuntu 24.04 (arm64) base..."
proot-distro install ubuntu || true

echo "[3/4] Setting up Cinnamon + Mint look inside the container..."
proot-distro login ubuntu --shared-tmp -- bash -c "$(cat "$(dirname "$0")/setup-guest.sh")"

echo "[4/4] Installing launchers..."
mkdir -p "$HOME/bin"
cp "$(dirname "$0")/start-mint.sh" "$(dirname "$0")/stop-mint.sh" "$HOME/bin/"
chmod +x "$HOME/bin/"*-mint.sh
echo "Done. Run: ~/bin/start-mint.sh"
