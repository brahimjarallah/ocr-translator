#!/bin/bash

CONFIG_FILE="$HOME/.config/ocr-translator/langs.conf"

# Create config if it doesn't exist
if [ ! -f "$CONFIG_FILE" ]; then
    mkdir -p "$(dirname "$CONFIG_FILE")"
    echo 'LANGS="en fr de ar"' > "$CONFIG_FILE"
fi

# Load languages
source "$CONFIG_FILE"

# OCR selection
WORD=$(grim -g "$(slurp)" - | tesseract stdin stdout 2>/dev/null | head -n1)
[ -z "$WORD" ] && notify-send -t 0 "❌ OCR failed" "No text detected" && exit 1

# Translations
RESULT=""
for LANG in $LANGS; do
    TRANS=$(echo "$WORD" | trans -brief :$LANG 2>/dev/null)
    if [[ "$LANG" == "ar" ]]; then
        TRANS=$(echo "$TRANS" | fribidi)
    fi
    RESULT+="${LANG^^}: $TRANS\n"
done

# Show notification
notify-send -t 0 "🔤 OCR & Translation ($WORD)" "$(echo -e "$RESULT")"

# Copy to clipboard
echo -e "$RESULT" | wl-copy

