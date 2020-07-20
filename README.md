### 描述

一个简单的 web 服务器，默认占用 8000 端口，程序启动目录为静态资源的目录。

### 使用

```
wget https://github.com/smallyunet/a-sample-web-server/releases/download/v0.0.4/server.tgz
tar -zxvf server.tgz && cd server
bin/server
```

或者自行从 Releases 页面下载程序包，解压后运行。

### 参数

- `--help` 查看帮助
- `--port` 指定端口

### 原因

经常遇到本地有一个 html 文件，却无法正常查看的情况，因为网页应该运行在 web 服务器里，而无法使用浏览器从本地打开。这是一个简单的程序，直接启动就可以使用当前目录作为静态资源的根目录，运行一些网页或脚本。

