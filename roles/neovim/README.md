# neovim

Builds Neovim from source and deploys the personal config.

- Installs build deps (`ninja-build`, `gettext`, `cmake`, …) and runtime tools
  (`ripgrep`, `fd-find` for telescope).
- Clones `~/.sources/neovim` at the `stable` tag and builds `RelWithDebInfo` to
  `/usr/local` — rebuilds only when `stable` moves or `nvim` is missing
  (`make distclean` first on a version change).
- Clones the config fork [thokis/kickstart.nvim](https://github.com/thokis/kickstart.nvim)
  into `~/.config/nvim` (kickstart.nvim fork; `upstream` = nvim-lua). Plugins
  install on first `nvim` launch via lazy.nvim; Mason LSP/formatter tooling needs
  the `nodejs` role (run first).
- Registers `nvim.desktop` as the `text/plain` handler.

Vars: `editor_nvim_repo`, `editor_nvim_version` (default `stable`),
`editor_nvim_src`, `editor_config_repo`, `editor_config_version`,
`editor_config_dir`, `editor_packages`.
