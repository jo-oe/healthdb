#!/bin/sh

ip -4 -o addr | awk '!/^[0-9]*: ?lo|link\/ether/ {print $4}' | cut -d/ -f1
