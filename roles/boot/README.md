# boot

Prepares the machine to boot to a plain text console, where the dwm session is
launched with `startx` from a tty login — no graphical display manager.

- Stops `{{ boot_display_manager }}` if the unit is present (Ubuntu's `gdm` is a
  `static` unit, so it is only stopped, not disabled — a fresh install that has
  it active is what this targets).
- Strips `quiet` and `splash` from `GRUB_CMDLINE_LINUX_DEFAULT` in
  `/etc/default/grub` and runs `update-grub`, so kernel messages are visible and
  no vendor splash is shown. Idempotent — leaves any other cmdline params alone.

Vars: `boot_display_manager`, `boot_grub_remove_params`.

To also prevent the display manager from starting on future boots (beyond
stopping it), set `multi-user.target` as default or mask the unit — deliberately
left out of scope here.
