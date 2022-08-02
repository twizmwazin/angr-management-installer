#!/bin/bash

cd $(dirname $0)

# Install angr management to ~/.angr-management
# TODO: Make this configurable!

mkdir ~/.angr-management
cp -r python ~/.angr-management/python
~/.angr-management/python/install/bin/pip install ./wheels/*
cp uninstall.sh ~/.angr-management/

xattr -d com.apple.quarantine ~/.angr-management/python/install/bin/python

# TODO: Make a .app

echo "angr management sucessfully installed!"
