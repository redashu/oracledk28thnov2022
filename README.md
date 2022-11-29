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

### java code dockerifle view 

<img src="jcode.png">

## More app to containerize 

### webapps examples 

<img src="webapp1.png">

### Understanding about webapp servers

<img src="webapps.png">

### nginx webapp with sample frontend app hosting 

<img src="apph.png">

### demo 

```
[ashu@docker-ce ashu-images]$ git clone https://github.com/schoolofdevops/html-sample-app.git
Cloning into 'html-sample-app'...
remote: Enumerating objects: 74, done.
remote: Total 74 (delta 0), reused 0 (delta 0), pack-reused 74
Receiving objects: 100% (74/74), 1.38 MiB | 23.56 MiB/s, done.
Resolving deltas: 100% (5/5), done.
[ashu@docker-ce ashu-images]$ ls
html-sample-app  java-app  python-apps
[ashu@docker-ce ashu-images]$ 

```

### Dockerfile -- using nginx server 

```
FROM nginx 
# taking nginx image from docker hub
LABEL name=ashutoshh
COPY . /usr/share/nginx/html/
# copy all the data from dockerfile location to nginx default app location 
# Note: if we don't use CMD then -- base image CMD will be inherited 
```


### .dockerignroe to ingore copy 

```
.dockerignore
Dockerfile
*.txt
.git 
```

### lets build it 

```

[ashu@docker-ce ashu-images]$ ls
html-sample-app  java-app  python-apps
[ashu@docker-ce ashu-images]$ docker  build -t ashunginx:1.0  html-sample-app/ 
Sending build context to Docker daemon  2.099MB
Step 1/3 : FROM nginx
latest: Pulling from library/nginx
a603fa5e3b41: Pull complete 
c39e1cda007e: Pull complete 
90cfefba34d7: Pull complete 
a38226fb7aba: Pull complete 
62583498bae6: Pull complete 
9802a2cfdb8d: Pull complete 
Digest: sha256:e209ac2f37c70c1e0e9873a5f7231e91dcd83fdf1178d8ed36c2ec09974210ba
Status: Downloaded newer image for nginx:latest
 ---> 88736fe82739
Step 2/3 : LABEL name=ashutoshh
 ---> Running in 436268d1a661
Removing intermediate container 436268d1a661
 ---> e74764e06fab
Step 3/3 : COPY . /usr/share/nginx/html/
 ---> 7eb69787a3a5
Successfully built 7eb69787a3a5
Successfully tagged ashunginx:1.0
[ashu@docker-ce ashu-images]$ docker images  |  grep ashu
ashunginx            1.0         7eb69787a3a5   9 seconds ago       144MB
ashujava             appv3       1357fe309c38   53 minutes ago      672MB
ashu.java            appDay2     d516a815c2fe   About an hour ago   672MB
ashujava             appDay2     d516a815c2fe   About an hour ago   672MB
ashujava             appv2       a2de1c0759d7   About an hour ago   672MB
ashujava             appv1       dda6a22b3b03   20 hours ago        467MB
```


# Introduction to container networking 

### COntainer networking model 

<img src="cnet.png">

### container networking concept 

<img src="dhcp.png">

### networking topology 

<img src="topo.png">

### checking netwoking 

```
[ashu@docker-ce ashu-images]$ docker  network  ls
NETWORK ID     NAME      DRIVER    SCOPE
f8a045b93718   bridge    bridge    local
f10217e9c633   host      host      local
ab71c0c8f387   none      null      local
[ashu@docker-ce ashu-images]$ docker  network  inspect  f8a045b93718
[
    {
        "Name": "bridge",
        "Id": "f8a045b9371844b6884272481533c781344a6c8c78a6d955a507286338a3b109",
        "Created": "2022-11-29T03:55:13.082439023Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
```

### checking container networking details 

```
[ashu@docker-ce ashu-images]$ docker images |  grep ashu
ashunginx            1.0         7eb69787a3a5   22 minutes ago      144MB
ashujava             appv3       1357fe309c38   About an hour ago   672MB
ashu.java            appDay2     d516a815c2fe   About an hour ago   672MB
ashujava             appDay2     d516a815c2fe   About an hour ago   672MB
ashujava             appv2       a2de1c0759d7   2 hours ago         672MB
ashujava             appv1       dda6a22b3b03   20 hours ago        467MB
[ashu@docker-ce ashu-images]$ docker run -d --name ashungc1 ashunginx:1.0 
2181c1ea80417897b162213d516e57bd9376f9c3a00ffcb000033dd81bf23fed
[ashu@docker-ce ashu-images]$ docker  network  ls
NETWORK ID     NAME      DRIVER    SCOPE
f8a045b93718   bridge    bridge    local
f10217e9c633   host      host      local
ab71c0c8f387   none      null      local
[ashu@docker-ce ashu-images]$ docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS     NAMES
a2c220c14f4a   asifnginx:1.0   "/docker-entrypoint.…"   43 seconds ago   Up 42 seconds   80/tcp    asifc5
2181c1ea8041   ashunginx:1.0   "/docker-entrypoint.…"   2 minutes ago    Up 2 minutes    80/tcp    ashungc1
[ashu@docker-ce ashu-images]$ 
```

### checking particular container ip 

```
[ashu@docker-ce ashu-images]$ docker  inspect ashungc1   |   grep -i ipaddress
            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.2",
                    "IPAddress": "172.17.0.2",
[ashu@docker-ce ashu-images]$ 
```

### to access anything outside host container will be using hostIP address -- called NAT 

<img src="nat.png">

### port mapping concept -- for external user access 

<img src="portm.png">

### implement 

```
[ashu@docker-ce ashu-images]$ docker run -d --name ashungc1  -p  1234:80      ashunginx:1.0 
805c53416e5706181b23f714f7de9c4ed4f937d956bb561cc551c80ab057bd0d
[ashu@docker-ce ashu-images]$ docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED         STATUS         PORTS                                   NAMES
805c53416e57   ashunginx:1.0   "/docker-entrypoint.…"   4 seconds ago   Up 2 seconds   0.0.0.0:1234->80/tcp, :::1234->80/tcp   ashungc1
[ashu@docker-ce ashu-images]$ 


```

### COncept to image sharing with Docker hub 

<img src="dh.png">

### uNderstanding docker hub image format 

<img src="imagename.png">

### pushing image to docker hub 

```
[ashu@docker-ce ashu-images]$ docker images   |   grep ashu
ashunginx                           1.0             7eb69787a3a5   3 hours ago         144MB
ashujava                            appv3           1357fe309c38   3 hours ago         672MB
ashu.java                           appDay2         d516a815c2fe   4 hours ago         672MB
ashujava                            appDay2         d516a815c2fe   4 hours ago         672MB
ashujava                            appv2           a2de1c0759d7   4 hours ago         672MB
ashujava                            appv1           dda6a22b3b03   22 hours ago        467MB
[ashu@docker-ce ashu-images]$ docker  tag  ashunginx:1.0   docker.io/dockerashu/ashunginx:1.0 
[ashu@docker-ce ashu-images]$ docker login -u dockerashu
Password: 
WARNING! Your password will be stored unencrypted in /home/ashu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
[ashu@docker-ce ashu-images]$ docker push docker.io/dockerashu/ashunginx:1.0
The push refers to repository [docker.io/dockerashu/ashunginx]
ee2471fc5a6c: Pushed 
6cffb086835a: Mounted from library/nginx 
e2d75d87993c: Mounted from library/nginx 
5a5bafd53f76: Mounted from library/nginx 
f86e88a471f4: Mounted from library/nginx 

[ashu@docker-ce ashu-images]$ docker logout 
Removing login credentials for https://index.docker.io/v1/
[ashu@docker-ce ashu-images]$ 
```

### container to docker images 

```
200  docker run -itd --name ashucimg  oraclelinux:8.4 
  201  docker exec -it ashucimg bash 
  202  history 
  203  docker commit  ashucimg ashucimg:v007 
  204  docker images  |  grep ashu
  205  docker run -itd --name ashutestc1 ashucimg:v007  
  206  docker ps
  207  docker  inspect  ashutestc1
  208  history 
  209  docker update  --restart always   ashutestc1
  210  docker  inspect  ashutestc1
  211  history 
[ashu@docker-ce ashu-images]$ docker tag ashucimg:v007  docker.io/dockerashu/ashucimg:v007
[ashu@docker-ce ashu-images]$ docker login 
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: dockerashu
Password: 
WARNING! Your password will be stored unencrypted in /home/ashu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
[ashu@docker-ce ashu-images]$ docker push docker.io/dockerashu/ashucimg:v007
The push refers to repository [docker.io/dockerashu/ashucimg]
16adc8bf8d75: Pushed 
2d3586eacb61: Layer already exists 
v007: digest: sha256:a01d91988151dee4af66d4b4fafe825224bda81e171afcf4f35b2bef8a71c18a size: 742
[ashu@docker-ce ashu-images]$ docker logout 
Removing login credentials for https://index.docker.io/v1/
[ashu@docker-ce ashu-images]$ 
```

### java backend based webapp containerization 

<img src="tomcat.png">

### taking java based webapp 

```
[ashu@docker-ce ashu-images]$ git clone https://github.com/redashu/javawebapp.git
fatal: destination path 'javawebapp' already exists and is not an empty directory.
[ashu@docker-ce ashu-images]$ 
[ashu@docker-ce ashu-images]$ ls
html-sample-app  java-app  javawebapp  python-apps
[ashu@docker-ce ashu-images]$ 

```

### Understanding dockerfile 

```
FROM tomcat
LABEL name=ashutoshh
WORKDIR /usr/local/tomcat/webapps
RUN mkdir ashu
WORKDIR ashu 
ADD myapp . 

```

### lets build it 

```
[ashu@docker-ce ashu-images]$ ls
html-sample-app  java-app  javawebapp  python-apps
[ashu@docker-ce ashu-images]$ docker build -t  ashujava:webappv1  javawebapp/ 
Sending build context to Docker daemon  160.8kB
Step 1/6 : FROM tomcat
latest: Pulling from library/tomcat
e96e057aae67: Pull complete 
014fa72e018d: Pull complete 
06768b8afb03: Pull complete 
3c12ca51ab80: Pull complete 
55a6d794ff88: Pull complete 
c98105279431: Pull complete 
b1ab501a2026: Pull complete 
Digest: sha256:24617d8a035492d33a732dd6154cc64a86463a4d3157c67c6364b09141dc475a
Status: Downloaded newer image for tomcat:latest
 ---> 1ca69d1bf49a
Step 2/6 : LABEL name=ashutoshh
 ---> Running in 2f1fd7be3b83
Removing intermediate container 2f1fd7be3b83
 ---> 96c98f8c75e3
Step 3/6 : WORKDIR /usr/local/tomcat/webapps
 ---> Running in 19361f468720
Removing intermediate container 19361f468720
 ---> 6cb19aa61c4d
Step 4/6 : RUN mkdir ashu
 ---> Running in 37a5daef2880
Removing intermediate container 37a5daef2880
 ---> c1782a321fd1
Step 5/6 : WORKDIR ashu
 ---> Running in 5a4550d6697a
Removing intermediate container 5a4550d6697a
 ---> ed69017b8bb9
Step 6/6 : ADD myapp .
 ---> 75b1c4b2b823
Successfully built 75b1c4b2b823
Successfully tagged ashujava:webappv1
```


## Introduction to Cgroups in docker 

<img src="cg.png">

### limiting ram in container 

```
 225  docker run -d --name ashucc11  --restart always -p 1234:8080  --memory 400M ashujava:webappv1 
  226  docker ps
  227  docker  stats  ashucc11
  228  history 
[ashu@docker-ce ashu-images]$ docker ps
CONTAINER ID   IMAGE                 COMMAND             CREATED              STATUS              PORTS                                             NAMES
f7f58d190d50   75b1c4b2b823          "catalina.sh run"   4 seconds ago        Up 4 seconds        0.0.0.0:2999->8080/tcp, :::2999->8080/tcp         arpit29nov_8
1b0f6b6a5456   mamtajava:javaapp     "catalina.sh run"   38 seconds ago       Up 37 seconds       0.0.0.0:1235->8080/tcp, :::1235->8080/tcp         mamtacc11
7dfa2fd0936e   ashujava:webappv1     "catalina.sh run"   About a minute ago   Up About a minute   0.0.0.0:1234->8080/tcp, :::1234->8080/tcp         ashucc11
c13f495cb1e7   75b1c4b2b823          "catalina.sh run"   40 minutes ago       Up 40 minutes       8080/tcp, 0.0.0.0:3999->80/tcp, :::3999->80/tcp   arpit29nov_6
fc2fecb25178   pranavjava:webapp01   "catalina.sh run"   43 minutes ago       Up 43 minutes       0.0.0.0:1999->8080/tcp, :::1999->8080/tcp         pranavc1
[ashu@docker-ce ashu-images]$ 
```

### docker stats 

```
CONTAINER ID   NAME       CPU %     MEM USAGE / LIMIT   MEM %     NET I/O     BLOCK I/O   PIDS
7dfa2fd0936e   ashucc11   0.01%     57.52MiB / 400MiB   14.38%    710B / 0B   0B / 0B     30
^C
```

### putting memory and cpu limit both 

```
docker run -d --name ashucc11  --restart always -p 1234:8080  --memory 400M  --cpu-shares=300      ashujava:webappv1 
```

