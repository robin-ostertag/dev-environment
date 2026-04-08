#!/bin/bash

OS="$1"

case "$OS" in
  linux)
    SOURCE_FILE="linux/.bashrc"
    ;;
  windows)
    SOURCE_FILE="windows/.bashrc"
    ;;
  *)
    echo "Unknown OS: $OS"
    exit 1
    ;;
esac

if [ ! -f "$SOURCE_FILE" ]; then
  echo "File $SOURCE_FILE does not exist!"
  exit 1
fi

cp "$SOURCE_FILE" ~/.bashrc

printf ".bashrc has been replaced with (%s):\n" "$OS"
cat ~/.bashrc
printf "\n\n"