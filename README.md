# DOTFILES ~/.*

## Installation

```bash
git clone --bare git@github.com:chernetskyi/chernetskyi.git --single-branch --branch main "${XDG_DATA_HOME:-$HOME/.local/share}/dotfiles"
git --git-dir="${XDG_DATA_HOME:-$HOME/.local/share}/dotfiles" --work-tree="${HOME}" config --local status.showUntrackedFiles no
git --git-dir="${XDG_DATA_HOME:-$HOME/.local/share}/dotfiles" --work-tree="${HOME}" checkout main
```
