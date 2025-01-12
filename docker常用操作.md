### 免sudo运行

```
sudo usermod -aG docker $USER
```

### vscode访问权限

```
sudo chmod 777 /var/run/docker.sock
```

### docker GPU总是时好时坏

加参数`--privileged`

```
docker run --gpus all --privileged ...
```

### docker 指定调用GPU

```
docker run --gpus all
docker run --gpus="'device=0'"
docker run --gpus="'device=0,1'"
```