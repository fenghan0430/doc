vGPU第三方授权服务器的项目在`https://gitea.publichub.eu/oscar.krause/fastapi-dls`

他的docker版本在`https://hub.docker.com/r/collinwebdesigns/fastapi-dls`

这个验证服务器的验证方式是,首先需要**自封一个证书**,使用`-v`命令挂载到容器中

然后需要一个存储卷(`docker volume`)用来存放验证信息.

问为什么需要验证信息?因为这个项目不是你下个证书回去就完事了的.

在创建容器的时候，需要指定环境变量ip和端口`-e DLS_URL=<机器IP> -e DLS_PORT=<开放端口>`

为客户端下发下去的证书会存储这些东西,让后客户端会连接服务器端进行验证.

如果IP和端口有错,那么客户端会陷入验证死循环

完整的命令启动命令是这样的:

`docker run -d -e DLS_URL=IP -e DLS_PORT=端口 -p 端口:443 -v 自封证书地址:/app/cert -v 存储卷地址:/app/database collinwebdesigns/fastapi-dls:latest`

另外还有不需要自封证书的版本`makedie/fastapi-dls`,但是还是需要指定ip和端口

> 作者：忆海心阶 https://www.bilibili.com/read/cv23075952

`docker run -d -e DLS_URL=IP -e DLS_PORT=端口 -p 端口:443  makedie/fastapi-dls:latest`