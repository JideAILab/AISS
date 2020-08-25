FROM arm64v8/ubuntu:18.04
WORKDIR /root
SHELL ["/bin/bash", "-c"]
COPY . /root
VOLUME /home
EXPOSE 8888

RUN apt update && apt install -y wget && \
    wget https://github.com/filebrowser/filebrowser/releases/download/v2.6.2/linux-arm64-filebrowser.tar.gz &&\
    tar -xzf $(ls *arm64*filebrowser*tar.gz)

CMD ./filebrowser -c /root/config.json