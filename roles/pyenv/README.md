# pyenv

Installs [pyenv](https://github.com/pyenv/pyenv) + the `pyenv-virtualenv` plugin
to `~/.pyenv`, plus the CPython build dependencies needed to compile Python
versions.

Shell initialization (`PYENV_ROOT`, `pyenv init`) is handled by the oh-my-bash
`pyenv` plugin deployed by the `shell` role — nothing added to `.bashrc` here.

Idempotent: clones with `update: false` (won't clobber an existing checkout).

Vars: `pyenv_repo`, `pyenv_dir`, `pyenv_virtualenv_repo`, `pyenv_build_packages`.
