#!/bin/sh

source ./set_env.sh

if [ $# -eq 0 ]; then
    echo "No command supplied, supply backup or restore"

elif test "$(uname)" = "Darwin"; then
    if [[ "$1" == "backup" ]]; then

        echo "📤  Backing up your System"
        source ./scripts/mackup_backup

    elif [[ "$1" == "restore" ]]; then

        echo "📥  Restoring up your System"
        source ./scripts/mackup_restore

    else
      echo "🚫  Unknown command supplied"
    fi
else
    # Other
    echo "$(uname) is not supported" >&2
    exit 1
fi



