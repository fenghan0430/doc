**现象**：引导完ubuntu22.04桌面版安装盘后一直黑屏。

**原因**：引导盘无法启动显卡，导致一直黑屏

**解决方法**：在grub界面移动关表选中`install ubuntu`，按`e`打开编辑模式，找到`quite splash`然后去掉所有的`–`后，添加`nomodeset`。然后按`f10`引导。进入安装画面后发现是800*400，系统就凭感觉安装了。


<p>
  <img src="./pictrue/install_ubuntu_black/show.jpeg" width="400px">
</p>
