[Postgres-operator](https://github.com/krestomatio/postgres-operator) handles a postgres (version 13) instance in Kubernetes. It has **two modes**: [standalone](config/samples/postgres_v1alpha1_postgres.yaml) or [readreplicas](config/samples/postgres_v1alpha1_postgres_readreplicas.yaml). In [standalone mode](config/samples/postgres_v1alpha1_postgres.yaml) mode, only a primary postgres instance (_StatefulSet_) is deploy. In [readreplicas mode](config/samples/postgres_v1alpha1_postgres_readreplicas.yaml), a primary plus N replicas are deploy using a separate _StatefulSet_. In both modes, a pgbouncer service is deploy in front of the primary instance. In [readreplicas mode](config/samples/postgres_v1alpha1_postgres_readreplicas.yaml) mode, a second pgbouncer service is deploy for **readonly** queries against read replicas and the primary instance.

## Install

> The Kubernetes Operator in this project is in **Alpha** version. **Use at your own risk**

Check out the [sample CR for standalone mode](config/samples/postgres_v1alpha1_postgres.yaml). Follow the next steps to first install the Postgres Operator and then a Postgres instance:
```bash
# install the operator
make deploy

# create Postgres instance from sample
kubectl apply -f config/samples/postgres_v1alpha1_postgres.yaml

# follow/check Postgres operator logs
kubectl -n postgres-operator-system logs -l control-plane=controller-manager -c manager  -f

# follow sample CR status
kubectl get postgres postgres-sample -o yaml -w
```

## Uninstall
Follow the next steps to uninstall it.
```bash
# delete the Postgres object
# CAUTION with data loss
kubectl delete -f config/samples/postgres_v1alpha1_postgres.yaml

# uninstall the operator
make undeploy
```

### Advanced Options
For different or advanced configuration via the CR spec, take a look at the [variables available](https://github.com/krestomatio/ansible-collection-k8s/blob/master/roles/v1alpha1/database/postgres/defaults/main/postgres.yml)

## Want to contribute?
* Use github issues to report bugs, send enhancement, new feature requests and questions
