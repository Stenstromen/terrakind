# Terraform Kind Provider with Podman Backend Example

## Usage

```bash
make init
make plan
make apply
```

## Requirements

- Terraform
- Podman

## Kube-Prometheus-Stack

```bash
kubectl port-forward -n monitoring svc/kube-prometheus-stack-grafana 3000:80
```

Grafana URL: `http://localhost:3000`
Grafana Username: admin
Grafana Password: admin

## License

MIT
