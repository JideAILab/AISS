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
    apt-get update && apt-get install -y build-essential cmake git libtool m4 automake libjson-c-dev libssl-dev zlib1g-dev&& \
    git clone --single-branch --branch v1.x https://github.com/libuv/libuv && export UV_RUN_AS_ROOT=1 &&\
    cd libuv && mkdir -p build && cd build && cmake .. -DBUILD_TESTING=ON && cd .. && cmake --build build --target install &&\
    cd $home && git clone --single-branch --branch v4.0-stable https://libwebsockets.org/repo/libwebsockets&& \
    cd libwebsockets && mkdir build && cd build && cmake .. -DLWS_WITH_LIBUV=ON && make && make install && ldconfig &&\
    cd /root && git clone https://github.com/tsl0922/ttyd.git && \
    cd ttyd && mkdir build && cd build && \
    cmake .. && make && make install

# CMD ttyd --port 8888 bash
CMD ttyd --port 8888 ssh -o StrictHostKeyChecking=no root@codeserver