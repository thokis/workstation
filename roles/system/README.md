# system

Prepares the machine to boot to a plain text console, where the dwm session is
launched with `startx` from a tty login — no graphical display manager.

- Sets the default systemd target to `{{ system_boot_target }}` (via the
  `/etc/systemd/system/default.target` symlink that `systemctl set-default`
  creates), so the display manager — only wanted by `graphical.target` — never
  starts on boot. Revert with `systemctl set-default graphical.target`.
- Stops `{{ system_display_manager }}` if the unit is present, to cover the
  current boot too (Ubuntu's `gdm` is a `static` unit; a fresh install that has
  it active is what this targets).
- Strips `quiet` and `splash` from `GRUB_CMDLINE_LINUX_DEFAULT` in
  `/etc/default/grub` and runs `update-grub`, so kernel messages are visible and
  no vendor splash is shown. Idempotent — leaves any other cmdline params alone.

Vars: `system_boot_target`, `system_display_manager`, `system_grub_remove_params`.
