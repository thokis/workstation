#!/usr/bin/env bash
# Source the generated .env (OpenBao AppRole creds) and run the playbook.
# Args are passed through to ansible-playbook, e.g.: scripts/provision.sh --tags secrets
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

if [ ! -f .env ]; then
  echo "No .env found. Run scripts/bootstrap-secrets-env.sh first." >&2
  exit 1
fi

set -a
# shellcheck disable=SC1091
. ./.env
set +a

exec ansible-playbook site.yml "$@"
