### 设置时区

ubuntu不会在安装系统的时候设置时区，通常时间是错误的。需要手动设置。

```bash
# 设置时区为上海
sudo timedatectl set-timezone Asia/Shanghai

# 确认设置和时间
timedatectl
```