#!/bin/bash

##開発者：初雪　七海
##GitHubにフォローしてね
##　https://github.com/hatsuyuki280

error()(
    echo "This Program Only supports one Filename at once, please check it."
    echo "このプログラムは一回に一つのファイル名しか使用されない！もう一度やり直してください。"
    echo "这个程序一次性只支持输入一个文件名，请检查出入的值"
)

test -z "$1" && {
    error
} || {
    test -z "$2" && {
        nkf -e $1 | mpage -1f | lpr
        echo "プリント終わるまで、少々お待ちください。"
    } || {
        error
    }
}
