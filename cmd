krishna@evoke:~/Containerization$ kubectl apply -f KubernetesConfigurationFile/
deployment.apps/nginx created
service/nginx created
krishna@evoke:~/Containerization$ kubectl get pod -o wide
NAME                    READY   STATUS              RESTARTS   AGE   IP       NODE       NOMINATED NODE   READINESS GATES
nginx-d46f5678b-nbk9f   0/1     ContainerCreating   0          16s   <none>   minikube   <none>           <none>
nginx-d46f5678b-ndsfm   0/1     ContainerCreating   0          16s   <none>   minikube   <none>           <none>
nginx-d46f5678b-nv98d   0/1     ContainerCreating   0          16s   <none>   minikube   <none>           <none>
krishna@evoke:~/Containerization$ kubectl get pod -o wide
NAME                    READY   STATUS              RESTARTS   AGE   IP       NODE       NOMINATED NODE   READINESS GATES
nginx-d46f5678b-nbk9f   0/1     ContainerCreating   0          27s   <none>   minikube   <none>           <none>
nginx-d46f5678b-ndsfm   0/1     ContainerCreating   0          27s   <none>   minikube   <none>           <none>
nginx-d46f5678b-nv98d   0/1     ContainerCreating   0          27s   <none>   minikube   <none>           <none>
krishna@evoke:~/Containerization$ kubectl get pod -o wide
NAME                    READY   STATUS              RESTARTS   AGE   IP       NODE       NOMINATED NODE   READINESS GATES
nginx-d46f5678b-nbk9f   0/1     ContainerCreating   0          35s   <none>   minikube   <none>           <none>
nginx-d46f5678b-ndsfm   0/1     ContainerCreating   0          35s   <none>   minikube   <none>           <none>
nginx-d46f5678b-nv98d   0/1     ContainerCreating   0          35s   <none>   minikube   <none>           <none>
krishna@evoke:~/Containerization$ kubectl get pod 
NAME                    READY   STATUS              RESTARTS   AGE
nginx-d46f5678b-nbk9f   0/1     ContainerCreating   0          40s
nginx-d46f5678b-ndsfm   0/1     ContainerCreating   0          40s
nginx-d46f5678b-nv98d   1/1     Running             0          40s
krishna@evoke:~/Containerization$ kubectl get deployment
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
nginx   3/3     3            3           77s
krishna@evoke:~/Containerization$ kubectl get deployment nginx yaml
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
nginx   3/3     3            3           92s
Error from server (NotFound): deployments.apps "yaml" not found
krishna@evoke:~/Containerization$ kubectl get deployment nginx -o yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "1"
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"apps/v1","kind":"Deployment","metadata":{"annotations":{},"name":"nginx","namespace":"default"},"spec":{"replicas":3,"selector":{"matchLabels":{"app":"nginx"}},"strategy":{"type":"Recreate"},"template":{"metadata":{"labels":{"app":"nginx"}},"spec":{"containers":[{"image":"nginx","name":"nginx","ports":[{"containerPort":80}]}]}}}}
  creationTimestamp: "2020-09-07T07:23:25Z"
  generation: 1
  managedFields:
  - apiVersion: apps/v1
    fieldsType: FieldsV1
    fieldsV1:
      f:metadata:
        f:annotations:
          .: {}
          f:kubectl.kubernetes.io/last-applied-configuration: {}
      f:spec:
        f:progressDeadlineSeconds: {}
        f:replicas: {}
        f:revisionHistoryLimit: {}
        f:selector:
          f:matchLabels:
            .: {}
            f:app: {}
        f:strategy:
          f:type: {}
        f:template:
          f:metadata:
            f:labels:
              .: {}
              f:app: {}
          f:spec:
            f:containers:
              k:{"name":"nginx"}:
                .: {}
                f:image: {}
                f:imagePullPolicy: {}
                f:name: {}
                f:ports:
                  .: {}
                  k:{"containerPort":80,"protocol":"TCP"}:
                    .: {}
                    f:containerPort: {}
                    f:protocol: {}
                f:resources: {}
                f:terminationMessagePath: {}
                f:terminationMessagePolicy: {}
            f:dnsPolicy: {}
            f:restartPolicy: {}
            f:schedulerName: {}
            f:securityContext: {}
            f:terminationGracePeriodSeconds: {}
    manager: kubectl
    operation: Update
    time: "2020-09-07T07:23:25Z"
  - apiVersion: apps/v1
    fieldsType: FieldsV1
    fieldsV1:
      f:metadata:
        f:annotations:
          f:deployment.kubernetes.io/revision: {}
      f:status:
        f:availableReplicas: {}
        f:conditions:
          .: {}
          k:{"type":"Available"}:
            .: {}
            f:lastTransitionTime: {}
            f:lastUpdateTime: {}
            f:message: {}
            f:reason: {}
            f:status: {}
            f:type: {}
          k:{"type":"Progressing"}:
            .: {}
            f:lastTransitionTime: {}
            f:lastUpdateTime: {}
            f:message: {}
            f:reason: {}
            f:status: {}
            f:type: {}
        f:observedGeneration: {}
        f:readyReplicas: {}
        f:replicas: {}
        f:updatedReplicas: {}
    manager: kube-controller-manager
    operation: Update
    time: "2020-09-07T07:24:11Z"
  name: nginx
  namespace: default
  resourceVersion: "483"
  selfLink: /apis/apps/v1/namespaces/default/deployments/nginx
  uid: 251b4f1d-2528-45c8-938a-b49cf55a1136
spec:
  progressDeadlineSeconds: 600
  replicas: 3
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: nginx
  strategy:
    type: Recreate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: nginx
    spec:
      containers:
      - image: nginx
        imagePullPolicy: Always
        name: nginx
        ports:
        - containerPort: 80
          protocol: TCP
        resources: {}
        terminationMessagePath: /dev/termination-log
        terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30
status:
  availableReplicas: 3
  conditions:
  - lastTransitionTime: "2020-09-07T07:24:11Z"
    lastUpdateTime: "2020-09-07T07:24:11Z"
    message: Deployment has minimum availability.
    reason: MinimumReplicasAvailable
    status: "True"
    type: Available
  - lastTransitionTime: "2020-09-07T07:23:25Z"
    lastUpdateTime: "2020-09-07T07:24:11Z"
    message: ReplicaSet "nginx-d46f5678b" has successfully progressed.
    reason: NewReplicaSetAvailable
    status: "True"
    type: Progressing
  observedGeneration: 1
  readyReplicas: 3
  replicas: 3
  updatedReplicas: 3
krishna@evoke:~/Containerization$ 


