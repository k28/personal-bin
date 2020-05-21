#!/bin/sh
#
# 16進数表記のバイナリをダンプして表示します
#
# 使い方
# echo "12F0" | hexbin2dump
#

xxd -r -p | xxd

