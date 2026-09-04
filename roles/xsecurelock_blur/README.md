# xsecurelock_blur

Builds and installs [xsecurelock-blur](https://github.com/thokis/xsecurelock-blur)
— the Imlib2 saver that paints a blurred screenshot in the xsecurelock window —
to `~/.local/bin/saver_blur` (no root; user prefix).

Used by the `desktop` role's `lockscreen` wrapper via `XSECURELOCK_SAVER`, and
pairs with the Imlib2 patch in the `xsecurelock` role. Rebuilds only when the
checkout changes or the binary is missing.

Vars: `xsecurelock_blur_repo`, `xsecurelock_blur_version` (default `master`),
`xsecurelock_blur_src`, `xsecurelock_blur_bin`, `xsecurelock_blur_build_packages`.
