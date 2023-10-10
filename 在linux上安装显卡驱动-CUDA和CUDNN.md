# 在linux上安装显卡驱动-CUDA和CUDNN

相较于windwos平台，linux平台训练ai更受欢迎。linux通常比windows平台的稳定性更好，而且linux平台能调用更多的资源。并且，tensorflow 2.10以后的版本就不再支持windows平台了。有些时候我们不得不用linux进行训练，所以，这篇文章会帮助你在linux安装最基础的显卡驱动，CUDA和CUDNN。

> linux版本：`ubuntu-server 22.04` (ubuntu平台有更快捷的安装方式，但是这篇文章不介绍，你可以在我的其他文章里找到)  
> gpu：`NVIDIA 特斯拉T4`

### 安装显卡驱动

首先从安装显卡驱动开始，在安装显卡驱动前，需要先安装gcc等依赖和禁用linux自带的驱动`nouveau`。

```bash
# 安装依赖
sudo apt install g++ gcc make
# 打开驱动黑名单
sudo vim /etc/modprobe.d/blacklist.conf
# 向文件里添加这两段
blacklist nouveau
options nouveau modeset=0
# 更新内核
sudo update-initramfs -u
# 重启
sudo reboot
# 重启完成后若该↓命令没有任何输出
# 代表禁用成功
lsmod | grep nouveau
```

随后，要先去nvidia官网下载适用于你显卡的驱动文件。nvidia驱动下载地址 ( *[https://www.nvidia.cn/Download/index.aspx?lang=cn](https://www.nvidia.cn/Download/index.aspx?lang=cn)* )  
把下载的驱动上传到linux后，先为驱动添加执行权限，随后用root执行安装文件。

![下载驱动页面的图片]()

```sh
# 请修改驱动名为自己的驱动名
# 添加运行权限
chmod +x NV*.run
# 执行
sudo ./NV*.run
```

在启动安装文件后，会有界面引导你安装。

![带“警告的一般不用理会”]()

![选择不安装32位库]()

![如果它想自动配置x，一定要拒绝]()

在程序成功执行成功后，你可以用`nvidia-smi`命令检查驱动有没有正常安装。到此安装显卡驱动就结束了。

### 安装CUDA

这里以安装cuda 11.8为例，到cuda的官网下载cuda ( *[https://developer.nvidia.com/cuda-toolkit-archive](https://developer.nvidia.com/cuda-toolkit-archive)* )  
找到cuda 11.8，点进去选择系统、架构、发行版、版本、然后点击带有`runfile (local)`按钮。接着就会下面出现两行代码，把它复制到linux系统中执行。  
在cuda安装的过程中，也有简单的引导界面。有一些选项要更改。

```sh
# 第一行是下载CUDA安装文件
# 如果linux无法下载，可以了去掉 wget 
# 把链接复制到浏览器中，让windwos把
# 文件下载下来，随后再上传到linux
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda_11.8.0_520.61.05_linux.run
# 第二行是安装
sudo sh cuda_11.8.0_520.61.05_linux.run
```

![cuda选择页面的截图]()

![cuda同意许可协议]()

![cuda选择安装组件]()

![安装完成截图]()

等待cuda程序运行完成后，还需要为cuda配置环境变量才可以使用cuda。

```bash
# 打开环境变量文件
vim ~/.bashrc
# 在最底下加入这两行
# 请注意添加实际的路径
export PATH=/usr/local/cuda-11.8/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.8/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
```

最后用`nvcc -V`测试cuda的环境变量是否配好就行了。到此安装cuda的教程结束。
