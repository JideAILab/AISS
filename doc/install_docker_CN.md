# Docker安装

官方文档见 [这里](https://docs.docker.com/get-docker/)。

## TL;DR

逐行运行以下命令以安装。

```bash
cp /etc/apt/sources.list /etc/apt/sources.list.bak
echo -e "\
        deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic main restricted universe multiverse \n \
        deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-updates main restricted universe multiverse \n \
        deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-backports main restricted universe multiverse \n \
        deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-security main restricted universe multiverse \n \
    " > /etc/apt/sources.list
sudo apt-get update
sudo apt install docker.io
sudo systemctl start docker
```

## 镜像加速

逐行运行以下命令以安装。

```bash
echo -e "\
{\n \
    "data-root": "/home/docker",\n \
    "registry-mirrors":[\n \
        "https://registry.docker-cn.com",\n \
        "http://hub-mirror.c.163.com",\n \
        "https://reg-mirror.qiniu.com"\n \
    ],\n \
}" > /etc/docker/daemon.json
sudo systemctl restart docker
```