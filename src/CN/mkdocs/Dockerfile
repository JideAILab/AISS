FROM arm64v8/ubuntu:18.04
SHELL ["/bin/bash", "-c"]
WORKDIR /root
EXPOSE 8888

COPY ./doc ./docs
COPY ./Readme_CN.md ./docs/Readme_CN.md
COPY ./src/CN/mkdocs/mkdocs.yml ./mkdocs.yml

RUN echo -e "\
            deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic main restricted universe multiverse \n \
            deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-updates main restricted universe multiverse \n \
            deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-backports main restricted universe multiverse \n \
            deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-security main restricted universe multiverse \n \
        " > /etc/apt/sources.list &&\
    echo -e "\
            export LC_ALL=C.UTF-8\n \
            export LANG=C.UTF-8 \
            " > /root/usr_env.sh &&\
    apt-get update && apt-get install -y python3-pip python3&&\
    mkdir /root/.pip && touch /root/.pip/pip.conf &&\
    echo -e "[global]\n\
            index-url = http://mirrors.aliyun.com/pypi/simple/" &&\
    pip3 install --upgrade pip &&\
    pip3 install mkdocs

CMD source /root/usr_env.sh && \
    mkdocs serve -a 0.0.0.0:8888 -f ./mkdocs.yml