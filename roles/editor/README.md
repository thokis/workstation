# editor

Makes nvim the default text editor and viewer. It expects nvim to already be
installed (it comes from a non-apt source), and its settings live in
`defaults/main.yml`.

| Piece | Controls |
|---|---|
| `text/plain=nvim.desktop` (mimeapps.list) | double-click text file → nvim |

This role leans on `terminal`: `nvim.desktop` is `Terminal=true`, so opening a file
runs it inside whatever terminal's `xdg-terminal-exec` keystone resolves to (ghostty).
Without the `terminal` role, it falls back to gnome-terminal.

Verify: `xdg-mime query default text/plain` → `nvim.desktop`
