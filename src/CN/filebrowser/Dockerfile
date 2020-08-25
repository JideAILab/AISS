FROM arm64v8/ubuntu:18.04
WORKDIR /root
SHELL ["/bin/bash", "-c"]
COPY . /root
VOLUME /home
EXPOSE 8888

RUN echo -e "\
            deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic main restricted universe multiverse \n \
            deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-updates main restricted universe multiverse \n \
            deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-backports main restricted universe multiverse \n \
            deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-security main restricted universe multiverse \n \
        " > /etc/apt/sources.list &&\
    apt update && apt install -y wget && \
    wget https://github.com/filebrowser/filebrowser/releases/download/v2.6.2/linux-arm64-filebrowser.tar.gz &&\
    tar -xzf $(ls *arm64*filebrowser*tar.gz)

CMD ./filebrowser -c /root/config.json