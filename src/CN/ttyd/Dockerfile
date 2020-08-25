FROM arm64v8/ubuntu:18.04
SHELL ["/bin/bash", "-c"]
WORKDIR /root
EXPOSE 8888

RUN echo -e "\
             deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic main restricted universe multiverse \n \
             deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-updates main restricted universe multiverse \n \
             deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-backports main restricted universe multiverse \n \
             deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-security main restricted universe multiverse \n \
            " > /etc/apt/sources.list && \
    apt-get update && apt-get install -y build-essential cmake git libjson-c-dev libwebsockets-dev && \
    git clone https://github.com/tsl0922/ttyd.git && \
    cd ttyd && mkdir build && cd build && \
    cmake .. && make && make install

CMD ttyd --port 8888 --max-clients 1 ssh -o StrictHostKeyChecking=no root@codeserver