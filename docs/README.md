# Postgres Operator

This operator simplifies deployment and management of PostgreSQL databases within Kubernetes environments. It supports PostgreSQL version 13 and offers two deployment configurations:

* **Standalone Mode:**
    * Deploys a single primary PostgreSQL instance using a StatefulSet for high availability.
    * Provides a PgBouncer service for connection pooling in front of the primary instance.
* **Read Replica Mode:**
    * Deploys a primary PostgreSQL instance with configurable read replicas (N replicas) using separate StatefulSets.
    * Utilizes two PgBouncer services:
        * Primary PgBouncer for read/write connections against the primary instance.
        * Secondary PgBouncer for read-only connections distributed across read replicas and the primary.

**Key Technologies:**

* Kubernetes
* Ansible Operator SDK
* Postgres
* PgBouncer

## Installation

**Important Note:** This Postgres Operator is currently in **Beta** stage. Proceed with caution in production deployments.

1. **Install Operator:**
```bash
# Ensure prerequisites are met
kubectl apply -k https://github.com/krestomatio/postgres-operator/config/default?ref=v0.3.24
```

2. **Configure Postgres Instance:**
- Download and modify [this sample](https://raw.githubusercontent.com/krestomatio/postgres-operator/v0.3.24/config/samples/postgres_v1alpha1_postgres.yaml) file to reflect your specific instance. This file defines the desired configuration for your KeyDB deployment, including the chosen mode (standalone or readreplicas).
```bash
curl -sSL 'https://raw.githubusercontent.com/krestomatio/postgres-operator/v0.3.24/config/samples/postgres_v1alpha1_postgres.yaml' -o postgres_v1alpha1_postgres.yaml
# modify postgres_v1alpha1_postgres.yaml

# for readreplicas mode, use:
# curl -sSL 'https://raw.githubusercontent.com/krestomatio/postgres-operator/v0.3.24/config/samples/postgres_v1alpha1_postgres_readreplicas.yaml' -o postgres_v1alpha1_postgres.yaml
```

3. **Deploy Postgres:**
- Deploy a Postgres instance using the modified configuration:
```bash
kubectl apply -f postgres_v1alpha1_postgres.yaml
```

4. **Monitor Logs:**
- Track the Postgres Operator logs for insights into the deployment process:
```bash
kubectl -n postgres-operator-system logs -l control-plane=controller-manager -c manager -f
```

- Monitor the status of your deployed Postgres instance:
```bash
kubectl get -f postgres_v1alpha1_postgres.yaml -w
```

## Uninstall

1. **Delete Postgres Instance:**
```bash
# Caution: This step leads to data loss. Proceed with caution.
kubectl delete -f postgres_v1alpha1_postgres.yaml
```

2. **Uninstall Operator:**
```bash
kubectl delete -k https://github.com/krestomatio/postgres-operator/config/default?ref=v0.3.24
```

## Configuration

Postgres custom resource (CR) can be configure via its spec field. Postgres CR spec supports all the the variables in [v1alpha1.database.postgres ansible role](https://krestomatio.com/docs/ansible-collection-k8s/roles/v1alpha1.database.postgres/defaults/main/postgres) as fields. These variables can be specified directly in the Postgres CR YAML manifest file, allowing for customization of the Postgres instance during deployment. Refer to the official [v1alpha1.database.postgres ansible role documentation](https://krestomatio.com/docs/ansible-collection-k8s/roles/v1alpha1.database.postgres/) for a comprehensive list of supported fields.

## Contributing

* Report bugs, request enhancements, or propose new features using GitHub issues.
