# 开发者云-深度学习软件栈-使用指南-Atlas300c

## 运行环境

* CPU硬件：HiSilicon Kunpeng 920 ARMv8 Arch64
* 操作系统：Ubuntu 18.04LTS
* docker：19.03.6
* Atlas 300c Run版本：V100R001C32B070
* code-server版本：1.45.1
* 已安装开发工具：
    * g++ 7.5.0
    * cmake 3.5.2
    * python3 3.6.9
    * git 2.17.1
    * pip3 9.0.1
    * numpy 1.18.5
    * ddk 1.32.T7.B070，接口版本：1.1.1

注：为用户使用方便，apt（中科院镜像）与pip（清华镜像）的源全部已更换为国内镜像。

## vscode教程

详情请参见[这里](https://jeasonstudio.gitbooks.io/vscode-cn-doc/)。

## 示例程序的编译与运行

此指南位于`/root/guide.md`。

Atlas 300C示例程序位于位于`/root/samples/`。以下将编译运行`HelloDavinci`作为示例。

点击左上角应用程序菜单-->文件-->打开文件夹。打开`/samples/Samples/HelloDavinci/`。
等待重新加载后，可查看`HelloDavinci`的代码并作出相应的修改。

点击左上角应用程序菜单-->终端-->新终端。

进入bash终端后运行以下，以配置编译运行环境。
```bash
source /.cshrc_usr
```

注：在bash中，复制粘贴请使用`ctrl+insert`与`shift+insert`。

之后开始编译运行示例程序，逐步运行以下：即可看到结果。

```bash
chmod 777 build.sh
./build.sh A300
./out/main > result
```

输出位于`result`文件。

## 技术支持

如在使用中有任何问题请联系：
dwadm@pcl.ac.cn