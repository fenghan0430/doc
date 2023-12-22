# 快速设置ubuntu设置时间

> 系统: ubuntu-22.04-server

```bash
# 查看本地时间
date

# 查看所有时区
timedatectl list-timezones

# 设置时区
sudo timedatectl set-timezone Asia/Shanghai

# 开启ntp功能
sudo timedatectl set-ntp true

# 从ntp服务器同步时间
sudo ntpdate ntp.aliyun.com

# 检查时间正确后，把时间信息保存到硬件(保证重启后时间正确)
sudo hwclock -w
```

### 解释

`date`命令是查看本地时间的命令，当然还有其他多种用法。

`timedatectl`是专门用来设置时区和修改时间的工具。

`ntpdate`是用来同步时间，`ntp.aliyun.com`是阿里云提供的ntp服务器。

`hwclock`是用来同步硬件时间。只有修改了硬件时间，才能保证重启生效。