# NVIM config

works in conjuction with [my dotfiles](https://github.com/DarthOstrich/dotfiles)

# Inspired By

https://github.com/kingluddite/nvim

# Self-Assigned NVIM Shorcuts

`ctrl p` : ":Files "
`ctrl f` : ":Rg"

## Clearing Neovim Cache and Plugins

A utility script `clear-nvim-cache.sh` is included in this folder to help you clear Neovim's cache and all lazy.nvim plugin directories. This is useful if you encounter plugin issues or want to force a clean reinstall of all plugins.

**What it does:**
- Removes the Neovim cache directory (`~/.cache/nvim`)
- Removes the lazy.nvim plugin directory (`~/.local/share/nvim/lazy`)

**How to run:**

```sh
cd ~/.config/nvim
./clear-nvim-cache.sh
```

**Warning:** This will delete all plugin and cache files managed by lazy.nvim. The next time you start Neovim, plugins will be reinstalled from scratch.
