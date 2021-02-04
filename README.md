### 描述

一个简单的 web 服务器，默认占用 20200 端口，程序启动目录为静态资源的目录。

### 使用

```
wget https://github.com/smallyunet/a-sample-web-server/releases/download/v0.0.6/server.tar.gz
tar -zxvf server.tar.gz
./server/bin/server
```

或者自行从 Releases 页面下载程序包，解压后运行。

### 参数

- `--help` 查看帮助
- `--port` 指定端口

### 示例

```
[test@test a-sample-server]$ ./server/bin/server -p 20201                                                                       
Your web application is running at http://10.10.144.99:20201/hello 
Your web application is running at http://127.0.0.1:20201/hello 
Your web application is running at http://192.168.122.1:20201/hello 
```

### 动机

- 本地有一个 html 文件，却无法正常查看，因为网页应该运行在 web 服务器里，以本地文件形式在浏览器打开会运行异常
- 有静态资源需要以网络链接的形式访问，却没有简易的方案

这是一个简单的服务器，直接启动就可以使用当前目录作为静态资源的根目录。

