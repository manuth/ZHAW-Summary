#!/bin/bash
git add .
git commit -m "New Notes..."
git push
if [[ "$1" = "--no-interactive" ]]; then
	read -n 1 -p "press a button"
fi
