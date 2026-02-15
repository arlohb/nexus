
- Clear / create `datasphere:/Root/Volumes/out`
- `kubectl apply -f scripts/pg-migrate/dump.yaml`
    - Wait until finished, may need manually deleting
- `flux suspend kustomization --all`
- Stop postgres and dependants: immich, bike-db
    - `kubectl delete deployment postgres immich bike-db`
- Move contents of postgres data directory
- Install the new postgres
    - Change the version, commit the change
    - `flux reconcile source git flux-system`
    - `flux resume kustomization infra-secrets infra-postgres`
- `kubectl apply -f scripts/pg-migrate/restore.yaml`
    - Wait until finished, may need manually deleting
- `flux resume kustomization --all`
- Delete `datasphere:/Root/Volumes/out` and postgres backup

