# Repository guidance

Before working, read these optional instruction files in order,
resolving these paths from this repository's root:

1. `.agents/organization/AGENTS.md`
2. `.agents/workspace/AGENTS.md`

Read each file if it resolves to a readable regular file.
Skip absent files; report broken or unreadable links.
Read each resolved file only once to avoid duplicate loading and cycles.

Resolve references inside imported files relative to their real target
directory after following symlinks.

Apply organization guidance, then workspace guidance, then the repository
instructions below. More specific applicable instructions take precedence.

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
