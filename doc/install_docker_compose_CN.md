# Installation of docker-compose

官方文档见 [这里](https://docs.docker.com/compose/install/)。

### TL;DR

逐行运行以下命令以安装。

```bash
apt-get install libssl-dev libffi-dev python3 python3-pip
mkdir $HOME/.pip && touch $HOME/.pip/pip.conf
echo -e "\
[global]\n\
index-url = https://pypi.tuna.tsinghua.edu.cn/simple\
" >  $HOME/.pip/pip.conf 
sudo pip3 install --upgrade pip
sudo python3 -m pip install docker-compose
```