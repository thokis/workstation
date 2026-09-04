# xsecurelock

Builds and installs upstream
[xsecurelock](https://github.com/google/xsecurelock) to `/usr/local`.

Plain black background + password prompt (the prompt styling comes from the
`XSECURELOCK_*` env in the `desktop` role's `lockscreen` wrapper). Autotools
build, so the role runs `autogen.sh` then `configure` with a mandatory
`--with-pam-service-name` (`common-auth` on Ubuntu).

Rebuilds only when the checkout changes or the binary is missing.

Vars: `xsecurelock_repo`, `xsecurelock_version` (default `master`),
`xsecurelock_src`, `xsecurelock_bin`, `xsecurelock_pam_service`,
`xsecurelock_build_packages`.
