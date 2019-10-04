#!/bin/bash

echo "
# HOW TO RUN THIS SSHD Server
# To Build: docker build -t np43/sshd .
# To Run:   docker run -d -p 2222:22 --name server1 np43/sshd
# To Run:   docker run -d -p 4438:443 -p 2222:22 --name server1 np43/sshd
# To Run:   docker run -d -p 8088:80 -p 4438:443 -p 2222:22 --name server1 np43/sshd
# Connect:  docker exec -it server1 /bin/bash
# To get this info run: docker run --rm np43/sshd /getinfo.sh
"
