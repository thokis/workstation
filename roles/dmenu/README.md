# dmenu

Builds and installs the personal [dmenu](https://github.com/thokis/dmenu) fork
to `/usr/local/bin`. dmenu itself is stock — it is styled at runtime via dwm's
`dmenucmd` flags — so this role only pins and builds it.

Rebuilds only when the checkout changes or the binary is missing.

Vars: `dmenu_repo`, `dmenu_version` (default `master`), `dmenu_src`,
`dmenu_bin`, `dmenu_build_packages`.
