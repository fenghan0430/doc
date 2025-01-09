```bash
# 连接到数据库
mysql -u 用户名 -p
# 在随后弹出的地方输入密码

### 包围圈 ###
# 包围圈里的操作需要root操作(或有所有权限的)
# 而且几乎每做一步就要刷新
# 刷新命令↓
FLUSH PRIVILEGES;

# 创建用户
# - 登录主机填'%'就是
# - 可以从任意主机登录
create user '用户名'@'登录主机' identified by '密码';
# 删除用户
drop user '用户名'@'登录主机';
# 用户重命名
rename user '原用户名'@'原登录主机' to '新用户名'@'新登录主机';
# 修改用户密码
alter user '用户名'@'登录主机' identified by '新密码';

# 查询用户
# - mysql把用户信息录在'user'这张表里
# - 这就是普通的查表命令而已QwQ
select user,host from mysql.user;
# 查看当前用户
# - user()是个函数
select user();

# 查看用户权限
show grants for '用户名'@'登录主机';
# 添加权限
# - 具体权限就是看这个用户会在哪个哪个表调用那些命令,如果有就把命令加上
# - 权限
# - Select, Insert, Update, Delete, Create, Drop, Reload, Shutdown, 
# - Process, File, Grant, References, Index, Alter, all
grant 具体权限 on 数据库.表 to '用户名'@'登录主机';
# - 示例: 让root获得所有数据库所有表的所有操作权限
grant all on *.* to 'root'@'%';

# 包围圈结束
#############

# 创建数据库
create database 数据库名;
# 删除数据库
drop database 数据库名;

# 选择数据库
```