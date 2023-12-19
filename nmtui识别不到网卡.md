**现象**：使用`ip addr`能看见网卡，但是使用`nmtui`无法看见网卡。

**原因**：网卡交给了netplan管理，没有交给NetworkManager管理。`nmtui`是用NetworkManager的，所以看不到。

**解决方法**：在netplan配置文件中加上`renderer: NetworkManager`,改成这样↓

```
network:
  renderer: NetworkManager
  ethernets:
    eno1:
      addresses:
      - 10.1.92.39/24
      nameservers:
        addresses:
        - 223.5.5.5
        search: []
      routes:
      - to: default
        via: 10.1.92.254
  version: 2
```