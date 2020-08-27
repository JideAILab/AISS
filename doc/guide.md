# AISS simple user guide

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

## Hello World

This guide is at `/home/doc/guide.md`.

Atlas 300 sample is at `/home/samples/`. We uses `HelloDavinci` as an example.

All environment variable related to Ascend 310 chip inference is in `$HOME/.bashrc`.

Copy and past in terminal is `ctrl+insert` and `shift+insert`.

Follow these steps to run the "hello world" sample.

```bash
cd /home/Samples/HelloDavinci/
chmod +x build.sh
./build.sh A300
./out/main > result
cat result
```

If `Hello Davinci!` is printed out, you successfully deployed this software stack.

## Technical support

If you need any help with your development, please contact.
dwadm@pcl.ac.cn