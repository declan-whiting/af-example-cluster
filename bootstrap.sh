kubectl create namespace istio-system
kubectl create namespace istio-ingress

kubectl create namespace monitoring
kubectl label namespace monitoring istio-injection=enabled --overwrite

kubectl create namespace infrabin
kubectl label namespace infrabin istio-injection=enabled --overwrite

helm dependency build ./helm/istio-base
helm dependency build ./helm/istiod
helm dependency build ./helm/istio-ingress
helm dependency build ./helm/monitoring

helm install istio-base ./helm/istio-base --namespace istio-system
helm install istiod ./helm/istiod --namespace istio-system
helm install istio-ingressgateway ./helm/istio-ingress --namespace istio-ingress
helm install kube-prometheus-stack ./helm/monitoring --namespace monitoring
helm install infrabin ./helm/infrabin --namespace infrabin

helm ls -A