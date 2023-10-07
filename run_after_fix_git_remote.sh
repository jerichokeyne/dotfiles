#!/bin/sh
URL=$(chezmoi git remote get-url origin)
NEW_URL=$(echo -n $URL | sed 's%^https://%ssh://git@%')
chezmoi git remote set-url origin "$NEW_URL"

