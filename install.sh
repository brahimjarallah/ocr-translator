#!/bin/bash
set -e

echo "📦 Installing dependencies..."
sudo pacman -S --needed tesseract tesseract-data-eng grim slurp translate-shell dunst wl-clipboard fribidi

INSTALL_DIR="$HOME/.local/bin"
mkdir -p "$INSTALL_DIR"
cp ocr-trans.sh "$INSTALL_DIR/ocr-trans"
chmod +x "$INSTALL_DIR/ocr-trans"

# Setup config
CONFIG_DIR="$HOME/.config/ocr-translator"
mkdir -p "$CONFIG_DIR"
if [ ! -f "$CONFIG_DIR/langs.conf" ]; then
    cp config/langs.conf "$CONFIG_DIR/"
    echo "📝 Default config created at $CONFIG_DIR/langs.conf"
fi

echo "✅ Installed to $INSTALL_DIR/ocr-trans"
echo ""
echo "👉 Add this line to ~/.config/hypr/hyprland.conf:"
echo "bind = SUPER, T, exec, ~/.local/bin/ocr-trans"

