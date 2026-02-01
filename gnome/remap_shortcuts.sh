#!/usr/bin/env bash

set -e

MODE="$1"

if [[ "$MODE" != "apply" && "$MODE" != "undo" ]]; then
  echo "Usage: $0 apply|undo"
  exit 1
fi

if [[ "$MODE" == "apply" ]]; then
  gsettings set org.gnome.desktop.interface enable-animations false
  gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
else
  gsettings reset org.gnome.desktop.interface enable-animations
  gsettings reset org.gnome.shell.extensions.dash-to-dock hot-keys
fi

for i in {1..9}; do
  if [[ "$MODE" == "apply" ]]; then
    gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
    gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
  else
    gsettings reset org.gnome.desktop.wm.keybindings switch-to-workspace-$i
    gsettings reset org.gnome.shell.keybindings switch-to-application-$i
  fi
done

echo "Done: $MODE"

