#!/bin/bash

# Set the desired title, subtitle, font, and size
title=""
subtitle=""
font="Roboto-Medium"
font_size_title=100
font_size_subtitle=40

read -p "Title: " title
# read -p "Font size ($font_size_title): " input_font_size_title
read -p "Subtitle: " subtitle

# Set the output file name
converted_text=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr '[:space:]' '-' | sed 's/^-//; s/-$//')
converted_text_with_extension="${converted_text}.png"

# Set the font size to default if the input is empty
# if [ -z "$input_font_size_title" ]; then
#     font_size_title=$font_size_title
# else
#     font_size_title=$input_font_size_title
# fi

# Generate the og:image
convert -size 1200x630 xc:white \
    -gravity center \
    -pointsize $font_size_title \
    -font $font \
    -annotate 0 "$title" \
    -pointsize $font_size_subtitle \
    -annotate +0+80 "$subtitle" \
    "$converted_text_with_extension"

echo "og:image generated successfully as $converted_text_with_extension"

mv $converted_text_with_extension assets/images/banners
