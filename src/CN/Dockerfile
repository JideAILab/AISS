#中国大陆
FROM arm64v8/ubuntu:18.04
SHELL ["/bin/bash", "-c"]
WORKDIR /root

COPY ./bin /root
COPY ./huawei_samples /home
COPY ./doc /home/doc
COPY ./src/CN/vscode /root/vscode

VOLUME /home
EXPOSE 8888
EXPOSE 22
ENV DDKPATH $HOME/huawei/

RUN echo -e "\
            deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic main restricted universe multiverse \n \
            deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-updates main restricted universe multiverse \n \
            deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-backports main restricted universe multiverse \n \
            deb http://mirrors.ustc.edu.cn/ubuntu-ports/ bionic-security main restricted universe multiverse \n \
        " > /etc/apt/sources.list &&\
    apt-get update && apt-get install -y build-essential python3-pip python3 wget curl unzip &&\
    mkdir /root/.pip && touch /root/.pip/pip.conf &&\
    echo -e "[global]\n\
            index-url = http://mirrors.aliyun.com/pypi/simple/" &&\
    pip3 install --upgrade pip &&\
    pip3 install cython numpy decorator&&\
    wget https://cmake.org/files/v3.5/cmake-3.5.2.tar.gz &&\
    tar -zxvf cmake-3.5.2.tar.gz &&\
    cd cmake-3.5.2 && ./bootstrap --prefix=/usr && make && make install
RUN tar -zxvf $(ls Ascend_DDK*ubuntu18.04*) &&\
    mkdir $DDKPATH &&\
    python3 ddk_setup.py install $DDKPATH $(ls Ascend_lib*ubuntu18.04-aarch64*.zip) &&\
    echo -e "\
            export DDK_PATH=${DDKPATH}ddk \n \
            export DDK_HOME=${DDKPATH}ddk \n \
            export PYTHONPATH=$PYTHONPATH:$DDK_PATH/site-packages/te-0.4.0.egg:$DDK_PATH/site-packages/topi-0.4.0.egg \n \
            export LD_LIBRARY_PATH=$DDK_PATH/uihost/lib:$LD_LIBRARY_PATH \n \
            export PATH=$PATH:$DDK_PATH/toolchains/ccec-linux/bin:$DDK_PATH/uihost/bin \n \
            export TVM_AICPU_LIBRARY_PATH=$DDK_PATH/uihost/lib/:$DDK_PATH/uihost/toolchains/ccec-linux/aicpu_lib \n \
            export TVM_AICPU_INCLUDE_PATH=$DDK_PATH/include/inc/tensor_engine \n \
            export TVM_AICPU_OS_SYSROOT=$DDK_PATH/toolchains/aarch64-linux-gcc6.3/sysroot \n \
            export NPU_HOST_LIB=$DDK_PATH/host/lib \n \
            export NPU_DEV_LIB=$DDK_PATH/device/lib \n \
            cd /home \n \
            " >> $HOME/.bashrc
RUN curl -fOL https://github.com/cdr/code-server/releases/download/v3.4.1/code-server_3.4.1_arm64.deb && \
    dpkg -i $(ls code-server*.deb) &&\
    mkdir -p $HOME/.local/share/code-server && mkdir -p $HOME/.config/code-server &&\
    unzip /root/vscode/config.zip -d $HOME/.local/share/code-server &&\
    mv /root/vscode/config.yaml $HOME/.config/code-server/config.yaml
RUN apt-get update && apt-get install -y openssh-server &&\
    mkdir /var/run/sshd &&\
    passwd -d root &&\
    sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config &&\
    sed -i 's/nullok_secure/nullok/g' /etc/pam.d/common-auth &&\
    sed -i 's/#*PermitEmptyPasswords no/PermitEmptyPasswords yes/g' /etc/ssh/sshd_config &&\
    sed -i 's/#*PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
CMD service ssh start && code-server --bind-addr 0.0.0.0:8888 --auth none --disable-telemetry