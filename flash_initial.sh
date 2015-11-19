#!/bin/bash

set -e

../npfng/luatool.py -f config.lua
../npfng/luatool.py -f wsled_config.lua
../npfng/luatool.py -f hsv_rainbow.lua
