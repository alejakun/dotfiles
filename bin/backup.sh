#!/bin/sh

echo "📤  Backing up your System"

if test "$(uname)" = "Darwin";
  then
    source ./backup_mackup
fi
