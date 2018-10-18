# 使用 TBS 调试微信公众号

### 原料准备

+ Android 手机一台
+ windows 电脑一台
+ [TBS 安装包](https://x5.tencent.com/tbs/guide/debug/download.html)

### 调试过程

1. 手机打开开发者模式并且开启 USB 调试
1. PC 机下载并安装 TBS studio 安装完成后打开 TBS studio
1. 使用数据线连接手机和 PC 机，点击启动检测，根据提示安装内核，打开调试开关
1. 打开手机微信，在聊天框输入 debugmm.qq.com/?forcex5=true 强制开启 x5 内核
1. 打开 http://debugtbs.qq.com 调试页面设置调试信息，通常打开 vConsole 调试功能和 TBS 内核 Inspector 调试功能
1. 点击 PC 端「启动调试」按钮
1. 手机打开需要调试的页面，PC 会对应显示，并且会展示类似 chrome 的开发者工具界面