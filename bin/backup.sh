#!/bin/sh

echo "📤  Backing up your System"

if test "$(uname)" = "Darwin";
  then
    source ./mackup_backup
fi
