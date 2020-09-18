#!/bin/bash
if ! [ -x "$(command -v docker)" ]; then
    echo "Docker not installed !!!"
    exit 1
else
    echo "Docker installed."
fi

if ! [ "$(systemctl is-active docker)" = "active" ]; then 
    echo "Docker daemon NOT allive!!! Run the following command. \n\
=====================================================\n
\t sudo systemctl start docker \n\n\
======================================================"
    exit 1
else
    echo "Docker daemon running."
fi

DIR="/usr/local/HiAI/driver/"
if ! [ -d "$DIR" ]; then 
    echo "Driver not installed. Follow the URL below.\n\
=============================================================================\n
\t https://support.huawei.com/enterprise/zh/doc/EDOC1100115618/b923a0a5 \n\n\
============================================================================="
    exit 1
else
    echo "Driver installed."
fi

exit 0