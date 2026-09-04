# xorg

Installs the X server (`xserver-xorg`) and `xinit` so the dwm session can be
launched with `startx` from a tty.

No per-vendor video driver is installed: the built-in **modesetting** driver
(in `xserver-xorg-core` + glamor) drives AMD (`amdgpu`) and Intel (`i915`)
GPUs, and NVIDIA via `nouveau`. The role detects and reports the active GPU
kernel driver (from `/sys/class/drm/*/device/driver`) for visibility.

Exceptions (opt-in): to install the proprietary NVIDIA driver or a specific
vendor DDX, set `xorg_extra_packages` (e.g. per host_vars). NVIDIA proprietary
is otherwise better handled by `ubuntu-drivers install`.

Vars: `xorg_packages`, `xorg_extra_packages`.
