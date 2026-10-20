# Mint-on-Android (unofficial)

Run a **Linux Mint–style Cinnamon desktop** on Android — no root required.
Uses Termux + proot-distro (Ubuntu 24.04 arm64, the base Mint is built on) + Termux:X11,
with Mint-Y themes/icons pulled from upstream Linux Mint.

> Not affiliated with or endorsed by the Linux Mint project. Official Mint has no
> ARM build, so this is Ubuntu + Cinnamon + Mint artwork.

## Requirements
- Android 8+ with ~6 GB free storage, 4 GB+ RAM recommended
- [Termux](https://f-droid.org/packages/com.termux/) (F-Droid build, **not** Play Store)
- [Termux:X11 app](https://github.com/termux/termux-x11/releases)

## Install
```bash
pkg install -y git
git clone https://github.com/caesarptn-dev/mint-on-android
cd mint-on-android
bash install.sh
```

## Use
```bash
~/bin/start-mint.sh   # launches desktop in Termux:X11
~/bin/stop-mint.sh
```
User: `mint` (passwordless sudo inside the container).

## Troubleshooting
- **Black screen:** in Termux:X11 settings, enable "Prefer scancode" off / try landscape; rerun start script.
- **Cinnamon crashes:** the script falls back to the 2D session automatically (software rendering).
- **No sound:** make sure PulseAudio is running (`pulseaudio --start`).
- **Slow:** close background apps; software rendering is CPU-bound.

## Roadmap
- [ ] XFCE / MATE fallback option
- [ ] Prebuilt rootfs release
- [ ] GPU acceleration (virgl / Turnip on Adreno)
- [ ] Mint apps (Warpinator, Xed, Xreader)

## License
MIT for these scripts. Mint-Y themes/icons are GPL-3.0 (© Linux Mint).
Contributions welcome — open an issue or PR.
