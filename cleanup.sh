helm uninstall istio-ingressgateway --namespace istio-ingress
helm uninstall istiod --namespace istio-system
helm uninstall istio-base --namespace istio-system
helm uninstall kube-prometheus-stack --namespace monitoring

helm uninstall infrabin --namespace infrabin
kubectl get crd -oname | grep --color=never 'istio.io' | xargs kubectl delete

kubectl delete namespace istio-system
kubectl delete namespace istio-ingress
kubectl delete namespace monitoring
kubectl delete namespace infrabin

helm ls -A