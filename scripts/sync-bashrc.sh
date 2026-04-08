#!/bin/bash

OS="$1"

case "$OS" in
  windows)
    SOURCE_FILE="windows/.bashrc"
    ;;
  *)
    error "Bashrc is only needed for windows: $OS"
    exit 1
    ;;
esac

if [ ! -f "$SOURCE_FILE" ]; then
  error "File $SOURCE_FILE does not exist!"
  exit 1
fi

cp "$SOURCE_FILE" ~/.bashrc

printf ".bashrc has been replaced with (%s):\n" "$OS"