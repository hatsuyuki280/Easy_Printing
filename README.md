&nbsp; &nbsp; [Easy_Printing](#1)  
&nbsp; &nbsp; &nbsp; &nbsp;[安装](#1.1)  
&nbsp; &nbsp; &nbsp; &nbsp;[使用](#1.2)  
&nbsp; &nbsp;  [create-dir-and-files](#2)  
&nbsp; &nbsp; [ 1.3用户退出](#3)  
<h3 id='1'>Easy_Printing</h3>
为了能在学校更简单的使用学校的linux设备（跑的是一个叫做 vine Linux 的系统）进行打印，因此编写了这个脚本，可以尽可能的缩减需要输入的命令（虽然比这个好的解决方案很多）  
以后有机会应该会顺便改一个支持批量打印的版本出来（学校的辣鸡打印服务器设置了冷却时间。。。连续打印会吞文件。。。）
<h3 id='1.1'>安装</h3>
可以尝试将下面的内容逐行放进shell里运行

``` ## 下载
wget https://raw.githubusercontent.com/hatsuyuki280/Easy_Printing/master/easyprint.sh && mv easyprint.sh easyprint  
## 授予运行权限  
chmod +x easyprint  
## 创建用户目录下的bin目录  
mkdir ~/.local/bin && mv easyprint ~/.local/bin/  
## 进入用户目录  
cd ~  
## 将用户文件夹下的bin设置进环境变量中  
echo "export PATH=$(pwd)/bin:$(pwd)/.local/bin:'${PATH}'" >> ~/.bashrc  

```

<h3 id='1.2'>使用</h3>
第一次使用请重新打开一个控制台窗口，测试一下命令：

``` $ easyprint [文件名] ```

如果没有问题的话就会直接开始打印了，切记在尝试打印正常之前不要关闭之前的控制台，否则可能会导致无法恢复的错误（//比如错误的把bashrc文件的PATH改错掉什么的）
<h3 id='2'>create-dir-and-files</h3>
自动创建本周要用的文件们。目前来说，只支持在前一周的基础上进行文件创建，否则将无法获取正确的文件名，而且只有java文件的样板，其他文件大概以后会加进去？前提是以后还用得到的话quq
<h3 id='3'>-1、用户退出</h3>









# 注意
现在的版本只支持同时输入一个文件
不保证任何人在任何设备上任何时间都能正常完成该操作，以上
