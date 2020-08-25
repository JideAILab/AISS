# 开发者云上Atlas深度学习推理软件栈Atlas 300C Inference Stack(AIS)

## 功能简介

Atlas 300C Inference Stack(AIS)是构建在鹏城实验室开发者云（https://dw.pcl.ac.cn）上基于arm和atlas300c架构的深度学习推理软件栈。该软件栈提供完整的atlas 300c开发环境，用户可以通过Web Browser访问开发者云申请进行使用。本资源是AIS的完整代码，需搭配arm服务器和atlas 300c 计算加速卡使用。

软件栈包含以下几个组件/功能：
| 组件  |  功能 | 描述 |
|---|---|---|
|WEBIDE  | Visual Studio Code同界面开发环境  | 提供基于Web的集成开发环境|
|FileBrowser|文件管理|开发者可上传下载文件 |
|StatusMonitor|AI计算加速卡状态监控|开发者可以监控npu硬件状态 |
|ttyd|web bash shell|提供shell界面 |

整个软件栈的架构如图1。
![Structure.png](https://i.loli.net/2020/08/21/yjWp1n68NQZLxhc.png)

整个软件栈主要功能为自动安装ddk部署开发环境。支持单机与集群部署。支持在64位ARMv8主机上配置。Atlas300计算卡通过PCIE安装于主板上，正确安装驱动后可以使用npu-smi查看各个升腾310芯片的在线情况。在开发者软件栈测，所有的服务都在独立的容器中，相应容器通过Docker links连接。容器WEBIDE是主容器，拥有调用NPU的能力，华为升腾DDK也安装在此容器中。FileBrowser为方便高速上下传文件，可以提供批量上下传文件，上下穿文件夹等功能。ttyd为webshell，通过ssh连接至WEBIDE容器，从而获得升腾NPU运行时。Status Monitor通过映射入华为升腾卡驱动调用npu-smi用于监控计算卡状态。Doc Reader托管相应的文档。所有的web服务通过主页集成，使用Nginx反向代理，通过单一端口呈现于开发者。

## 项目结构：

本项目的文件结构如下所示：
* bin
* doc
* huawei_sample
* src
    * CN
    * default

bin中放置华为官网下载的ddk安装包。应包含Ascend_DDK- {software version}-{interface version}-<uihost arch.os> .tar.gz与Ascend_lib-{software version}-<host arch.os>-<device arch.os>.zip。从[这里](https://support.huawei.com/enterprisesearch/ebgSearch#keyword=Ascend_DDK&lang=zh&outside=0&searchCount=1&searchType=searchAll&type=searchAll)下载。

doc中包含配置后台配置相关文档，软件栈使用文档与Atlas开发文档（华为原作）。

huawei_sample中存放华为官网示例代码，[来源](https://gitee.com/HuaweiAtlas/samples/tree/master)。

src中为dockerfile等软件栈源文件。src/default中为默认的dockerfile源文件，src/CN中的源文件针对中国大陆的网络环境进行了特定配置。

## 部署方法

克隆本仓库。

```bash
git clone <this-repo>
git submodule update --init --recursive
```

### 方法一：docker compose

首先，保证系统上已安装Atlas 300 NPU驱动、docker、docker-compose。


之后进入相应路径进行软件栈的部署。

```bash
#default
cd src/default
docker-compose up -d --no-deps --build

#中国大陆
cd src/CN
docker-compose up -d --no-deps --build
```

### 方法二：Docker Swarm
首先，保证Docker Engine在Swarm形式中运行。

```bash
docker swarm init --advertise-addr <your-ip>
```

之后在Swarm上Deploy软件栈：

```bash
docker stack deploy --compose-file docker-compose.yml vossibility
```

## 用例使用

Visual Studio Code 的使用方法请参见[这里](https://jeasonstudio.gitbooks.io/vscode-cn-doc/)。

以下以执行示例代码中的HelloDavinci项目为例。
```bash
cd /home/Samples/HelloDavinci/
chmod +x build.sh
./build.sh A300
./out/main > result
cat result
```
如果正常看到`Hello Davinci!`则正确配置。

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
    * pip3 9.0.1
    * numpy 1.18.5
    * ddk 1.32.T7.B070，接口版本：1.1.1

## 致谢

特别感谢以下仓库。无先后顺序。

* [filebrowser](https://github.com/filebrowser/filebrowser)
* [mkdocs](https://github.com/mkdocs/mkdocs)
* [ttyd](https://github.com/tsl0922/ttyd)
* [code-server](https://github.com/cdr/code-server)