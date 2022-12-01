# Training plan 

<img src="plan.png">

### pod commands 

```
ashu@docker-ce ashu-images]$ kubectl  get pods
NAME           READY   STATUS             RESTARTS        AGE
anuragpod-1    1/1     Running            1 (49m ago)     17h
arpitpod-1     1/1     Running            1 (49m ago)     17h
dhrubapod-1    1/1     Running            1 (49m ago)     17h
mamtapod-1     1/1     Running            1 (49m ago)     17h
mysample-app   1/1     Running            1 (49m ago)     17h
nilpod-1       1/1     Running            1 (49m ago)     17h
pranavpod-1    1/1     Running            1 (49m ago)     17h
sameerpod-1    1/1     Running            0               23m
sindhupod1     0/1     CrashLoopBackOff   9 (107s ago)    23m
vijayapod1     0/1     CrashLoopBackOff   19 (107s ago)   16h
vpod1          1/1     Running            1 (49m ago)     17h
[ashu@docker-ce ashu-images]$ kubectl  delete pods --all
pod "anuragpod-1" deleted
pod "arpitpod-1" deleted
pod "dhrubapod-1" deleted
pod "mamtapod-1" deleted
pod "mysample-app" deleted
pod "nilpod-1" deleted
pod "pranavpod-1" deleted
```

### creating pod from command line 

```
[ashu@docker-ce deploy-app-k8s]$ kubectl  run  ashupod-2 --image=docker.io/dockerashu/ashunginx:1.0  --port 80 
pod/ashupod-2 created
[ashu@docker-ce deploy-app-k8s]$ kubectl   get  pods
NAME        READY   STATUS    RESTARTS   AGE
ashupod-2   1/1     Running   0          5s
[ashu@docker-ce deploy-app-k8s]$ 


```

### generating yaml pod using kubectl 

```
[ashu@docker-ce deploy-app-k8s]$ kubectl  run  ashupod-2 --image=docker.io/dockerashu/ashunginx:1.0  --port 80 --dry-run=client -o yaml 
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: ashupod-2
  name: ashupod-2
spec:
  containers:
  - image: docker.io/dockerashu/ashunginx:1.0
    name: ashupod-2
    ports:
    - containerPort: 80
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
[ashu@docker-ce deploy-app-k8s]$ kubectl  run  ashupod-2 --image=docker.io/dockerashu/ashunginx:1.0  --port 80 --dry-run=client -o yaml  >autopod.yaml
[ashu@docker-ce deploy-app-k8s]$ ls
ashu-app.yaml  autopod.yaml
```

### JSON 

```
[ashu@docker-ce deploy-app-k8s]$ kubectl  run  ashupod-2 --image docker.io/dockerashu/ashunginx:1.0  --port=80 --dry-run=client -o json >auto.json 
[ashu@docker-ce deploy-app-k8s]$ ls
ashu-app.yaml  auto.json  autopod.yaml
[ashu@docker-ce deploy-app-k8s]$ 
[ashu@docker-ce deploy-app-k8s]$ kubectl  apply -f auto.json 
pod/ashupod-2 created
[ashu@docker-ce deploy-app-k8s]$ kubectl  get pods
NAME        READY   STATUS             RESTARTS     AGE
ashupod-2   1/1     Running            0            3s
spod2       0/1     CrashLoopBackOff   1 (8s ago)   12s
[ashu@docker-ce deploy-app-k8s]$ kubectl  delete -f auto.json 
pod "ashupod-2" deleted
[ashu@docker-ce deploy-app-k8s]$ 
```

### Namespace concept in k8s 

<img src="ns.png">

```
[ashu@docker-ce deploy-app-k8s]$ kubectl   create  namespace  ashu-apps --dry-run=client 
namespace/ashu-apps created (dry run)
[ashu@docker-ce deploy-app-k8s]$ kubectl   create  namespace  ashu-apps --dry-run=client -o yaml
apiVersion: v1
kind: Namespace
metadata:
  creationTimestamp: null
  name: ashu-apps
spec: {}
status: {}
[ashu@docker-ce deploy-app-k8s]$ kubectl   create  namespace  ashu-apps 
namespace/ashu-apps created
[ashu@docker-ce deploy-app-k8s]$ kubectl  config set-context --current --namespace=ashu-apps 
Context "kubernetes-admin@kubernetes" modified.
[ashu@docker-ce deploy-app-k8s]$ kubectl   get  pods
No resources found in ashu-apps namespace.
[ashu@docker-ce deploy-app-k8s]$ 

```

### checking ns and creating pod inside 

```
[ashu@docker-ce deploy-app-k8s]$ kubectl  get  pods
No resources found in ashu-apps namespace.
[ashu@docker-ce deploy-app-k8s]$ 
[ashu@docker-ce deploy-app-k8s]$ kubectl   config get-contexts 
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   ashu-apps
[ashu@docker-ce deploy-app-k8s]$ ls
ashu-app.yaml  auto.json  autopod.yaml
[ashu@docker-ce deploy-app-k8s]$ kubectl   apply -f ashu-app.yaml 
pod/ashupod-1 created
[ashu@docker-ce deploy-app-k8s]$ kubectl  get pods
NAME        READY   STATUS    RESTARTS   AGE
ashupod-1   1/1     Running   0          3s
[ashu@docker-ce deploy-app-k8s]$ 
```

### multi container pod 

```
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels:
    run: ashupod-2
  name: ashupod-2
spec:
  containers:
  - image: oraclelinux:8.4
    name: ashuc1
    command: ["sh","-c","sleep 10000"]
  - image: docker.io/dockerashu/ashunginx:1.0
    name: ashupod-2
    ports:
    - containerPort: 80
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

```

## Networking in k8s 

<img src="net1.png">

### Internal LB will be Required 

<img src="net2.png">

### overall networking flow for k8s app

<img src="appf.png">




