#!/bin/sh

SCREENSHOT_PATH="$HOME/screenshots"
EXPORT_PATH="${SCREENSHOT_PATH}/$(date +%Y-%m)"
mkdir "${SCREENSHOT_PATH}" > /dev/null 2>&1
mkdir "${EXPORT_PATH}" > /dev/null 2>&1

# probably won't duplicate usernames, but we can increase name length if needed
IMAGE_ID=$(openssl rand -base64 32 | tr -d /=+ | cut -c -16)
$(import -window root "${EXPORT_PATH}/${IMAGE_ID}".png)
