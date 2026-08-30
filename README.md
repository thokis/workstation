# workstation

Personal Ubuntu/GNOME setup as Ansible. One role per area.

```bash
ansible-galaxy collection install -r requirements.yml   # once
ansible-playbook site.yml --ask-become-pass             # all
ansible-playbook site.yml --ask-become-pass --tags terminal   # one role
```

## Roles

| Role | What |
|---|---|
| [terminal](roles/terminal/README.md) | ghostty as the terminal for everything |
| [editor](roles/editor/README.md) | nvim as the text editor/viewer |

To add a role, scaffold it with `ansible-galaxy role init roles/<area>`, list it
in `site.yml`, and give it a short README. `pre-commit install` sets up linting
on commit.
