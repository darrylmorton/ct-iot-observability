# ct-iot-observability

## Description
- monitoring namespace
- ct-iot namespace
- kube-prometheus-stack

## minikube
```
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
# promethues | grafana
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring

## jsonnet-bundler
brew install jsonnet-bundler
jb init
jb install github.com/prometheus-operator/kube-prometheus/jsonnet/kube-prometheus@main

## wget
brew install wget

## kube-prometheus config
wget https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/main/example.jsonnet -O example.jsonnet
wget https://raw.githubusercontent.com/prometheus-operator/kube-prometheus/main/build.sh -O build.sh
chmod +x build.sh

# grafana password
k get secret prometheus-grafana -n monitoring -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

# port forwarding
echo "Browse to http://127.0.0.1:8080"
    k -n monitoring port-forward svc/prometheus-grafana 8080:80 &
    
# list all port forwards across all services
k get svc -o json | jq '.items[] | {name:.metadata.name, p:.spec.ports[] } | select( .p.nodePort != null ) | "\(.name): localhost:\(.p.nodePort) -> \(.p.port) -> \(.p.targetPort)"'


# kafka | postgresql
helm repo add bitnami https://charts.bitnami.com/bitnami
...

```

```
helm upgrade --install prometheus prometheus-community/kube-prometheus-stack -n monitoring -f helm/prometheus-additional.yaml

helm install prometheus prometheus-community/kube-prometheus-stack -n monitoring -f helm/prometheus-additional.yaml

sum(rate(http_request_duration_ms_count[2m])) by (method, handler, http_status) * 60

sum(rate(http_request_duration_ms_count[2m])) by (service, route, method, code) * 60


# kafka
helm install kafka oci://registry-1.docker.io/bitnamicharts/kafka -n ct-iot
```

## kafka
cli
```
brew install confluentinc/tap/cli

brew upgrade confluentinc/tap/cli
```