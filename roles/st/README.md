# st

Builds and installs the personal [st](https://github.com/thokis/st) fork
(scrollback + alpha patches, Nerd Font, OSC 52 clipboard) to `/usr/local/bin`.

Rebuilds only when the checkout changes or the binary is missing.

Vars: `st_repo`, `st_version` (default `master`), `st_src`, `st_bin`,
`st_build_packages`.
