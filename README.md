# Simple_printing
为了在学校更简单的使用linux进行打印，因此编写了这个脚本，可以尽可能的缩减需要输入的命令（虽然比这个好的解决方案很多）

# 安装
可以尝试将下面的内容逐行放进shell里运行

```$ wget https://raw.githubusercontent.com/hatsuyuki280/Simple_printing/master/print.sh && mv print.sh print```
```$ chmod +x print```

```$ mkdir ~/.local/bin && mv print ~/.local/bin/```

```$ cd ~```

```$ echo "export PATH=$(pwd)/bin:$(pwd)/.local/bin:\"\$\{PATH\}\"" >> ~/.bashrc```


然后现在你需要重新打开一个控制台窗口，测试一下命令：

```$ print [文件名]```

如果没有问题的话就会直接开始打印了

# 注意
现在的版本只支持同时输入一个文件
不保证任何人在任何设备上任何时间都能正常完成该操作，以上
