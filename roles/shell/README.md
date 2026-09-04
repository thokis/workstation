# shell

Bash environment: clones [oh-my-bash](https://github.com/ohmybash/oh-my-bash),
overlays the personal `custom/` dir (aliases/plugins/themes, incl. the `cat`
aliases), and deploys a managed `~/.bashrc` and `~/.profile`.

`.bashrc` config: `robbyrussell` theme; plugins `git/bashmarks/nnn/pyenv`;
completions `git/composer/ssh`; `EDITOR=nvim`; sources `uv`/`cargo` env and nvm
(all guarded on presence); PATH extras.

**Secrets are never in the managed files.** `.bashrc` sources `~/.bashrc.local`
at the end — put machine-local vars and secrets (API keys, etc.) there. The role
creates it empty once and never overwrites it.

> Applying this on a box whose current `.bashrc` still holds secrets (e.g.
> `SOLAREDGE_API_KEY`) will replace that `.bashrc` — move those into
> `~/.bashrc.local` first, or they're lost.

Vars: `shell_omb_repo`, `shell_omb_dir`.
