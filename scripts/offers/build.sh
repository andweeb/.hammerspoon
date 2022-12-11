#!/usr/bin/env bash

uglifyjs --compress --mangle -- $1 | sed 's/\"/`/g' | sed 's/\\/\\\\/g' | pbcopy
