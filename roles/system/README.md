# system

Runs first: bootstraps base packages, then prepares the machine to boot to a
plain text console where the dwm session is launched with `startx` from a tty
login — no graphical display manager.

- Installs `system_base_packages` (git, curl, ca-certificates, build-essential,
  pkg-config, unzip) with a cache refresh, so the later roles can clone and
  build. Runs before every other role.
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

Vars: `system_base_packages`, `system_boot_target`, `system_display_manager`,
`system_grub_remove_params`.

Prerequisites this role does **not** handle (by design):

- **SSH key** for the `git@github.com` fork clones — placed on the box manually
  from Bitwarden, never committed to this repo.
- Run the playbook from a **tty or SSH**, not the GUI session: stopping the
  display manager would otherwise take your session (and the ansible run) down.
