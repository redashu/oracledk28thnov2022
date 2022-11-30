# Training plan 

<img src="plan.png">

## Docker Revision 

<img src="rev.png">

### docker volume mounting concept 

<img src="vol.png">

### creating db container with volume 

```
254  docker run -d --name ashudbc1 -e MYSQL_ROOT_PASSWORD="Oracle@098#"  -v ashu-vol:/var/lib/mysql/:rw  mysql:latest 
  255  docker  ps
  256  history 
  257  docker ps
  258  docker logs ashudbc1
  259  history 
[ashu@docker-ce ashu-images]$ 
[ashu@docker-ce ashu-images]$ docker exec -it ashudbc1 bash 
bash-4.4# 
bash-4.4# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.31 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

mysql> create  database hellodb;
Query OK, 1 row affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| hellodb            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> ^DBye
bash-4.4# exit
[ashu@docker-ce ashu-images]$ 
```

### destroy container 

```
[ashu@docker-ce ashu-images]$ docker rm ashudbc1 -f
ashudbc1
[ashu@docker-ce ashu-images]$ docker ps 
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
[ashu@docker-ce ashu-images]$ docker run -d --name ashudbc1 -e MYSQL_ROOT_PASSWORD="Oracle@098#"  -v ashu-vol:/var/lib/mysql/:rw  mysql:latest 
ccaa529ca7f88ea55f608d66c264f67d6d01931b0c7740952e0f85c4616f967c
[ashu@docker-ce ashu-images]$ 
[ashu@docker-ce ashu-images]$ docker exec -it ashudbc1 bash 
bash-4.4# 
bash-4.4# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.31 MySQL Community Server - GPL

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| hellodb            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)

mysql> ^DBye
bash-4.4# exit
```

### two volume in same container 

```
ashu@docker-ce ashu-images]$ docker  run -it --name ashuc2 -v ashu-vol:/mnt/data:ro  -v  ashuvol9:/opt/data:rw   oraclelinux:8.4 
[root@141ebad13b0c /]# 
[root@141ebad13b0c /]# cp -rfv /mnt/data/*  /opt/data/
'/mnt/data/#ib_16384_0.dblwr' -> '/opt/data/#ib_16384_0.dblwr'
'/mnt/data/#ib_16384_1.dblwr' -> '/opt/data/#ib_16384_1.dblwr'
'/mnt/data/#innodb_redo' -> '/opt/data/#innodb_redo'
'/mnt/data/#innodb_redo/#ib_redo10_tmp' -> '/opt/data/#innodb_redo/#ib_redo10_tmp'
'/mnt/data/#innodb_redo/#ib_redo11_tmp' -> '/opt/data/#innodb_redo/#ib_redo11_tmp'
'/mnt/data/#innodb_redo/#ib_redo12_
```

### bind mount 

```
ashu@docker-ce ashu-images]$ git clone https://github.com/yenchiah/project-website-template.git
Cloning into 'project-website-template'...
remote: Enumerating objects: 1025, done.
remote: Total 1025 (delta 0), reused 0 (delta 0), pack-reused 1025
Receiving objects: 100% (1025/1025), 1.64 MiB | 7.23 MiB/s, done.
Resolving deltas: 100% (632/632), done.
[ashu@docker-ce ashu-images]$ ls
html-sample-app  java-app  javawebapp  project-website-template  python-apps
[ashu@docker-ce ashu-images]$ 
[ashu@docker-ce ashu-images]$ pwd
/home/ashu/ashu-images
[ashu@docker-ce ashu-images]$ docker run -d --name ashuwebc1 -v  /home/ashu/ashu-images/project-website-template/:/usr/share/nginx/html:ro -p 1234:80 nginx 
08b98c82acc413d49dc0ff3daa972094f5f47da66a245eebd9038f7e43f438b3
[ashu@docker-ce ashu-images]$ 
[ashu@docker-ce ashu-images]$ 
[ashu@docker-ce ashu-images]$ 

```

## managing app containers using compose 

```
[root@docker-ce ~]# curl -SL https://github.com/docker/compose/releases/download/v2.13.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 43.5M  100 43.5M    0     0  12.2M      0  0:00:03  0:00:03 --:--:-- 15.6M
[root@docker-ce ~]# cp -v /usr/local/bin/docker-compose  /usr/bin/
'/usr/local/bin/docker-compose' -> '/usr/bin/docker-compose'
[root@docker-ce ~]# chmod +x /usr/bin/docker-compose 
[root@docker-ce ~]# 
[root@docker-ce ~]# docker-compose version 
Docker Compose version v2.13.0
[root@docker-ce ~]# 



```

### info about compose file 

<img src="cfile.png">

## COmpsoe file examples 

### example 1 

```

version: '3.8'
services: # here we write app component details
  ashuwebapp: # name of app component -- you can give any name 
    image: nginx 
    container_name: ashungc1
    ports:
    - "1234:80"
    volumes:
    - "../html-sample-app:/usr/share/nginx/html/"
    restart: always 
```

### lets run it 

```
ashu@docker-ce ashu-images]$ ls
ashu-compose  html-sample-app  java-app  javawebapp  project-website-template  python-apps
[ashu@docker-ce ashu-images]$ cd  ashu-compose/
[ashu@docker-ce ashu-compose]$ ls
docker-compose.yaml
[ashu@docker-ce ashu-compose]$ docker-compose up -d
[+] Running 2/2
 ⠿ Network ashu-compose_default  Created                                                                                         0.0s
 ⠿ Container ashungc1            Started                                                                                         0.5s
[ashu@docker-ce ashu-compose]$ docker-compose  ps
NAME                COMMAND                  SERVICE             STATUS              PORTS
ashungc1            "/docker-entrypoint.…"   ashuwebapp          running             0.0.0.0:1234->80/tcp, :::1234->80/tcp
[ashu@docker-ce ashu-compose]$ 


```

### more operation example to compose 

```
[ashu@docker-ce ashu-compose]$ docker-compose  stop 
[+] Running 1/1
 ⠿ Container ashungc1  Stopped                                                                                                   0.2s
[ashu@docker-ce ashu-compose]$ docker-compose  ps
NAME                COMMAND                  SERVICE             STATUS              PORTS
ashungc1            "/docker-entrypoint.…"   ashuwebapp          exited (0)          
[ashu@docker-ce ashu-compose]$ docker-compose  start
[+] Running 1/1
 ⠿ Container ashungc1  Started                                                                                                   0.5s
[ashu@docker-ce ashu-compose]$ docker-compose  ps
NAME                COMMAND                  SERVICE             STATUS              PORTS
ashungc1            "/docker-entrypoint.…"   ashuwebapp          running             0.0.0.0:1234->80/tcp, :::1234->80/tcp
[ashu@docker-ce ashu-compose]$ 
```

### --

```
[ashu@docker-ce ashu-compose]$ docker-compose  ps
NAME                COMMAND                  SERVICE             STATUS              PORTS
ashungc1            "/docker-entrypoint.…"   ashuwebapp          running             0.0.0.0:1234->80/tcp, :::1234->80/tcp
[ashu@docker-ce ashu-compose]$ docker-compose  kill
[+] Running 1/1
 ⠿ Container ashungc1  Killed                                                                                                    0.2s
[ashu@docker-ce ashu-compose]$ docker-compose  start
[+] Running 1/1
 ⠿ Container ashungc1  Started                                                                                                   0.5s
[ashu@docker-ce ashu-compose]$ docker-compose  down 
[+] Running 2/2
 ⠿ Container ashungc1            Removed                                                                                         0.2s
 ⠿ Network ashu-compose_default  Removed    
```

### Example 2 -- docker compose file 

```
version: '3.8'
services: # here we write app component details
  ashujavaweb:
    image: ashujava:webv1 # want to build image 
    build: 
      context: ../javawebapp/ # location of dockerfile 
      dockerfile: Dockerfile  # name of dockerfile 
    container_name: ashujc1 
    ports:
    - "1299:8080"
  ashuwebapp: # name of app component -- you can give any name 
    image: nginx 
    container_name: ashungc1
    ports:
    - "1234:80"
    volumes:
    - "../html-sample-app:/usr/share/nginx/html/"
    restart: always 
   
```

### lets run it 

```
ashu@docker-ce ashu-compose]$ docker-compose up -d --build 
[+] Building 0.7s (9/10)                                                                                                              
 => [internal] load build definition from Dockerfile                                                                             0.0s
 => => transferring dockerfile: 146B                                                                                             0.0s
 => [internal] load .dockerignore                                                                                                0.0s
 => => transferring context: 2B                                                                                                  0.0s
 => [internal] load metadata for docker.io/library/tomcat:latest                                                                 0.0s
 => [internal] load build context                                                                                                0.1s
 => => transferring context: 39.71kB                                                                                             0.0s
 => [1/5] FROM docker.io/library/tomcat                                                                                          0.7s
 => [2/5] WORKDIR /usr/local/tomcat/webapps                                                                                      0.0s
 => [3/5] RUN mkdir ashu                                                                                                         0.4s
 => [4/5] WORKDIR ashu                                                                                                           0.0s
 => [5/5] ADD myapp .                                                                                                            0.0s
 => exporting to image                                                                                                           0.1s
 => => exporting layers                                                                                                          0.0s
 => => writing image sha256:f2ee2e42587c8749ec009f004d9a8bffe3c662ff2de4adcefdae3b122edea250                                     0.0s
 => => naming to docker.io/library/ashujava:webv1                                                                                0.0s
[+] Running 3/3
 ⠿ Network ashu-compose_default  Created                                                                                         0.0s
 ⠿ Container ashungc1            Started                                                                                         0.9s
 ⠿ Container ashujc1             Started                                                                                         0.9s
[ashu@docker-ce ashu-compose]$ docker-compose ps
NAME                COMMAND                  SERVICE             STATUS              PORTS
ashujc1             "catalina.sh run"        ashujavaweb         running             0.0.0.0:1299->8080/tcp, :::1299->8080/tcp
ashungc1            "/docker-entrypoint.…"   ashuwebapp          running             0.0.0.0:1234->80/tcp, :::1234->80/tcp
[ashu@docker-ce ashu-compose]$ 
```

### 

```
ashu@docker-ce ashu-compose]$ docker-compose down 
[+] Running 3/3
 ⠿ Container ashungc1            Removed                                                                                        10.2s
 ⠿ Container ashujc1             Removed                                                                                         0.2s
 ⠿ Network ashu-compose_default  Removed        
```






