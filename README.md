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
### jdk11.dockerfile 

```
FROM oraclelinux:8.4 
LABEL name=ashutoshh
LABEL email=ashutoshh@linux.com 
RUN yum install java-11-openjdk.x86_64 java-11-openjdk-devel.x86_64 -y 
RUN mkdir /javacode 
COPY ashu.java /javacode/
WORKDIR /javacode
RUN javac ashu.java
CMD ["java","ashu"]

```

### lets build it 

```
ashu@docker-ce ashu-images]$ docker images  |   grep ashu
ashujava             appv1     dda6a22b3b03   18 hours ago    467MB
[ashu@docker-ce ashu-images]$ 
[ashu@docker-ce ashu-images]$ ls
java-app  python-apps
[ashu@docker-ce ashu-images]$ cd  java-app/
[ashu@docker-ce java-app]$ ls
ashu.java  Dockerfile  jdk11.dockerfile
[ashu@docker-ce java-app]$ docker build  -t  ashujava:appv2  -f  jdk11.dockerfile   . 
Sending build context to Docker daemon  4.608kB
Step 1/9 : FROM oraclelinux:8.4
 ---> 97e22ab49eea
Step 2/9 : LABEL name=ashutoshh
 ---> Running in f894e3448061
Removing intermediate container f894e3448061
 ---> deaa4b459bc3
Step 3/9 : LABEL email=ashutoshh@linux.com
 ---> Running in d8240e3b567c
Removing intermediate container 
```

### lets verify 

```
shu@docker-ce java-app]$ 
[ashu@docker-ce java-app]$ docker images  |   grep ashu
ashujava             appv2     a2de1c0759d7   15 seconds ago       672MB
ashujava             appv1     dda6a22b3b03   18 hours ago         467MB
```

### creating container

```
[ashu@docker-ce java-app]$ docker run -itd --name ashujc2  ashujava:appv2 
7c19e70f647304d9736bf5f84e21cc9003d1ccf392ed710755f84b1f91f183d7

[ashu@docker-ce java-app]$ 
[ashu@docker-ce java-app]$ docker logs ashujc2
Hello World ,i am ashutoshh singh
Hello World ,i am ashutoshh singh
[ashu@docker-ce java-app]$ docker exec -it ashujc2 bash 
[root@7c19e70f6473 javacode]# java -version 
openjdk version "11.0.17" 2022-10-18 LTS
OpenJDK Runtime Environment (Red_Hat-11.0.17.0.8-2.el8_6) (build 11.0.17+8-LTS)
OpenJDK 64-Bit Server VM (Red_Hat-11.0.17.0.8-2.el8_6) (build 11.0.17+8-LTS, mixed mode, sharing)
[root@7c19e70f6473 javacode]# cat /etc/os-release 
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
[root@7c19e70f6473 javacode]# exit
exit
```


