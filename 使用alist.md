# 使用alist搭建本地下载站  

目录

1. 下载和安装alist
2. 配置alist
3. Q&A

## 下载和安装alist

首先，到github的官网去下载alist。选择合适的版本下载解压下载的文件得到一个`alist`,为他添加可执行权限,这样alist最基本的配置就做好了

```sh
# 在这个地方下载alist
https://github.com/alist-org/alist/releases
# 解压下载的压缩包
tar -zxvf alist-xxxx.tar.gz
# 为alist添加可执行权限
chmod +x ./alist
```

## 配置alist

## Q&A

### 忘记管理员密码怎么办

通过命令重置管理员密码

```bash
# 随机密码
./alist admin random
# 指定密码
./alist admin set 密码
```