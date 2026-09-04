# slstatus

Builds and installs upstream [slstatus](https://tools.suckless.org/slstatus/)
(the dwm bar). No fork — the only customization is `config.h`, which this role
**templates** (`templates/config.h.j2`): a `netstatus` run_command segment, a
battery percentage, and a datetime.

The battery device is **auto-detected** per node from
`/sys/class/power_supply/BAT*` (`slstatus_battery`); override in host_vars, or
leave it empty on desktops to drop the battery segment entirely. Rebuilds when
`config.h` changes (e.g. a different battery), the checkout changes, or the
binary is missing.

Vars: `slstatus_repo`, `slstatus_version`, `slstatus_src`, `slstatus_bin`,
`slstatus_battery`, `slstatus_build_packages`.
