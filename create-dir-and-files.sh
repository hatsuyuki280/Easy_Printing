#!/bin/bash
## 作者　初雪七海
## 搬运自咱自己的gist。。。因为gist的东西不会同时显示在时间线上，所以专门抄到这里混个更新quq

mkdir $(date -d this-thursday +%m%d)    ##今週の木曜日の日付のフォルダーを作って
Lastfilename=$(ls $(date -d last-thursday +%m%d) | egrep -o '[0-9]*' | head -1 )    ##前回のファイル名の番号を参照して
type=java   ##ファイル拡張子を入力してください。
Studentnum=J*****       ##ここに学籍番号を入力してください。
Studentname=情報 花子    ##ここに氏名を入力してください。
for ((num=1; num<=7; num ++))   ##7つのファイルを作る
do
    File_name=Kadai$((Lastfilename+1))_$num
    ##以下内容をファイルに保存して、今の形はJavaです。
    cat >> ./$(date -d this-thursday +%m%d)/$File_name.$type <<OOO
/*
    プログラム名: $File_name.$type
    作成日: $(date -d this-thursday +%Y%m/%d)
    作成者: $Studentnum $Studentname
*/
public class $File_name {
    public static void main(String[] args) {
    }
}
OOO
done
