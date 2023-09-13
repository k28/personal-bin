#!/bin/bash

#
# Vimをビルドする
# 
# [事前準備]
# 1. Vimのプロジェクトをcloneしておく
# 2. .vim_project_pathに上記のパスを記載する(スクリプトと同じパスに作成する)
#
# Sample:(.vim_project_path)
# /Users/k28/works/vim/
# 

# CloneしたVimのプロジェクトパス
nVimProjectInfoFile="$(dirname $0)/.vim_project_path"
if [[ ! -f $nVimProjectInfoFile ]]; then
    echo "${nVimProjectInfoFile} is not exist."
fi
nVimProjectDir=`cat ${nVimProjectInfoFile}`
# configureの引数
nConfigure="./configure --enable-multibyte --enable-perlinterp --disable-selinux --enable-rubyinterp=dynamic --enable-python3interp=dynamic --enable-luainterp=yes --enable-pythoninterp=dynamic"

# 終了ステータスを確認して、失敗していたらメッセージを表示して終了する
# 使用例
# check_status $? "error message."
check_status() {
    if [ $1 -ne 0 ]; then
        echo "$2"
        exit 1
    fi
}

echo "build vim start."
(cd $nVimProjectDir && git pull)
check_status $? "git pull failed."

(cd $nVimProjectDir && make clean)
check_status $? "make clean failed."

(cd $nVimProjectDir && ${nConfigure} )
check_status $? "configure failed."

(cd $nVimProjectDir && make )
check_status $? "make failed."

(cd $nVimProjectDir && sudo make install )
check_status $? "make install failed."


