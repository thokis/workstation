# slstatus

Builds and installs the personal [slstatus](https://github.com/thokis/slstatus)
fork (status bar: netstatus helper, BAT1, datetime) to `/usr/local/bin`.

The status bar reads a `netstatus` helper via `run_command` and expects battery
`BAT1` — both provided by the `desktop` role's scripts and hardware.

Rebuilds only when the checkout changes or the binary is missing.

Vars: `slstatus_repo`, `slstatus_version` (default `master`), `slstatus_src`,
`slstatus_bin`, `slstatus_build_packages`.
