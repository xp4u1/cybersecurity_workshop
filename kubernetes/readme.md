## Quickstart

```bash
# Create database and load dump
docker compose --project-directory ./database --project-name zeroday up -d
psql --host localhost --username postgres --file database/dump.sql zeroday

# Create cluster
k3d cluster create --config k3d-cluster.yaml
k3d image import zeroday_portal --cluster zeroday
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/calico.yaml
```

## Optional Dashboard

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl apply -f dashboard-user.yaml
kubectl -n kubernetes-dashboard create token dashboard-user
kubectl port-forward -n kubernetes-dashboard service/kubernetes-dashboard 8443:443
```
