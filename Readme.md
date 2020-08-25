# HuaWei Atlas 300 development in the cloud


docker run -itd --privileged --device=/dev/davinci_manager --device=/dev/hisi_hdc \
--device=/dev/davinci0 -v /usr/local/HiAI/driver/lib64:/usr/local/HiAI/driver/lib64 \
arm64v8/ubuntu:18.04

docker cp /usr/local/sbin/npu-smi 6b02b02cacd9:/usr/local/sbin/npu-smi

docker exec -it 6b02b02cacd9 bash

## Special thanks
