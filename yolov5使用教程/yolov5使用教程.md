# yolov5使用教程

目录

1. 简介
2. 配置使用环境
   1. 配置虚拟环境
   2. 为gpu配置环境
3. 推理
4. 训练
5. 制作数据集
6. 训练自己的模型
7. 模型网络架构解析

### 简介

YOLOv5（You Only Look Once version 5）是一种高性能的实时目标检测算法，广泛应用于计算机视觉领域。它以其出色的速度和准确性而闻名，具有轻量级网络结构和卓越的性能。YOLOv5采用了多种改进，包括焦点检测、类别平衡、自适应训练等技术，使其在不同应用场景下都表现出色。该算法支持多种硬件平台，包括CPU和GPU，并可轻松集成到各种应用中，如自动驾驶、物体跟踪、安防监控等领域。YOLOv5的简单实现和卓越性能使其成为目标检测任务的首选算法之一，为实时视觉识别提供了强大的支持。

### 配置使用环境

在一切的开始，我们先要拿到yolov5的代码才可以配置环境。前往 *[https://github.com/ultralytics/yolov5](https://github.com/ultralytics/yolov5)* 下载最新的yolov5代码。点击网页中的`code`随后点击`Download ZIP`就可以下载原代码的压缩包。

然后，我们要安装yolov5依赖的`git`程序( *[https://git-scm.com/downloads](https://git-scm.com/downloads)* )

其次，访问Anaconda官方网站（ *[https://www.anaconda.com](https://www.anaconda.com)* ）下载适用于你操作系统的Anaconda3版本。选择合适的版本（通常是64位），并下载安装程序。

在安装完成后，打开`Anaconda Prompt`程序，输入下面的代码创建一个虚拟环境。

```bash
# 虚拟环境名称 yolo
# python版本3.8
conda create -n yolo python=3.8
```
用`cd`命令移动到yolov5的文件夹下面。

```bash
# 具体目录看具体情况
cd C:/User/admin/yolov5
```

用`pip`命令安装yolov5需要的依赖库。

```bash
pip install -r requirements.txt
```

最后，我们需要运行`train.py`，让yolov5下载一个简单的数据集`coco128`和一些依赖文件。

当出现`Start training for x epochs...`后就可以按`ctrl + c`终止程序。到此yolo的基本环境就配置完成了。

#### 为gpu配置环境

想要torch能调用gpu，需要安装支持cuda的版本。先安装cuda，前往nvidia的官网下载`cuda 11.8`( *[https://developer.nvidia.com/cuda-11-8-0-download-archive](https://developer.nvidia.com/cuda-11-8-0-download-archive)* )，然后双击安装包安装。安装完成后，通过这两个命令安装torch gpu版。

```bash
# 下载这两个文件
https://download.pytorch.org/whl/cu118/torch-2.0.1%2Bcu118-cp38-cp38-win_amd64.whl

https://download.pytorch.org/whl/cu118/torchvision-0.15.2%2Bcu118-cp38-cp38-win_amd64.whl

# 然后安装这两个包

pip install <这两个包名>
```

安装完成后就可调用GPU了