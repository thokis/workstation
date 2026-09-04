# dwm

Builds dwm from **pinned upstream** (`dwm_version`), applies the vendored
`files/pertag-grid.patch` (per-tag layout/mfact/nmaster/bar state + a grid
layout), deploys `files/config.h`, then builds/installs to `/usr/local`. No
fork — the patch + config live here.

To change the config: edit `files/config.h`. To evolve the C patch: apply it to
a checkout, edit, regenerate the diff, and bump `dwm_version` if you rebased onto
newer upstream.
