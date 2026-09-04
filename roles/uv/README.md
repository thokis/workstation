# uv

Installs [uv](https://astral.sh/uv) (Astral's Python package/tool manager) to
`~/.local/bin/uv` via the official installer, if not already present. Needs
`curl` (provided by the `system` role).

Idempotent: skips when `uv_bin` already exists.

Vars: `uv_bin`, `uv_installer_url`.
