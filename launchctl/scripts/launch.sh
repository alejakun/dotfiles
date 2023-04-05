#!/bin/bash

launchctl bootout gui/`id -u` ~/Library/LaunchAgents/io.alejakun.screensavers.plist
launchctl bootstrap gui/`id -u` ~/Library/LaunchAgents/io.alejakun.screensavers.plist