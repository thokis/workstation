# secrets

Fetches the GitHub SSH private key from **OpenBao** (`https://bao.helios9.org`,
KV v2 at `secret/ssh/github`) and installs it to `~/.ssh/id_ed25519` (`0600`), so
the later roles can clone the `git@github.com` forks. Runs early (right after
`system`), before any clone.

Auth is **AppRole**, read from the environment (`ANSIBLE_HASHI_VAULT_ADDR`,
`ANSIBLE_HASHI_VAULT_AUTH_METHOD=approle`, `ANSIBLE_HASHI_VAULT_ROLE_ID`,
`ANSIBLE_HASHI_VAULT_SECRET_ID`) — generated into a gitignored `.env` by
`scripts/bootstrap-secrets-env.sh` and sourced by `scripts/provision.sh`. The
lookup runs on the **controller**; the key is written onto the target. Every
secret-touching task is `no_log: true`.

Controller prerequisites: `community.hashi_vault` collection (in
`requirements.yml`) and the `hvac` Python library (`uv pip install hvac` in the
project venv). SSH access to helios9 is only needed by the bootstrap script (to
mint the secret_id), not by the playbook run itself.

Vars: `secrets_kv_mount`, `secrets_ssh_key_path`, `secrets_ssh_key_field`,
`secrets_ssh_key_dest`.
