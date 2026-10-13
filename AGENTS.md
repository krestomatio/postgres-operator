# Repository guidance

Follow this repository's documentation and any more specific instructions for
the files being changed.

## Repository scope

- This Ansible Operator SDK project reconciles PostgreSQL custom resources used
  by the LMS meta-operator.
- `watches.yaml`, `playbooks/`, `config/crd/`, samples, bundle metadata, and the
  pinned `krestomatio.k8s` collection define database provisioning, backup,
  lifecycle, and status behavior.
- Preserve CRD identity, service/secret names, storage and upgrade semantics,
  labels, conditions, and suspend/delete behavior. Database compatibility and data
  retention take precedence over cleanup convenience.

## Validation

- Initialize `hack/mk` and `molecule`, then run `make ansible-lint` and
  `make molecule`. Regenerate and validate the bundle for API, RBAC, sample, or
  release-metadata changes.
- Use disposable synthetic databases. Never run deployment, deletion, restore,
  image push, or release targets against retained or production data.
