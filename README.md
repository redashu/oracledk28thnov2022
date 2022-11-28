# Training plan 

<img src="plan.png">

### app testing / deployment problems with bare-metal system in past 

<img src="bare.png">

### app conflict problem on same host os Platform 

<img src="appc.png">

### solving app conflict / isolation using Hypervisor 

<img src="hy.png">

### problem with VM 

<img src="vmprob.png">

### vm vs container 

<img src="crevsvm.png">

## Introduction to Docker 

<img src="docker.png">

### install docker in any Linux platform -- /bare-metal / vm / cloud vm 

### checking things on linux vm 

```
[root@docker-ce ~]# whoami
root
[root@docker-ce ~]# uname -r
5.10.147-133.644.amzn2.x86_64
[root@docker-ce ~]# docker 
-bash: docker: command not found
[root@docker-ce ~]# 

```

### link for docker ce installation 

[click_here](https://docs.docker.com/engine/install/)

### installing docker on linux using yum 

```
[root@ip-172-31-29-98 ~]# yum  install docker 
Failed to set locale, defaulting to C
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
Resolving Dependencies
--> Running transaction check
---> Package docker.x86_64 0:20.10.17-1.amzn2.0.1 will be installed
--> Processing Dependency: runc >= 1.0.0 for package: docker-20.10.17-1.amzn2.0.1.x86_64
--> Processing Dependency: libcgroup >= 0.40.rc1-5.15 for package: docker-20.10.17-1.amzn2.0.1.x86_64
--> Processing Dependency: containerd >= 1.3.2 for package: docker-20.10.17-1.amzn2.0.1.x86_64
--> Processing Dependency: pigz for package: docker-20.10.17-1.amzn2.0.1.x86_64
--> Running transaction check
---> Package containerd.x86_64 0:1.6.6-1.amzn2.0.2 will be installed
---> Package libcgroup.x86_64 0:0.41-21.amzn2 will be installed

```

### creating non root user accounts and giving docker access 

```
root@ip-172-31-29-98 ~]# for  i in  ashu anurag arpit asif dhruba mamta niladri prakash pranav prashanth rajeshwaran sameer     shijin sindhu vijaya 
> do
> useradd $i
> echo "Oracle@098#"  |  passwd $i --stdin 
> usermod -aG docker $i
> done 
```

### trying to docker server 

```
[ashu@docker-ce ~]$ whoami
ashu
[ashu@docker-ce ~]$ uname -r
5.10.147-133.644.amzn2.x86_64
[ashu@docker-ce ~]$ 
[ashu@docker-ce ~]$ docker version 
Client:
 Version:           20.10.17
 API version:       1.41
 Go version:        go1.18.6
 Git commit:        100c701
 Built:             Wed Sep 28 23:10:17 2022
 OS/Arch:           linux/amd64
 Context:           default
 Experimental:      true
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
[ashu@docker-ce ~]$ 


```

### lets start docker service 

```
[root@docker-ce ~]# systemctl start docker 
[root@docker-ce ~]# systemctl enable docker 
Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.
[root@docker-ce ~]# systemctl status  docker 
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2022-11-28 06:39:29 UTC; 9s ago
     Docs: https://docs.docker.com
 Main PID: 4011 (dockerd)
   CGroup: /system.slice/docker.service
           └─4011 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock --default-ulimit nofile=32768:6553...


```

### Docker client & docker server 

<img src="clis.png">

### understanding creating containers  using contaienr images 

<img src="c1.png">

## image operations 

### pull and check 

```
[ashu@docker-ce ~]$ docker  images
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
[ashu@docker-ce ~]$ docker pull mysql 
Using default tag: latest
latest: Pulling from library/mysql
0bb5c0c24818: Pull complete 
cbb3106fbb5a: Pull complete 
550536ae1d5e: Pull complete 
33f98928796e: Pull complete 
a341087cff11: Pull complete 
0e26ac5b33f6: Pull complete 
c883b83a7112: Pull complete 
873af5c876c6: Pull complete 
8fe8ebd061d5: Pull complete 
7ac2553cf6b4: Pull complete 
ad655e218e12: Pull complete 
Digest: sha256:96439dd0d8d085cd90c8001be2c9dde07b8a68b472bd20efcbe3df78cff66492
Status: Downloaded newer image for mysql:latest
docker.io/library/mysql:latest
[ashu@docker-ce ~]$ docker  images
REPOSITORY   TAG       IMAGE ID       CREATED       SIZE
mysql        latest    3842e9cdffd2   11 days ago   538MB
[ashu@docker-ce ~]$ 

```

### oracle linux image pull 

```
[ashu@docker-ce ~]$ docker pull oraclelinux:8.4 
8.4: Pulling from library/oraclelinux
a4df6f21af84: Pull complete 
Digest: sha256:b81d5b0638bb67030b207d28586d0e714a811cc612396dbe3410db406998b3ad
Status: Downloaded newer image for oraclelinux:8.4
docker.io/library/oraclelinux:8.4
[ashu@docker-ce ~]$ 
[ashu@docker-ce ~]$ 
[ashu@docker-ce ~]$ docker  images
REPOSITORY    TAG       IMAGE ID       CREATED         SIZE
mysql         latest    3842e9cdffd2   11 days ago     538MB
oraclelinux   8.4       97e22ab49eea   12 months ago   246MB
```

### downloading from quay 

```
[ashu@docker-ce ~]$ docker pull quay.io/cki/python
Using default tag: latest
latest: Pulling from cki/python
7a05f01240ab: Pull complete 
343808d3e526: Pull complete 
Digest: sha256:793e74eb1965a466d20aa787b916595ae8efac29be7f7ba740a05c4f1d1502d4
Status: Downloaded newer image for quay.io/cki/python:latest
quay.io/cki/python:latest
[ashu@docker-ce ~]$ docker  images
REPOSITORY           TAG       IMAGE ID       CREATED         SIZE
oraclelinux          9         0c19a2c2d02f   2 days ago      225MB
quay.io/cki/python   latest    02e3514dbff3   6 days ago      991MB
mongo                latest    2dd27bb6d3e6   11 days ago     695MB
mysql                latest    3842e9cdffd2   11 days ago     538MB
oraclelinux          8.4       97e22ab49eea   12 months ago   246MB
```

## Container management 

### creating container 

<img src="cc.png">

### creating container 

```
[ashu@docker-ce ~]$ docker  run  --name  ashuc1  -it -d  oraclelinux:8.4  sleep 1000 
e011394d291ef6e510b5274fe777c9dd77e4fce8ef1fcf5bf60a29513988cb5c
[ashu@docker-ce ~]$ docker  ps
CONTAINER ID   IMAGE             COMMAND        CREATED              STATUS              PORTS     NAMES
4d7c89f7d784   oraclelinux:8.4   "sleep 1000"   3 seconds ago        Up 2 seconds                  arpitc1
e011394d291e   oraclelinux:8.4   "sleep 1000"   14 seconds ago       Up 13 seconds                 ashuc1
a2fdf34ed22d   oraclelinux:8.4   "bash"         About a minute ago   Up About a minute             dhruba1
[ashu@docker-ce ~]$ 

```

### recreating it 

```
[ashu@docker-ce ~]$ docker images
REPOSITORY           TAG       IMAGE ID       CREATED         SIZE
quay.io/cki/python   latest    02e3514dbff3   6 days ago      991MB
fedora               latest    d1cd7f8c89a9   12 days ago     184MB
oraclelinux          8.4       97e22ab49eea   12 months ago   246MB
[ashu@docker-ce ~]$ 
[ashu@docker-ce ~]$ docker  ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
[ashu@docker-ce ~]$ 
[ashu@docker-ce ~]$ docker run --name ashuc1 -itd  oraclelinux:8.4  sleep 1000 
d3475adee03f7b055ea2da62593b029401eb453112d8709be706e4c79c5cbc16
[ashu@docker-ce ~]$ docker  ps
CONTAINER ID   IMAGE             COMMAND        CREATED          STATUS          PORTS     NAMES
19fe7498234a   oraclelinux:8.4   "sleep 1000"   3 seconds ago    Up 2 seconds              sindhu1
d3475adee03f   oraclelinux:8.4   "sleep 1000"   4 seconds ago    Up 3 seconds              ashuc1
7e68200f6bfc   oraclelinux:8.4   "sleep 1000"   18 seconds ago   Up 17 seconds             dhruba1
ccfc4692f882   oraclelinux:8.4   "sleep 1000"   29 seconds ago   Up 27 seconds             shijin
2235821361fa   oraclelinux:8.4   "sleep 100"    35 seconds ago   Up 33 seconds             vijaya
[ashu@docker-ce ~]$ 

```

### to list all the containers 

```
[ashu@docker-ce ~]$ docker ps -a
CONTAINER ID   IMAGE             COMMAND        CREATED              STATUS                          PORTS     NAMES
dfb500a60171   oraclelinux:8.4   "mycon"        21 seconds ago       Created                                   asif2
9452279d1b4f   oraclelinux:8.4   "sleep 1000"   50 seconds ago       Up 49 seconds                             prao1
50201182afc7   oraclelinux:8.4   "sleep 10"     51 seconds ago       Exited (0) 40 seconds ago                 dhruba1
db195dd42a58   oraclelinux:8.4   "sleep 100"    About a minute ago   Up About a minute                         niladri1
6fb42e55bf6a   oraclelinux:8.4   "sleep 1000"   About a minute ago   Up About a minute                         rajesh
d3ef610f93da   oraclelinux:8.4   "sleep 100"    About a minute ago   Exited (137) 21 seconds ago               prao
6c4becb87116   oraclelinux:8.4   "sleep 1000"   About a minute ago   Up About a minute                         arpitc2
16a0ea8dca2b   fedora:latest     "sleep 1000"   About a minute ago   Up About a minute                         pranav

```

### stop and start 

```
ashu@docker-ce ~]$ docker  stop  ashuc1 
ashuc1
===
[ashu@docker-ce ~]$ docker  start  ashuc1
ashuc1
[ashu@docke
```

### accessing container shell 

```
[ashu@docker-ce ~]$ docker  exec -it ashuc1  bash
[root@d3475adee03f /]# 
[root@d3475adee03f /]# 
[root@d3475adee03f /]# uname -r
5.10.147-133.644.amzn2.x86_64
[root@d3475adee03f /]# cat  /etc/os-release 
NAME="Oracle Linux Server"
VERSION="8.4"
ID="ol"
ID_LIKE="fedora"
VARIANT="Server"
VARIANT_ID="server"
VERSION_ID="8.4"
PLATFORM_ID="platform:el8"
PRETTY_NAME="Oracle Linux Server 8.4"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:oracle:linux:8:4:server"
HOME_URL="https://linux.oracle.com/"
BUG_REPORT_URL="https://bugzilla.oracle.com/"

ORACLE_BUGZILLA_PRODUCT="Oracle Linux 8"
ORACLE_BUGZILLA_PRODUCT_VERSION=8.4
ORACLE_SUPPORT_PRODUCT="Oracle Linux"
ORACLE_SUPPORT_PRODUCT_VERSION=8.4
[root@d3475adee03f /]# 
[root@d3475adee03f /]# ls /
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@d3475adee03f /]# 
[root@d3475adee03f /]# exit
exit
[ashu@docker-ce ~]$ 

```

### remove a running container 

```
[ashu@docker-ce ~]$ 
[ashu@docker-ce ~]$ docker stop ashuc1
ashuc1
[ashu@docker-ce ~]$ docker rm ashuc1 
ashuc1
[ashu@docker-ce ~]$ 
[ashu@docker-ce ~]$ docker start ashuc1
Error response from daemon: No such container: ashuc1
Error: failed to start containers: ashuc1
[ashu@docker-ce ~]$ 
[ashu@docker-ce ~]$ 

```

### contianer life cycle management 

<img src="lifec.png">



