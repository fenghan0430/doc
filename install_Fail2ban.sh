#!/bin/bash

# 确保脚本以root权限运行
if [ "$EUID" -ne 0 ]; then
  echo "请以root权限运行此脚本。"
  exit 1
fi

# 更新软件包列表
echo "更新软件包列表..."
apt update -y

# 安装Fail2ban
echo "安装Fail2ban..."
apt install -y fail2ban

# 备份原始配置文件
echo "备份原始配置文件..."
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.conf.bak

# 配置Fail2ban使用自定义配置
echo "配置Fail2ban使用自定义配置文件..."

cat > /etc/fail2ban/jail.local <<EOL
#DEFAULT-START
[DEFAULT]
bantime = 600
findtime = 300
maxretry = 5
banaction = ufw
action = %(action_mwl)s
#DEFAULT-END

[sshd]
ignoreip = 127.0.0.1/8
enabled = true
filter = sshd
port = 22
maxretry = 5
findtime = 300
bantime = 600
banaction = iptables-allports
action = %(action_mwl)s
logpath = /var/log/auth.log
EOL

# 重启并启用Fail2ban服务
echo "重启并启用Fail2ban服务..."
systemctl restart fail2ban
systemctl enable fail2ban

# 检查Fail2ban状态
echo "检查Fail2ban服务状态..."
systemctl status fail2ban --no-pager

echo "Fail2ban安装和配置完成！"
