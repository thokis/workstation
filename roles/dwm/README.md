# dwm

Builds and installs the personal [dwm](https://github.com/thokis/dwm) fork
(pertag patch, grid layout, personal `config.h`) to `/usr/local/bin`.

Rebuilds only when the checkout changes or the binary is missing. Local
uncommitted edits to `config.h` are left untouched — rebuild those by hand
(`make && sudo make install`), the role only bootstraps a clean machine.

Vars: `dwm_repo`, `dwm_version` (default `master`), `dwm_src`, `dwm_bin`,
`dwm_build_packages`.
