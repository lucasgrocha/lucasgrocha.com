#!/bin/bash

read -p "Post title: " post_title

converted_title=$(echo "$post_title" | tr '[:space:]' '-' | tr '[:upper:]' '[:lower:]' | tr -d "“'" | sed 's/^-//; s/-$//')
converted_title_with_extension="${converted_title}.md"

./bin/generate_og_image.sh "$post_title"

hugo new posts/$converted_title_with_extension

