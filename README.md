# ct-iot-observability

## Description
- ct-iot namespace
- grafana
- prometheus

## helm
- 

## kubectl
```
kubectl create namespace ct-iot

kubectl install grafana
kubectl install prometheus
```

```
kubectl --namespace=kube-system create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --
helm ls


helm install -f prometheus-values.yml charts/stable/prometheus --name prometheus --namespace prometheus
vi grafana-values.yml


helm install -f grafana-values.yml charts/stable/grafana/ --name grafana --namespace grafana
vi grafana-ext.yml



# binami
helm install my-release oci://registry-1.docker.io/bitnamicharts/prometheus
helm install prometheus -n ct-iot oci://registry-1.docker.io/bitnamicharts/prometheus


helm install my-release oci://registry-1.docker.io/bitnamicharts/grafana
helm install grafana -n ct-iot oci://registry-1.docker.io/bitnamicharts/grafana

```


# start-over and revised
```
helm repo add bitnami https://charts.bitnami.com/bitnami
$ helm search repo bitnami
$ helm install my-release bitnami/<chart>
```

## Integrate Prometheus with Grafana
https://github.com/bitnami/charts/tree/main/bitnami/prometheus
https://github.com/bitnami/charts/tree/main/bitnami/grafana

```

# minikube
minikube start
minikube addons disable metrics-server
```

## kubectl
```
k create namespace ct-iot
k create namespace monitoring
```

## helm
```
helm install prometheus oci://registry-1.docker.io/bitnamicharts/prometheus -n monitoring
    
helm install grafana oci://registry-1.docker.io/bitnamicharts/grafana \
    -f helm/grafana-values.yaml -n monitoring

# port forwarding
echo "Browse to http://127.0.0.1:8080"
    k -n monitoring port-forward svc/grafana 8080:3000 &

# list all port forwards across all services
k get svc -o json | jq '.items[] | {name:.metadata.name, p:.spec.ports[] } | select( .p.nodePort != null ) | "\(.name): localhost:\(.p.nodePort) -> \(.p.port) -> \(.p.targetPort)"'

```