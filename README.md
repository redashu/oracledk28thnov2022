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






