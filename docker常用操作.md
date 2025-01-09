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