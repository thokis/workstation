#!/usr/bin/env bash
# Provision this workstation: fetch fresh OpenBao AppRole credentials (over your
# SSH access to helios9), export them for community.hashi_vault, and run the
# playbook. Secrets stay in this process's environment only — never on disk.
#
# Usage:  scripts/provision.sh [ansible-playbook args...]
#   e.g.  scripts/provision.sh --tags secrets
#
# If ANSIBLE_HASHI_VAULT_ROLE_ID/SECRET_ID are already exported, they're reused
# and nothing is minted (no SSH needed).
set -euo pipefail

HELIOS9="${HELIOS9:-helios9}"                  # ssh host alias where OpenBao runs
ROLE="${ROLE:-ansible-provision}"              # OpenBao AppRole name
export ANSIBLE_HASHI_VAULT_ADDR="${ANSIBLE_HASHI_VAULT_ADDR:-https://bao.helios9.org}"
export ANSIBLE_HASHI_VAULT_AUTH_METHOD=approle

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

bao() { ssh "$HELIOS9" "docker exec -e BAO_ADDR=http://127.0.0.1:8200 openbao bao $*"; }

if [ -z "${ANSIBLE_HASHI_VAULT_SECRET_ID:-}" ]; then
  echo "Minting AppRole creds from $HELIOS9 ..." >&2
  export ANSIBLE_HASHI_VAULT_ROLE_ID="$(bao read -field=role_id "auth/approle/role/$ROLE/role-id")"
  export ANSIBLE_HASHI_VAULT_SECRET_ID="$(bao write -f -field=secret_id "auth/approle/role/$ROLE/secret-id")"
fi

exec ansible-playbook site.yml "$@"
