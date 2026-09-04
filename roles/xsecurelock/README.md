# xsecurelock

Builds and installs the personal
[xsecurelock](https://github.com/thokis/xsecurelock) fork to `/usr/local`.

The fork adds an Imlib2 blurred-background patch: with `libimlib2-dev` present,
`configure` enables `HAVE_IMLIB2`, and the lock reads `$XSECURELOCK_BG_IMAGE`
(a blurred screenshot from the `lockscreen` wrapper) to paint behind the auth
prompt. Autotools build, so the role runs `autogen.sh` then `configure` with a
mandatory `--with-pam-service-name` (`common-auth` on Ubuntu).

Rebuilds only when the checkout changes or the binary is missing.

Vars: `xsecurelock_repo`, `xsecurelock_version` (default `master`),
`xsecurelock_src`, `xsecurelock_bin`, `xsecurelock_pam_service`,
`xsecurelock_build_packages`.
