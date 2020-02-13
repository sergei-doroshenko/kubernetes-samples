# install helm
brew install kubernetes-helm

# install chart
helm install myapp myapp-0
# Output:
# NAME: myapp
# LAST DEPLOYED: Thu Feb 13 12:39:22 2020
# NAMESPACE: default
# STATUS: deployed
# REVISION: 1
# TEST SUITE: None

# verify that all works
kubectl get svc,deployment,pod
# Output:
# NAME                 TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)                       AGE
# service/greeting     LoadBalancer   10.98.204.189   localhost     80:32456/TCP,5005:31451/TCP   27s
# service/kubernetes   ClusterIP      10.96.0.1       <none>        443/TCP                       20h
#
# NAME                             READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.extensions/greeting   1/1     1            1           27s
#
# NAME                            READY   STATUS    RESTARTS   AGE
# pod/greeting-655b895749-68hfw   1/1     Running   0          27s

# check that web-app works
# this command works across different environments
curl http://$(kubectl get svc/greeting -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'):80

# delete release
helm del myapp
# Output:
# release "myapp" uninstalled

kubectl get svc,deployment,pod
# Output:
# NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
# service/kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   20h