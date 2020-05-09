#!/bin/bash

#
# (ほぼ)ランダムなパスワードを生成する
# 似た文字は含めない
# -lオプションで文字の長さを変更可能(デフォルト8)
#

# パスワードの長さ
nPasswordLength=8

# 使い方表示
show_usage() {
    echo "$0 -l {password length (default is 8)}"
}

# 引数チェック
while getopts l:h OPT
do
    case $OPT in
    "l" ) nPasswordLength="$OPTARG";;
    "h" ) show_usage;;
    * ) show_usage
        exit 1;;
    esac
done

cat /dev/urandom | strings | grep -o "[a-zA-Z0-9]" | grep -v "[oOql1I]" | head -n $nPasswordLength | paste -s -d '\0' -

