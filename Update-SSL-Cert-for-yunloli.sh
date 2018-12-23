## 作者 初雪 七海(hatsuyuki280)
## 本文件的 Github 位置 github.com/hatsuyuki280/Yuki-tools/Update-SSL-Cert-for-yunloli.sh

## 目前仅支持对云上萝莉(http://yunloli.com/)香港DA虚拟主机进行SSL部署
## 暂不支持使用Certbot自动申请并完成认证，暂不支持识别证书目录，因此请先
## 将工作目录切换到 包含有 privkey.pem 和 fullchain.pem 文件的目录再进行操作
## 请在使用前确认以下内容填写正确以及证书文件存在！

## 设置 用户名 密码 站点域名
Username=''
Password=''
Domain=''

## python 的url处理模块
url_quote(){
     python3 -c 'import urllib.parse, sys; print(urllib.parse.quote_plus(sys.stdin.read()))'
}
##

## 模拟登陆 获取cookie
curl 'http://hkda.yunloli.com:2222/CMD_LOGIN' -c '.cookie.tmp' -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0' -H 'Origin: http://hkda.yunloli.com:2222' -H 'Upgrade-Insecure-Requests: 1' -H 'Content-Type: application/x-www-form-urlencoded' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'Referer: http://hkda.yunloli.com:2222/' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-CN,zh;q=0.9,ja;q=0.8,en;q=0.7' -H 'x-hd-token: rent-your-own-vps' --data "referer=%2F&LOGOUT_URL=%2F&username=$Username&password=$Password" --compressed
## 读入cookie
Cookie=$( sed 's/\t/\n/g' .cookie.tmp | grep session -A 1 | tail -1 )
## 读入 私钥
Key=$( cat privkey.pem | url_quote | sed 's/$/\%0A/g' | tr -d '\n' )
## 读入 证书
Cert=$( cat fullchain.pem | url_quote | sed 's/$/\%0A/g' | tr -d '\n' | sed 's/-----%0A-----/-----%0A%0A-----/g' )
## post 数据
curl 'http://hkda.yunloli.com:2222/CMD_SSL?json=yes' -H 'Origin: http://hkda.yunloli.com:2222' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-CN,zh;q=0.9,ja;q=0.8,en;q=0.7' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: application/json' -H 'Referer: http://hkda.yunloli.com:2222/user/ssl/paste' -H "Cookie: session=$Cookie" -H 'x-hd-token: rent-your-own-vps' -H 'Connection: keep-alive' --data "domain=$Domain&json=yes&action=save&type=paste&certificate=$Key$Cert" --compressed
