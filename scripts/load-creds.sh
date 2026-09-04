#!/usr/bin/env bash
# Credential loader — SOURCE this, don't execute it:
#     source scripts/load-creds.sh
#
# Mints a fresh OpenBao AppRole secret_id over your SSH access to helios9 and
# exports the community.hashi_vault env vars into the CURRENT shell. Then run the
# playbook yourself:  ansible-playbook site.yml
#
# Secrets stay in the shell environment only (never written to disk). If
# ANSIBLE_HASHI_VAULT_SECRET_ID is already set, it's reused (no SSH, no minting).

_bao_helios9="${HELIOS9:-helios9}"
_bao_role="${ROLE:-ansible-provision}"
export ANSIBLE_HASHI_VAULT_ADDR="${ANSIBLE_HASHI_VAULT_ADDR:-https://bao.helios9.org}"
export ANSIBLE_HASHI_VAULT_AUTH_METHOD=approle

if [ -z "${ANSIBLE_HASHI_VAULT_SECRET_ID:-}" ]; then
  echo "Minting AppRole creds from ${_bao_helios9} ..." >&2
  _bao() { ssh "${_bao_helios9}" "docker exec -e BAO_ADDR=http://127.0.0.1:8200 openbao bao $*"; }
  ANSIBLE_HASHI_VAULT_ROLE_ID="$(_bao read -field=role_id "auth/approle/role/${_bao_role}/role-id")"
  ANSIBLE_HASHI_VAULT_SECRET_ID="$(_bao write -f -field=secret_id "auth/approle/role/${_bao_role}/secret-id")"
  unset -f _bao
  if [ -z "${ANSIBLE_HASHI_VAULT_ROLE_ID}" ] || [ -z "${ANSIBLE_HASHI_VAULT_SECRET_ID}" ]; then
    echo "ERROR: could not load credentials from ${_bao_helios9}" >&2
    unset _bao_helios9 _bao_role
    return 1 2>/dev/null || exit 1
  fi
  export ANSIBLE_HASHI_VAULT_ROLE_ID ANSIBLE_HASHI_VAULT_SECRET_ID
fi

unset _bao_helios9 _bao_role
echo "OpenBao AppRole creds loaded into this shell. Now: ansible-playbook site.yml" >&2
