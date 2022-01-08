#!/bin/bash

readonly RSYNC_TARGET="root@philthemaker.com:/var/www/philthemaker.com"
readonly RSYNC_OPTIONS=(-rv --checksum --ignore-times)

echo
echo 'Upload DRY-RUN...'
rsync --dry-run "${RSYNC_OPTIONS[@]}" ./src/ "$RSYNC_TARGET"

echo
read -p "Check: Upload Now? [y/n]" -n 1 -r
echo # newline

if [[ $REPLY =~ ^[Yy]$ ]]
then
echo 'Upload...'
rsync "${RSYNC_OPTIONS[@]}" ./src/ "$RSYNC_TARGET"
fi
