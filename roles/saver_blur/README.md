# saver_blur

Builds and installs
[xsecurelock-saver-blur](https://github.com/thokis/xsecurelock-saver-blur) — the
Imlib2 saver that paints a blurred screenshot in the xsecurelock window — to
`~/.local/bin/saver_blur` (no root; user prefix).

Used by the `desktop` role's `lockscreen` wrapper via `XSECURELOCK_SAVER`, and
pairs with the Imlib2 patch in the `xsecurelock` role. Rebuilds only when the
checkout changes or the binary is missing.

Vars: `saver_blur_repo`, `saver_blur_version` (default `master`),
`saver_blur_src`, `saver_blur_bin`, `saver_blur_build_packages`.
