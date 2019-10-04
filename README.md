# debian9_docker_sshd
Debian9 docker image with sshd

Simple Debian9 docker images with SSH access

# HOW TO RUN THIS SSHD Server
# To Build: docker build -t np43/sshd .
# To Run:   docker run -d -p 2222:22 --name server1 np43/sshd
# To Run:   docker run -d -p 4438:443 -p 2222:22 --name server1 np43/sshd
# To Run:   docker run -d -p 8088:80 -p 4438:443 -p 2222:22 --name server1 np43/sshd
# Connect:  docker exec -it server1 /bin/bash
# To get this info run: docker run --rm np43/sshd /getinfo.sh


## Usage

To create the image `debian9_docker_sshd` with latest Debian release, 
execute the following commands on the debian9_docker_sshd folder:

    git clone https://github.com/np43/docker-sshd.git np43-sshd && cd np43-sshd
    docker build -t np43/sshd . 

## Running debian9-ssh

To run a container from the image binding it to port 2333 in all interfaces, execute:

	docker run -d -p 2222:22 np43/sshd

The first time that you run your container, a random password will be generated
for user `root`. To get the password, check the logs of the container by running:

	docker logs <CONTAINER_ID>

You will see an output like the following:

	========================================================================
	You can now connect to this debian9 container via SSH using:

	    ssh -p <port> root@<host>
	    ssh -p 2222 root@localhost
	and enter the root password 'qJixrU8ToNxe4xRg' when prompted

	Please remember to change the above password as soon as possible!
	========================================================================

In this case, `qJixrU8ToNxe4xRg` is the password allocated to the `root` user.

Done!


## Setting a specific password for the root account

If you want to use a preset password instead of a random generated one, you can
set the environment variable `ROOT_PASS` to your specific password when running the container:

	docker run -d -p 2222:22 -e ROOT_PASS="rootpasswd" np43/sshd

