# rocky9挂载硬盘

### 查看硬盘

```bash
# 这个命令可以看到硬盘
fdisk -l

# 看挂载情况
df -h

# 分区工具
fdisk /dev/硬盘
# m 帮助
# g 新建一个GPT分区表
# n 创建分区
# w 保存退出

# 看分区
lsblk

# 格式化
mkfs.xfs /dev/分区 # 格式化成xfs
mkfs.ext4 /dev/分区 # 格式化成ext4

# 挂载
mkdir /data           # 创建一个目录来挂载
mount /dev/分区 /data # 临时挂载到 /data

# 永久挂载
vim /etc/fstab
"""
修改/etc/fstab文件，在最后加入：/dev/sdb1 /mnt ext3 defaults 1 2 (格式说明：/dev/sdb1 代表哪个分区， /mnt是挂载目录， ext3是该分区的格式，defaults 是挂载时所要设定的参数(只读，读写，启用quota等)，输入defaults包括的参数有(rw、dev、exec、auto、nouser、async) ，1是使用dump是否要记录，0是不要。 2是开机时检查的顺序，是boot系统文件就为1，其他文件系统都为2，如不要检查就为0)
"""

```