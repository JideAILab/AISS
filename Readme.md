# Atlas Inference Software Stack(AISS)

EN|[简中](Readme_CN.md)

## 开发单位

| Peng Cheng Laboratory  |  Beijing Jide OS Technology Co., Ltd. |
|---|---|
|<img src="https://dw.pcl.ac.cn/eco-mall/favicon.ico" width="70" height="70" /> |  <img src="https://i.loli.net/2020/08/27/rG7SsjcwBMKAENW.png"  height="70" />|

## Introduction

Atlas 300C Inference Software Stack(AISS) is a software stack specifically developed for [Peng Cheng laboratory](http://www.szpclab.com/) [cloud development platform](https://dw.pcl.ac.cn). It's based on Made-in-China ARM processor and Huawei Atlas 300 acceleration card. This application automatically installs all necessary softwares for convenient development of inference applications. Users can apply for pre-installed environment from [Peng Cheng laboratory](https://dw.pcl.ac.cn/#/soft/deepLearn). This is the open source repository of the software stack.

The full software stack has four main component:

| Component  |  Functionality | Description |
|---|---|---|
|WEBIDE  | An IDE inherited from Visual Studio Code  | Fully featured IDE inside browser tab |
|FileBrowser|File management|Download/Upload files |
|StatusMonitor| acceleration card |Live monitoring of NPU status |
|ttyd|web bash shell| bash shell in browser tab|

The full software stack can be seen in Figure 1.
![Structure.png](https://i.loli.net/2020/08/26/pd7tGNVqbfWMErO.png)

The software stack mainly provide a convenient way for Atlas 300 application developer. It supports both single machine and swarm deployment. Currently, it only support ARMv8 Arch64. On the physical machine, insert Atlas 300 acceleration card into the PCIE port. After installation of the driver you can check the status of Ascend 310 IC. 

## Project structure

This repository's directory structure:

* bin
* doc
* huawei_sample
* src
    * CN
    * default

bin: Put Ascend library package downloaded from [Huawei home page](https://support.huawei.com/enterprisesearch/ebgSearch#keyword=Ascend_DDK&lang=zh&outside=0&searchCount=1&searchType=searchAll&type=searchAll) here. There should be two packages here `Ascend_DDK-{software version}-{interface version}-<uihost arch.os>.tar.gz` and `Ascend_lib-{software version}-<host arch.os>-<device arch.os>.zip`.

doc directory contains some documents for using this software stack and some developer documents inherited for HuaWei.

huawei_sample contains the official sample code from [here](https://gitee.com/HuaweiAtlas/samples/tree/master).

src contains all configuration dockerfile etc.

## Installation

Cloning this repository and download `Ascend_DDK` and `Ascend_lib` from [here](https://support.huawei.com/enterprisesearch/ebgSearch#keyword=Ascend_DDK&lang=zh&outside=0&searchCount=1&searchType=searchAll&type=searchAll).

```bash
git clone <this-repo>
git submodule update --init --recursive
```

### Method 1: Single Machine Development 

First, make sure Ascend 310 NPU driver, docker and docker-compose is installed. Then install the software stack.

```bash
#default
cd src/default

ASCEND_CHIP_ID=$YOUR_ID PORT=$YOUR_PORT \
docker-compose up -d --no-deps --build

#mainland China
cd src/CN

ASCEND_CHIP_ID=$YOUR_ID PORT=$YOUR_PORT \
docker-compose up -d --no-deps --build
```

PS Based on your network and Hardware configuration, the build process may take up to 30 minutes to finish.

### Method 2: on Swarm

After installation of device driver, Docker and docker-compose, change docker engine to swarm mode.

```bash
docker swarm init --advertise-addr <your-ip>
```

Then deploy stack on swarm.

```bash
docker stack deploy --compose-file docker-compose.yml vossibility
```

## Hello World

Follow these steps to run the "hello world" sample.

```bash
cd /home/Samples/HelloDavinci/
chmod +x build.sh
./build.sh A300
./out/main > result
cat result
```

If `Hello Davinci!` is printed out, you successfully deployed this software stack.

## Runtime in pre-installed environment

* CPU：HiSilicon Kunpeng 920 ARMv8 Arch64
* OS：Ubuntu 18.04LTS
* docker：19.03.6
* Atlas 300c Runfile version：V100R001C32B070
* code-server version：1.45.1
* pre-installed tools：
    * g++ 7.5.0
    * cmake 3.5.2
    * python3 3.6.9
    * pip3 9.0.1
    * numpy 1.18.5
    * ddk 1.32.T7.B070，interface version：1.1.1

## Special Notes

This software stack is in early stages, more functionality and documents will be added soon.

## Special thanks

Special thanks to the following repository and their contributor.

* [filebrowser](https://github.com/filebrowser/filebrowser)
* [mkdocs](https://github.com/mkdocs/mkdocs)
* [ttyd](https://github.com/tsl0922/ttyd)
* [code-server](https://github.com/cdr/code-server)