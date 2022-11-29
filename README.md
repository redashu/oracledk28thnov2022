# Training plan 

<img src="plan.png">

### Docker container of java analysis 

```
ashu@docker-ce ashu-images]$ docker images  |  grep ashu
ashujava             appv1     dda6a22b3b03   18 hours ago    467MB
[ashu@docker-ce ashu-images]$ docker run -itd --name ashujc1 dda6a22b3b03 
cf5dc8b1ef09623cb0f04c7f23d1030d2a8f4bbaa799e4bd09c2f62a42ed338c
[ashu@docker-ce ashu-images]$ docker ps
CONTAINER ID   IMAGE          COMMAND                    CREATED         STATUS        PORTS     NAMES
cf5dc8b1ef09   dda6a22b3b03   "/bin/sh -c {\"java\",…"   2 seconds ago   Up 1 second             ashujc1
[ashu@docker-ce ashu-images]$ docker logs ashujc1
Hello World, I am Rajeshwaran
Hello World, I am Rajeshwaran
Hello World, I am Rajeshwaran
Hello World, I am Rajeshwaran
[ashu@docker-ce ashu-images]$ docker exec -it ashujc1  bash 
bash-4.4# 
bash-4.4# java -version 
openjdk version "18.0.2.1" 2022-08-18
OpenJDK Runtime Environment (build 18.0.2.1+1-1)
OpenJDK 64-Bit Server VM (build 18.0.2.1+1-1, mixed mode, sharing)
bash-4.4# jps
1 ashu
50 Jps
bash-4.4# cat  /etc/os-release 
NAME="Oracle Linux Server"
VERSION="8.7"
ID="ol"
ID_LIKE="fedora"
VARIANT="Server"
VARIANT_ID="server"
VERSION_ID="8.7"
PLATFORM_ID="platform:el8"
PRETTY_NAME="Oracle Linux Server 8.7"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:oracle:linux:8:7:server"
HOME_URL="https://linux.oracle.com/"
BUG_REPORT_URL="https://bugzilla.oracle.com/"

ORACLE_BUGZILLA_PRODUCT="Oracle Linux 8"
ORACLE_BUGZILLA_PRODUCT_VERSION=8.7
ORACLE_SUPPORT_PRODUCT="Oracle Linux"
ORACLE_SUPPORT_PRODUCT_VERSION=8.7
bash-4.4# exit
exit
```

