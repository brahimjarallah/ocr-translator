# OCR Translator for Hyprland (Arch Linux)

Translate any word **directly from the screen** into multiple languages  
(English, French, German, Arabic by default) with one hotkey 🚀

---

## ✨ Features
- 📸 Select any word on screen → OCR with `tesseract`
- 🌍 Translates into multiple languages (configurable)
- 🔔 Shows results in a persistent notification
- 📋 Copies translations to clipboard
- 🪶 Minimal, lightweight, Wayland-friendly

---

## 📦 Installation

Clone repo and run installer:

```bash
git clone https://github.com/brahimjarallah/ocr-translator.git
cd ocr-translator
./install.sh



⚙️ Hyprland Config

Add to ~/.config/hypr/hyprland.conf:

bind = SUPER, T, exec, ~/.local/bin/ocr-trans


Reload Hyprland:

hyprctl reload


Now press SUPER+T, select a word on screen, and enjoy instant translations 🎉

🔧 Configuration

Edit ~/.config/ocr-translator/langs.conf to choose languages:

LANGS="en fr de ar es it ja"


en → English

fr → French

de → German

ar → Arabic (fixed shaping)

es → Spanish

it → Italian

ja → Japanese

🛠 Dependencies

tesseract + language data (e.g. tesseract-data-eng)

grim, slurp (Wayland screenshot tools)

translate-shell

dunst

wl-clipboard

fribidi

Install with:

sudo pacman -S tesseract tesseract-data-eng grim slurp translate-shell dunst wl-clipboard fribidi
