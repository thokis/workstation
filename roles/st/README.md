# st

Builds st from **pinned upstream** (`st_version`), applies the vendored
`files/scrollback-alpha.patch` (scrollback ring buffer + background alpha),
deploys `files/config.h` (Nerd Font, OSC 52, opaque), then builds/installs to
`/usr/local`. No fork — the patch + config live here.
